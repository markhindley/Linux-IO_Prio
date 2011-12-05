use Test::More;
use Linux::IO_Prio qw(:all);

BEGIN {
    if( $^O ne 'linux' ) {
    	plan skip_all => 'implemented.t tests only useful on Linux: skipping';
    }
    elsif (Linux::IO_Prio::_load_syscall()) {
	plan tests => 5;	
    }
    else {
	plan skip_all => 'syscall.ph not available: skipping';
    }
};

ok(ioprio_set(IOPRIO_WHO_PROCESS, $$, IOPRIO_PRIO_VALUE(IOPRIO_CLASS_IDLE, 0)) == 0);

ok(ioprio_get(IOPRIO_WHO_PROCESS, $$));

ok(ionice(IOPRIO_WHO_PROCESS, $$, IOPRIO_CLASS_IDLE, 0) == 0);

ok(ionice_class(IOPRIO_WHO_PROCESS, $$) == IOPRIO_CLASS_IDLE);

ok(ionice_data(IOPRIO_WHO_PROCESS, $$) == 0);
