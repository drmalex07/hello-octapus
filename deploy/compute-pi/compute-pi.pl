#!/usr/bin/perl -w -l
use autodie;
use bignum;
use Getopt::Std;

my %opts = ();
getopts("p:o:", \%opts);

my ($outfile, $out);
if (defined $opts{o}) {
    $outfile = $opts{o};
    open ($out, '>&', STDOUT);
    open (STDOUT, '>', $outfile);
}

my $numdigits = 10;
if (defined $opts{p}) {
    $numdigits = $opts{p};
}

print bignum::bpi($numdigits);
