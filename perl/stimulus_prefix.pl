#!/usr/bin/perl

##############################################
## Author      : LPGG 
## Date        : Feb-03-2021
## Description : Some help building a superC
##               FIR
## Generating stimulus
#############################################

my $bitsN=7;
my $taps=4;
my $instN=1;
my $init_del = $bitsN*$taps*8;
my $clk_per = calc_clock($taps,$bitsN) + 5; #- Period
my $v1=0;
my $v2='50m';

sub calc_clock{
   my $taps  = $_[0]; #- Taps 
   my $bitsN = $_[1]; #- Number of bits
   # my %library_delay = %{get_library_delay()};
   #my $tff         = $library_delay{'tff2'};
   #my $split       = $library_delay{'splitter'};
   my $tff         = 18.0;
   my $split       = 2.16;
   my $t_clk = $tff*$bitsN + 2*$split + 0;
   return $t_clk;
};

