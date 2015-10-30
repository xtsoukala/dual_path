#!/usr/bin/perl

while(<>){
    chomp;
    if (/^#(\S+?):\s+(\S.+)/){
	printf "\n$_";
	$type = $1;
	$unittmp = $2;
	$unittmp =~ s/:\S+ / /g;
	$unittmp =~ s/ +/ /g;
#	printf "\n$unittmp";
	for $i (split(/ /,$unittmp)){
	    $mapLabelUnit{"$type $i"} = $unitcount{$type}++;
#	    printf " $type $i $unitcount{$type}";
	}
    }
    
    if (/^(mess:.+)/){
	$mess = $1;
	$_ = <>;chomp;
	$sent = "$_.";
	$sent =~ s/^sent:\s+//;
	printf "\nname:{ $sent }";
	printf "\n#$mess";
	printf "\nproc:{ clear";
	$mess =~ s/^mess:\s+//;
	## event semantics
	if ($mess =~ / E=(\S+)/){
	    $evsemstring = ",$1";
	    @evsempart = split(/,/,$evsemstring); 
	    
	    for $x (@evsempart){
		if ($x =~ /[A-z]+/){
		    $num = $mapLabelUnit{"eventsemantics $x"};
		    $evsemstring =~ s/,$x/ $num/;
		}
	    }
	    $mess =~ s/ E=(\S+) +/ ;tlink$evsemstring/;
	}
	## roles
	for $x (0 .. $unitcount{"roles"}){
	    $num = $mapLabelUnit{"roles $1"} if $mess =~ /([A-Z])=/;
	    $mess =~ s/([A-Z])=/;link $num /;
	}
	## lexical semantics
	$mess =~ s/,/ /g;
	for $x (0 .. $unitcount{"semantics"}){
	    $num = $mapLabelUnit{"semantics $1"} if $mess =~ /([A-Z]+) /;
#	    printf "\n ### ERROR $x $num $1 " if $num == 0;
	    $mess =~ s/([A-Z]+) /$num /;
	}
	printf " $mess;} ";

	@sentlist = split(/ /,$sent);
	printf "\n%d",$#sentlist + 1;
	for $word (@sentlist){
	    printf "\ni:{targ 1.0} %d",$mapLabelUnit{"lexicon $word"};
	    printf "\nt:{word 1.0} %d",$mapLabelUnit{"lexicon $word"};
	    printf " # ERROR word '$word' is not in lexicon " if !$mapLabelUnit{"lexicon $word"};
	}
	printf ";";
    }
}
	
