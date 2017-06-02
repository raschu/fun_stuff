#anna_numbers.pl: this script was inspired by some homework of my kids.
#see also https://de.wikipedia.org/wiki/Zahlenpalindrom
#Ralph Schuler, 2. Juni 2017

use strict;
use warnings;
use Data::Dumper;

my @z;
my %res;
my $cnt = 0;

for my $f (1001..9889) {
	push(@z, $f) if substr($f, 0, 1) == substr($f, 3, 1) and substr($f, 1, 1) == substr($f, 2, 1);
}

for my $r (sort @z) {
	for my $i (sort @z) {
		my $sum = $r - $i;
		next if $sum <= 0;
		my $rf = substr($r, 0, 1);
		my $rs = substr($r, 1, 1);
		my $if = substr($i, 0, 1);
		my $is = substr($i, 1, 1);
		next unless $rf == $is;
		next unless $rs == $if;
		$cnt++;
		printf("(%02d)\t$r - $i = %04d ", $cnt, $sum);
		print "#" for (1..int((($sum / 100)) + 1) / 2);
		print "\n";
		$res{$sum} = 1;
	}
}

print Dumper \%res;
