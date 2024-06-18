with
    fonte_categorias as (
        select  
            cast(ID as int) as pk_categoria,
            cast(CATEGORYNAME as varchar) as nm_categorias,
            cast(DESCRIPTION as varchar) as ds_category
        from {{ source('erp', 'category') }}
    )

select *
from fonte_categorias