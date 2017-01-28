#!/usr/bin/perl

sub readCategories{
    while(<>){
	chomp;
	last if /\}/;
	$evsem = 1 if /^#event/;
	s/\t/ /g;
	s/\s+/ /g;
	print if /^#roles:/;
	next if /^\#/;
	s/ +$//g;
	if ($evsem){
	    ($category, $rest) = /^(\S+) (.+)/;
	    @{$catHash{$category}} = split(/ /,$rest);
	    $evsemList .= uc " $rest";
	}else {
	    ($category, $syncat, $rest) = /^(\S+) (\S+) (.+)/;
	    push @syncatorder,$syncat if !$semHash{$syncat};
	    $semHash{$syncat} .= uc " $rest";
	    @{$catHash{$category}} = split(/ /,$rest);
	}
#	printf "\n $category @{$catHash{$category}}";
    }
    for $i (@syncatorder){
	$semList .= " :$i$semHash{$i}";
    }
    #remove duplicate
    for $i (split(/ /,$semList)){
	next if $i !~ /[A-Z]+/;
	$semList =~ s/ ($i( \S+)*?) $i / $1 /g;
    }
    printf "\n#semantics:$semList";
    printf "\n#lexicon:".lc($semList);
    printf "\n#eventsemantics:".$evsemList;

}

sub readConstruction{
    $categoryIndex=0;   ## distinguishes different constructions
    while(<>){
	chomp;
	next if !/\S/;
	next if /^\#/;
	last if /\}/;
	s/ +/ /g;
	($category, $rest) = /^(\S+): +(.+)/;
	$categoryLabel = $category.$categoryIndex; 
	@{$constructionHash{$categoryLabel}} = split(/ /,$rest);
	$constWholeHash{$categoryLabel} = $rest;
#	printf "\n $categoryLabel @{$constructionHash{$categoryLabel}}";

	$categoryIndex++ if $category eq "sent";
	push @constructionSel,$categoryLabel if $category eq "mess";
    }
}

sub readRewrite{
    while(<>){
	chomp;
	next if !/\S/;
	next if /^\#/;
	last if /\}/;
	$allrules .= $_;
    }
 #   printf "\nallrules $allrules";
}

sub generate{
    my ($numUtt) = @_;
    for $num (1 .. $numUtt){
	$structNum = int(rand($#constructionSel + 1));
	printf "\nmess: ";
	$mess = "";
	$sentframe = " ".$constWholeHash{"sent$structNum"}." ";
	for $phrase (@{$constructionHash{"mess$structNum"}}){
	    ($role,$rest) = $phrase =~ /([A-Z])=(.+)/;
	    $mess .= " $role=";
	    @phrasePart = split(/,/,$rest); 
	    for $sci (0 .. $#phrasePart){
		$sc = $phrasePart[$sci];
		if ($catHash{$sc}){
		    @catArr = @{$catHash{$sc}};
		    $randWord = $catArr[int(rand($#catArr + 1))];
		    $mess .= "$randWord,";
		    $sentframe =~ s/ $role$sci/ $randWord/;
#		    print "\nsentframe $role $sci $sentframe";
		}else {
		    $mess .= "$phrasePart[$sci],";
		}
	    }
	}
	$mess .= " ";
	$mess =~ s/M=\S+//g;
	$mess =~ s/,+ / /g;
	$mess =~ s/,+$/ /g;
	$mess = uc($mess);
	printf " $mess ";

	$_ = $sentframe;
	eval $allrules;
	$sentframe = $_;
	printf "\nsent:  $sentframe";
    }
}


$arguments = "@ARGV";
srand(100);
$num = 20;
if ($arguments =~ /-n (\d+)/){
    $num = $1;
    srand($num);  # randomize on size by default
    shift @ARGV;
    shift @ARGV;
}

if ($arguments =~ /-s (\d+)/){
    srand($1); 
    shift @ARGV;
    shift @ARGV;
}

while(<>){
    readCategories if /^categories/;
    readConstruction if /^constructions/;
    readRewrite if /^sent-rewrite/;
}


generate($num);

