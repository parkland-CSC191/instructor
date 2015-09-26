select 'alter table '||table_name||' drop constraint '||constraint_name||' cascade;'
from user_constraints
where constraint_type <> 'R'
order by table_name, constraint_type
/
