with
    fonte_fornecedores as (
        select  
            cast(C1 as int) as  pk_fornecedor
            , cast(C2 as varchar) as  nm_fornecedor
            , cast(C6 as varchar) as  city_fornecedor
            , cast(C9 as varchar) as  pais_fornecedor
from {{ source('erp', 'supplier') }}
        where c1 != 'id'
    )

select *
from fonte_fornecedores