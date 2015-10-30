#!/usr/bin/perl

open(SUMSTAT,"head comp2000.ex |");
while(<SUMSTAT>){
  $japanese = "j" if /grammar: gramNihon/;
}
system "diffdir.perl > sumdiffdir";

sub getNum{
    opendir(DIR,".");
    @files = grep { s/sim([0-9]+)\w*/$1/ } readdir(DIR);
    $max = 0;
    for $i (@files){
        $i =~ s/^0+//g;
        $max = $i if $i > $max;
    }
    $max++;
    $max = "0$max" if $max < 10;
    return($max);
}

$max = getNum;

if (!$ARGV[0]){
    open(GO,"< go");
    while(<GO>){ chomp;$repeatnum = $_ if /\S/; }
    $dirname = sim.$max."sub".$repeatnum.$japanese;
}

$dirname = "sim$max".$ARGV[0].$japanese if $ARGV[0];
system "
mkdir $dirname;
echo $dirname > summary
grep '##' sum*comp* >> summary
mv results/res7* .
rm results/exp* results/res* 
mv res7* results/
mv *.wt.gz results
mv results sum* error* $dirname
cp * $dirname
cp -r env $dirname
cp -f .orig/* $dirname/
cp -f .orig/env/* $dirname/env/
#mv -f $dirname/comp.orig $dirname/comp.in
gzip $dirname/sum*test $dirname/sum*train $dirname/sum*heavy  &
rm sp*.ex
"
