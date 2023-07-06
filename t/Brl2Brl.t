#!/usr/bin/perl
use strict;
use warnings;
use utf8;
use Test::Simple tests => 3;
use App::Brl2Brl;
my $path;
if( $ENV{'LOUIS_TABLEPATH'} ){
  $path = $ENV{'LOUIS_TABLEPATH'};
} else {
  $path = "/usr/share/liblouis/tables";
} # if
my $brl_obj = App::Brl2Brl->new( {
  path => "$path",
  from_table_file => "unicode.dis",
  to_table_file => "en-us-brf.dis",
  warn => 1,
} ) or die "Couldn't initialize the braille object.";

ok( defined $brl_obj, ' The new() returned something' );
ok( $brl_obj->isa( 'App::Brl2Brl' ), " It's class is App::Brl2Brl" );
my $in = "⠁⠃⠉⠂";
my $out = $brl_obj->switch_brl_char_map( $in );
ok( $out =~ /ABC1/, ' The switch_brl_char_map works.' );
