#!/usr/bin/perl

sub readGramHash{
    open(GRAM,"< gramhash");
    while(<GRAM>){
	chomp;
	$gramhash{$_}++;
    }
    $gramhash{"read"}++;
    close(GRAM);
}

sub readLexicon{
    my ($lexicon) = @_;
    my @lex = split(/ /,$lexicon);
    my $cat = "NOUN";
    for $i (@lex){
	$wcat = "";
	if ($i =~ /:([a-z]+)/){
	    $cat = uc $1;
	}
	$wcat = "PER" if $i =~ /^per$/;
	$wcat = "MOD" if $i =~ /-par/;
	$wcat = "PRON" if $i =~ /^(he|she|her|him|i|me|you|it|they|them)$/;
	$wcat = "AUX" if $i =~ /^(is|are|was|were|am)$/;
	$wcat = $cat if $wcat eq "";
	$mapsyncat{"$i"} = $wcat;
#	printf "\ni $i cat $wcat";
    }
    ## result $mapsyncat
}

readGramHash if -f "gramhash";

sub tagUtt{
    my ($utter) = @_;
    my @utt = split(/ /,$utter);
    my $synutt = "";
    my $mesutt = "";
    for $i (@utt){
	next if $i !~ /\S/;
	last if $i eq "per";
	$synutt .= $mapsyncat{$i}." ";
	
	$mesutt .= $mapsyncat{$i}.":".$i." ";
    }
    return($synutt,$mesutt,@utt);
}

sub messProcess{
    my ($type) = @_;
    my $structure = "";
    #mes is set already

    $mes{$type} = " $mes{$type} ";

    ## create noun phrases
    $mes{$type} =~ s/(DET:\S+) NOUN:/$1,NOUN:/g;
    $mes{$type} =~ s/(DET:\S+) ADJ:/$1,ADJ:/g;
    $mes{$type} =~ s/(ADJ:\S+) NOUN:/$1,NOUN:/g;
    $mes{$type} =~ s/ PRON:/ NP:PRON:/g;
    $mes{$type} =~ s/ (DET:\S+NOUN:)/ NP:$1/g;
    $mes{$type} =~ s/ (NOUN:)/ NP:$1/g;
    
    $mes{$type} =~ s/ NUM:\S+//g;   # remove number 
    $mes{$type} =~ s/NP:DET:\S+?,/NP:/g; # remove determiners
    
    $mes{$type} =~ s/ PREP:with/ WITH/g;

    if ($mestype =~ /p|t/){ ## record structure for synprime
	$structure{"$type$mestype"} = $mes{$type};
	$structure{"$type$mestype"} =~ s/ NP:\S+/ NP/g;
	$structure{"$type$mestype"} =~ s/ MOD:-ing/ ING/g;
	$structure{"$type$mestype"} =~ s/ MOD:-par/ PAR/g;
	$structure{"$type$mestype"} =~ s/ MOD:\S+//g;
	$structure{"$type$mestype"} =~ s/ PAR PREP:by/ PAR BY/g;
#	$structure{"$type$mestype"} =~ s/ PREP:with/ WITH/g;
	$structure{"$type$mestype"} =~ s/ V\S+/ VERB/g;
	$structure{"$type$mestype"} =~ s/ AUX VERB NP/ VERB NP/g;
	$structure{"$type$mestype"} =~ s/:[a-z-]+//g;
	$structure{"$type$mestype"} =~ s/^ +//g;
	$structure{"$type$mestype"} =~ s/ +$//g;
    }
    
    $mes{$type} =~ s/ MOD:-(ed|ss|ing)//g; # remove modifier
    
    ## equate alternations
    $mes{$type} =~ s/(NP:\S+) AUX:\S+ (VTRAN:\S+) MOD:-par PREP:by (NP:\S+) (.*)/$3 $2 $1 $4 FLIP/;
    $mes{$type} =~ s/((VDAT|VBENE):\S+) (NP:\S+) PREP:(to|for) (NP:\S+)/$1 $5 $3 FLIP/;
    $mes{$type} =~ s/((VTRAN|VSPRAY):\S+) (NP:\S+) PREP:\S+ (NP:\S+)/$1 $4 WITH $3 FLIP/;

    $flip{$type} = 0;
    $flip{$type} = 2 if $mes{$type} =~ /FLIP.+?FLIP/;
    $flip{$type} = 1 if $mes{$type} =~ /FLIP/;
    $mes{$type} =~ s/ FLIP//g;

    $mes{$type} =~ s/AUX:\S+ (V\S+)/$1/;
    
    if ($type eq "act"){  ## process starts after both tar and act are retrieved
	printf "\nmestar: $mes{tar}";
	printf "\nmesact: $mes{act}";

	### mark possible island
	$islandverb = "";
	$islandstruct = $synutt{"tar"};
	$islandstruct =~ s/ NUM//g;
	$islandstruct =~ s/DET NOUN/NP/g;
	$islandstruct =~ s/DET ADJ NOUN/NP/g;
	$islandstruct =~ s/PRON/NP/g;
	$islandstruct =~ s/NOUN/NP/g;
	$islandstruct =~ s/(VTRAN|VBENE)/VERB/g;
	if ($islandstruct =~ /NP VERB( MOD)* NP *$/){
	    $islandverb = $1 if $mes{"tar"} =~ /V\S+?:([a-z]+)/;
	    $count{" island $islandverb all"}++;
	}
	###

	if ($mes{"tar"} eq $mes{"act"}){  ## message same
	    printf " mescorr";
	    $count{"mes=$mestype"}++;

	    if ($flip{"tar"} != $flip{"act"}){
		printf " flipped";
		$count{"flip=$mestype"}++;
	    }else{
		## do verb islands
		if ($islandverb ne ""){
		    printf " island $islandverb";
		    $count{" island $islandverb"}++;
		}
	    }
	    $count{"flip=$mestype all"}++;
	}else{
	    printf " meswrong";
	}
	$count{"mes=$mestype all"}++;

	## synprime
	if ($mestype eq "t"){ ## show synprime
	    printf "\nsynprime prime $structure{tarp}";
	    printf " target $structure{tart}";
	    printf " act $structure{actt}";
	    ## reset cells
	    $count{"synprime target $structure{tart} prime $structure{tarp}"} = 0 if !$count{"synprime target $structure{tart} prime $structure{tarp}"};
	    $count{"synprime prime $structure{tarp} all"} = 0 if !$count{"synprime prime $structure{tarp} all"};

	    if ($mes{"tar"} eq $mes{"act"}){  ## message same
		$count{"synprime target $structure{actt} prime $structure{tarp}"}++;
		$count{"synprime prime $structure{tarp} all"}++;
	    }
	}
    }
    # results mes count
}

sub gramProcess{
    my ($type) = @_;
    # prepare utterance for grammatical check
    $gramutt{$type} = " $synutt{$type} ";
    $gramutt{$type} =~ s/ V\S+/ VERB/g;
    
    if ($type eq "act"){  ## print out results
	
	$gramhash{$gramutt{"tar"}}++;
	
	printf "\nsyntar: $synutt{tar} ";
	printf "\nsynact: $synutt{act} ";
	
	if ($gramhash{$gramutt{"act"}}){
	    printf "= gram";
	    $count{"gram=$mestype"}++;
	}else{
	    printf "= ungram";
	}
	$count{"gram=$mestype all"}++;

    }
}

while(<>){
    chomp;
    readLexicon($1) if (/^\#lexicon: (.+)/);
    if (/name:/){
	$mestype = "_";
	$mestype = "$1" if / \#([^} ])/;
    }

    printf "\n$_";
    if (/(tar|act): (.+)/){
	$type = $1;
	my @uttcopy;
	($synutt{$type},$mes{$type},@uttcopy) = tagUtt($2);
	gramProcess($type);

#	messProcess($type);

	$sentcorr = 1;
	if ($type eq "act"){
	    for $i (0 .. $#lastuttcopy){
#		if ($lastuttcopy[$i] ne "per"){
		    if ($uttcopy[$i] eq $lastuttcopy[$i]){
			$count{"word=$mestype"}++;
		    }else {
			$sentcorr = 0;
		    }
		    $count{"word=$mestype all"}++;
#		}
	    }
	    printf " WRONG " if !$sentcorr;
	    $count{"sent=$mestype"}++ if $sentcorr;
	    $count{"sent=$mestype all"}++;

	    $count{" struct $synutt{tar}"}++ if $sentcorr;
	    $count{" struct $synutt{tar} all"}++;
	}
	@lastuttcopy = @uttcopy;
    }

}

sub writeGramHash{
    printf "\nwriting gramhash";
    open(GRAM,"> gramhash");
    for $i (sort keys %gramhash){
	printf GRAM "$i\n";
    }
    close(GRAM);
}

writeGramHash if ! -f "gramhash";

printf "\n##results ";
for $i (sort keys %count){
    next if $i !~ /synprime/;
    next if $i =~ / all/;
    $d = $i;
    $d =~ s/ target .+? (prime .+)/ $1 all/;
#    $d =~ s/ prime .+/ all/;
    $count{$i} = 0 if !$count{$i};
    if ($count{$d} > 0 ){
	printf "\n##$i corr c %d t %d",$count{$i},$count{$d};
	printf " perc %d%",$count{$i}/$count{$d}*100;
    }
}
for $d (sort keys %count){
    next if $d !~ / all/;
    next if $d =~ /synprime/;
    $i = $d;$i =~ s/ all//;
    $count{$i} = 0 if !$count{$i};

    printf "\n##$i corr c %d t %d perc %d%",$count{$i},$count{$d},$count{$i}/$count{$d}*100 if ($count{$d} > 0);
}
