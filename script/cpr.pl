use strict;

use Inline;
use Cwd;
use constant BLIB => cwd('.') . '/.cpr_blib';

my (@cpr, @argv, $script);

BEGIN {
    @argv = @ARGV;
    $script = pop @ARGV;
    open CPR, "< $script"
      or die "Can't open CPR script: $script for input\n$!\n";
    @cpr = <CPR>;
    close CPR;
    shift @cpr if $cpr[0] =~ /^\#\!/;

    if (not -d BLIB) {
	mkdir(BLIB, 0777) or die;
    }

    Inline->import(CPR => [@cpr], BLIB => BLIB);
    exit &main::cpr_main();
}
    
