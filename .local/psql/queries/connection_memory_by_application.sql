select
    coalesce(a.application_name, '[not in pg_stat_activity]') as application_name,
    count(*) as processes,
    pg_size_pretty(sum(p.rss) * 1000) as total_memory_overhead
from pg_proctab() p
left join pg_stat_activity a
    on a.pid = p.pid
where p.comm = 'postgres'
group by coalesce(a.application_name, '[not in pg_stat_activity]')
order by sum(p.rss) desc;
