use Test::More tests => 6;

BEGIN { $^O = 'linux';
	use_ok('Linux::IO_Prio', (':all'));
    };

ok(ioprio_set(IOPRIO_WHO_PROCESS, $$, IOPRIO_PRIO_VALUE(IOPRIO_CLASS_IDLE, 0)) == 0);

ok(ioprio_get(IOPRIO_WHO_PROCESS, $$));

ok(ionice(IOPRIO_WHO_PROCESS, $$, IOPRIO_CLASS_IDLE, 0) == 0);

ok(ionice_class(IOPRIO_WHO_PROCESS, $$) == IOPRIO_CLASS_IDLE);

ok(ionice_data(IOPRIO_WHO_PROCESS, $$) == 0);
