with
    produtos as (
        select *
        from {{ ref('stg_erp__produtos') }}
    ),
    fornecedores as (
        select *
        from {{ ref('stg_erp__fornecedores') }}
    ),
    categorias as (
        select *
        from {{ ref('stg_erp__categorias') }}
    ),
    joined as (
        select
            produtos.PK_PRODUTOS
            ,produtos.NM_PRODUTO
            ,produtos.FK_FORNECEDOR
            ,produtos.FK_CATEGORIA
            ,produtos.QUANT_UNID
            ,produtos.PRECO_UNID
            ,produtos.QUANT_ESTOQUE
            ,produtos.UNID_PEDIDO
            ,produtos.NVL_PEDIDO
            ,produtos.IS_DISCONTINUADO
            ,categorias.NM_CATEGORY
            ,categorias.DS_CATEGORY
            ,fornecedores.NM_FORNECEDOR
            ,fornecedores.CIDADE_FORNECEDOR
            ,fornecedores.PAIS_FORNECEDOR
        from produtos
        left join categorias on produtos.fk_categoria = categorias.pk_categoria
        left join fornecedores on produtos.fk_fornecedor = fornecedores.pk_fornecedor
    )
select *
from joined 