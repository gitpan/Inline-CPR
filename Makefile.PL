use ExtUtils::MakeMaker;
WriteMakefile(
	      NAME => 'Inline::CPR',
	      VERSION_FROM => 'CPR.pm',
	      PREREQ_PM => {Inline => '0.30'},
	      EXE_FILES => ['./script/cpr.pl'],
# 	      PL_FILES => {'bin/synopsis.PL' => 
#			   [
#			    '$(INSTALLBIN)', 
#			    'examples/synopsis.cpr',
#			   ],
#			  },
	      clean => {FILES => 'examples/ .cpr_blib/ cpr_blib/'},
	     );


sub MY::processPL {
    <<'END';
# --- MakeMaker processPL section:

all :: examples/synopsis.cpr
	@$(NOOP)

examples/synopsis.cpr :: bin/synopsis.PL
	$(PERL) -I$(INST_ARCHLIB) -I$(INST_LIB) -I$(PERL_ARCHLIB) -I$(PERL_LIB) bin/synopsis.PL $(INSTALLBIN)

END
}
