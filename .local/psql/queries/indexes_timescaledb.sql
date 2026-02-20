with
data as (
    select
        i.schemaname as schema_name,
        i.relname as table_name,
        i.indexrelname as index_name,
        case
            when h.table_name is not null
                then hypertable_index_size(i.indexrelid)
            else pg_relation_size(i.indexrelid)
        end as index_bytes
    from pg_stat_user_indexes i
    left join _timescaledb_catalog.hypertable h
        on h.schema_name = i.schemaname
        and h.table_name = i.relname
    where i.schemaname not in ('pg_catalog', '_timescaledb_internal')
),

data2 as (
    select
        null as schema_name,
        '*** TOTAL ***' as table_name,
        null as index_name,
        sum(index_bytes) as index_bytes
    from data
    union all
    select null, null, null, null
    union all
    select *
    from data
)

select
    coalesce(nullif(schema_name, 'public') || '.', '')
    || table_name as "Table",
    index_name as "Index",
    pg_size_pretty(index_bytes) as "Size",
    round(
        100
        * index_bytes::numeric
        / nullif(
            sum(index_bytes) over (
                partition by (schema_name is null), left(table_name, 3) = '***'
            ),
            0
        ),
        2
    )::text || '%' as "% of Total"
from data2
where schema_name is distinct from 'information_schema'
order by schema_name is null desc, index_bytes desc nulls last
;
