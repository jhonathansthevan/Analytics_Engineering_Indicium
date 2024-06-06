with
    fonte_produtos as (
        select  
            cast(ID as int) as pk_produtos
            , cast(PRODUCTNAME as varchar) as nm_produto
            , cast(SUPPLIERID as int) as fk_fornecedor
            , cast(CATEGORYID as int) as fk_categoria
            , cast(QUANTITYPERUNIT as varchar) as quant_unid
            , cast(UNITPRICE as numeric(18,2)) as preco_unid
            , cast(UNITSINSTOCK as int) as quant_estoque
            , cast(UNITSONORDER as int) as unid_pedido
            , cast(REORDERLEVEL as int) as nvl_pedido
            , case
                when DISCONTINUED = 0 then false
                when DISCONTINUED = 1 then true
            end as is_discontinuado
            from {{ source('erp', 'product') }}
    )

select *
from fonte_produtos