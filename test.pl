use strict;
use Test;
BEGIN {
    plan(tests => 1, 
	 todo => [],
	 onfail => sub {},
	);
    mkdir('./cpr_blib', 0777) unless -d './cpr_blib';
}

use Inline Config => BLIB => './cpr_blib/';
use Inline CPR => <<'END';

int main(void) {
        
    printf("Hello World, I'm running under Perl version %s\n",
           CPR_eval("use Config; $Config{version}")
          );

    return 42;
}

END

# test 1
ok(cpr_main == 42);
