col WAITER_MACHINE for a30
col BLOCKER_MACHINE for a30

select a.sid WAITER_SID, a.machine WAITER_MACHINE, b.sid BLOCKER_SID, b.machine BLOCKER_MACHINE
from v$session a, v$session b
where a.BLOCKING_SESSION is not null
and a.BLOCKING_SESSION = b.sid
/
