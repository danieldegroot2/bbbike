#!/usr/bin/env perl
# -*- perl -*-

#
# $Id: plz.t,v 1.6 2003/10/08 07:33:06 eserte Exp $
# Author: Slaven Rezic
#
# Copyright (C) 1998,2002,2003 Slaven Rezic. All rights reserved.
# This program is free software; you can redistribute it and/or
# modify it under the same terms as Perl itself.
#
# Mail: slaven@rezic.de
# WWW:  http://bbbike.sourceforge.net/
#

#
# Diese Tests k�nnen fehlschlagen, wenn "strassen" oder "plaetze" erweitert
# wurde. In diesem Fall muss die Testausgabe per Augenschein �berpr�ft oder
# mit der Option -create aktualisiert werden.
#

package main;

use Test;
BEGIN { plan tests => 30 }

use FindBin;
use lib ("$FindBin::RealBin/..", "$FindBin::RealBin/../data", "$FindBin::RealBin/../lib");
use PLZ;
use Strassen;
use File::Basename;
use Getopt::Long;
use Data::Dumper;

use strict;

my $tmpdir = "$FindBin::RealBin/tmp/plz";
my $create;
my $test_file = 0;
my $INTERACTIVE;
my $in_str;
my $goto_xxx;
my $extern = 1;

if (!GetOptions("create!" => \$create,
		"xxx!" => \$goto_xxx,
		"v" => \$PLZ::VERBOSE,
		"extern!" => \$extern,
	       )) {
    die "Usage: $0 [-create] [-xxx] [-v] [-[no]extern]";
}

# XXX auch Test mit ! -small

use constant STREET   => 0;
use constant MATCHINX => 1;
use constant NOMATCH  => 2;

my @in_str;
if (defined $in_str) {
    $INTERACTIVE = 1;
    @in_str = ([$in_str]);
} else {
    # Array-Definition:
    # 0: gesuchte Stra�e
    # 1: bei mehreren Matches: Index des Matches, der schlie�lich genommen wird
    # 2: 1, wenn f�r diese Stra�e nichts gefunden werden kann
    @in_str =
      (
       ['KURFUERSTENDAMM',0],
       ['duden'],
       ['methfesselstrasse'],
       ['garibaldi'],
       ['heerstr', 1],
       ['fwefwfiiojfewfew', undef, 1],
       ['mollstrasse',0],
      );
    if ($create) {
	print "# Test files are written to $tmpdir.\n";
    } else {
	print "# Test files read from $tmpdir.\n";
	print "# If there are non-fatal errors, try to re-run this script with -create\n";
    }
}

my $plz = new PLZ;
if (!defined $plz) {
    if ($INTERACTIVE) {
	die "Das PLZ-Objekt konnte nicht definiert werden";
    } else {
	ok(0);
	exit;
    }
}
ok(1);

my $dump = sub {
    my $obj = shift;
    Data::Dumper->new([$obj],[])->Indent(1)->Useqq(1)->Dump;
};

my @standard_look_loop_args =
    (
     Max => 1,
     MultiZIP => 1, # introduced because of Hauptstr./Friedenau vs. Hauptstr./Sch�neberg problem
     MultiCitypart => 1, # works good with the new combine method
     Agrep => 'default',
     Noextern => !$extern,
    );

if ($goto_xxx) { goto XXX }

testplz();

if (0 && !$INTERACTIVE) { # XXX geht noch nicht
    my $f = "/tmp/" . basename($plz->{File}) . ".gz";
    system("gzip < $plz->{File} > $f");
    if (!-f $f) {
	ok(0);
	exit;
    }
    $plz = new PLZ $f;
    if (!defined $plz) {
	ok(0);
	exit;
    }
    ok(1);

    @in_str =
      (
       ['duden', <<EOF],
Columbiadamm
Dudenstr.
Friesenstr. (Kreuzberg, Tempelhof)
Gol�ener Str.
Gro�beerenstr. (Kreuzberg)
Heimstr.
J�terboger Str.
Katzbachstr.
Kreuzbergstr.
Mehringdamm
Methfesselstr.
Monumentenstr.
M�ckernstr.
Schwiebusser Str.
Yorckstr.
Z�llichauer Str.
EOF
      );
    testplz();
}

{
    my @res = $plz->look("Hauptstr.", MultiZIP => 1);
    ok(scalar @res, 8, $dump->(\@res));
    @res = map { $plz->combined_elem_to_string_form($_) } $plz->combine(@res);
    ok(scalar @res, 7, $dump->(\@res));

    @res = $plz->look("Hauptstr.", MultiCitypart => 1, MultiZIP => 1);
    ok(scalar @res, 9, $dump->(\@res));
    @res = map { $plz->combined_elem_to_string_form($_) } $plz->combine(@res);
    ok(scalar @res, 7, $dump->(\@res));
    my($friedenau_schoeneberg) = grep { $_->[1] =~ /friedenau/i } @res;
    ok($friedenau_schoeneberg->[PLZ::LOOK_NAME], "Hauptstr.");
    ok($friedenau_schoeneberg->[PLZ::LOOK_CITYPART], "Friedenau, Sch\366neberg");
    ok($friedenau_schoeneberg->[PLZ::LOOK_ZIP], "10827, 12159");

    @res = $plz->look_loop(PLZ::split_street("Heerstr. 1"),
			   @standard_look_loop_args);
    ok(scalar @{$res[0]}, 7, $dump->(\@res));
    ok(grep { $_->[PLZ::LOOK_NAME] eq 'Heerstr.' } @{$res[0]});

    @res = $plz->look_loop(PLZ::split_street("Stra�e des 17. Juni"),
			   @standard_look_loop_args);
    ok(scalar @{$res[0]}, 2, $dump->(\@res));

    @res = $plz->look_loop(PLZ::split_street("  Str. des 17. Juni 153  "),
			   @standard_look_loop_args);
    ok(!!(grep { $_->[PLZ::LOOK_NAME] eq 'Stra�e des 17. Juni' } @{$res[0]}), 1,
       $dump->(\@res));

    @res = $plz->look_loop(PLZ::split_street("gaertnerstrasse 22"),
			   @standard_look_loop_args);
    ok(!!(grep { $_->[PLZ::LOOK_NAME] eq 'G�rtnerstr.' } @{$res[0]}), 1,
       $dump->(\@res));

## This is too hard: the algorithm can't strip "strasse" because of the missing
## "s". Well...
#      @res = $plz->look_loop(PLZ::split_street("KAnzowtrasse 1"),
#  			   @standard_look_loop_args);
#      ok(!!(grep { $_->[PLZ::LOOK_NAME] eq 'Kanzowstr.' } @{$res[0]}), 1,
#         $dump->(\@res));

#require Data::Dumper; print STDERR "Line " . __LINE__ . ", File: " . __FILE__ . "\n" . Data::Dumper->new([$plz->look_loop(PLZ::split_street("Strasse d. 17 Juni 142"),			   @standard_look_loop_args)],[])->Indent(1)->Useqq(1)->Dump; # XXX

    @res = $plz->look_loop(PLZ::split_street("Grossbeerenstr. 27a"),
			   @standard_look_loop_args);
    ok(!!(grep { $_->[PLZ::LOOK_NAME] eq 'Gro�beerenstr.' } @{$res[0]}), 1,
       $dump->(\@res));

    @res = $plz->look_loop(PLZ::split_street("Leibnizstrasse 3-4"),
			   @standard_look_loop_args);
    ok(!!(grep { $_->[PLZ::LOOK_NAME] eq 'Leibnizstr.' } @{$res[0]}), 1,
       $dump->(\@res));

 XXX:
    @res = $plz->look_loop(PLZ::split_street("Sanderstr. 29/30"),
			   @standard_look_loop_args);
    ok(!!(grep { $_->[PLZ::LOOK_NAME] eq 'Sanderstr.' } @{$res[0]}), 1,
       $dump->(\@res));

}


sub testplz {

    foreach my $noextern (0, 1) {
	foreach my $def (@in_str) {
	    $in_str = $def->[STREET];
	    my($str_ref) = $plz->look_loop($in_str,
					   Max => 20,
					   Agrep => 3,
					   Noextern => $noextern,
					  );
	    my(@str) = @$str_ref;
	    if ($def->[NOMATCH]) {
		ok(scalar @str, 0);
		next;
	    }
	    if (!@str) {
		if ($INTERACTIVE) {
		    die "Keine Stra�e in der PLZ gefunden"
		} else {
		    ok(0, 1, "Keine Stra�e f�r $in_str gefunden");
		    next;
		}
	    }

	    my $str;
	    if (@str == 1) {
		$str = $str[0];
	    } else {
		if ($INTERACTIVE) {
		    my $i = 0;
		    foreach (@str) {
			print $i+1 . ": $_->[STREET] ($_->[NOMATCH])\n";
			$i++;
		    }
		    print "> ";
		    chomp(my $res = <STDIN>);
		    $str = $str[$res-1];
		} else {
		    $str = $str[$def->[MATCHINX]];
		}
	    }
	    my $plz_re = $plz->make_plz_re($str->[2]);
	    my @res1 = $plz->look($plz_re, Noextern => 0, Noquote => 1);
	    $str = new Strassen "strassen";

	    my @s = ();
	    foreach ($str->union(\@res1)) {
		push(@s, $str->get($_)->[0]);
	    }

	    my $printres = join("\n", sort @s) . "\n";

	    if ($INTERACTIVE) {
		print $printres;
	    } else {
		do_file($printres);
	    }
	}
    }

}

sub do_file {
    my $res = shift;
    my $file = ++$test_file;

    if ($create) {
	if (!-d $tmpdir) {
	    require File::Path;
	    File::Path::mkpath([$tmpdir]);
	}
	open(T, ">$tmpdir/$file") or die "Can't create $tmpdir/$file: $!";
	print T $res;
	close T;
	1;
    } else {
	if (open(T, "$tmpdir/$file")) {
	    my $buf = join '', <T>;
	    close T;

	    ok($buf, $res);
	} else {
	    warn "Can't open $tmpdir/$file: $!. Please use the -create option first and check the results in $tmpdir!\n";
	    ok(0);
	}
    }
}
