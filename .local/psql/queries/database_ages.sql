with settings as (
    select
        current_setting('autovacuum_freeze_max_age')::numeric
            as xid_max_age,
        current_setting('autovacuum_multixact_freeze_max_age')::numeric
            as mxid_max_age
)

select
    d.datname,
    d.datfrozenxid,
    age(d.datfrozenxid) as xid_age,
    round(100 * age(d.datfrozenxid)::numeric / s.xid_max_age, 2)
        as xid_pct_of_max_age,
    d.datminmxid,
    mxid_age(d.datminmxid) as mxid_age,
    round(100 * mxid_age(d.datminmxid)::numeric / s.mxid_max_age, 2)
        as mxid_pct_of_max_age
from pg_database d
cross join settings s
order by mxid_age desc, xid_age desc
;
