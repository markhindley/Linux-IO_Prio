use Test::More tests =>11;
use POSIX qw(ENOSYS);

BEGIN { $^O = 'unknown';
	use_ok('Linux::IO_Prio', (':all'));
    };

ok(ioprio_set(IOPRIO_WHO_PROCESS, $$, IOPRIO_PRIO_VALUE(IOPRIO_CLASS_IDLE, 0)) == -1);
ok($! == ENOSYS);

ok(ioprio_get(IOPRIO_WHO_PROCESS, $$) == -1);
ok($! == ENOSYS);

ok(ionice(IOPRIO_WHO_PROCESS, $$, IOPRIO_CLASS_IDLE, 0) == -1);
ok($! == ENOSYS);

ok(ionice_class(IOPRIO_WHO_PROCESS, $$) == -1);
ok($! == ENOSYS);

ok(ionice_data(IOPRIO_WHO_PROCESS, $$) == -1);
ok($! == ENOSYS);
