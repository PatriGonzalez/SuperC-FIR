

#- Some very basic, insuficient sanity checks
if ($#coeffArray < $taps-1){ die "Missing coefficients\n"};
if ($#xArray < $taps-1) {die "Missing Inputs $#xArray \n"};

#- Open stimulus file
my $fileName = "./stimulus.cir";
print "INFO: Circuit File: $fileName \n";
open(my $FH, '>', $fileName) or die $!;

#- Generate as many inputs as TAPs
print $FH "\n*- INFO: The inputs in race logic \n";
my $lSig  = 1;
my $lSigm = $lSig+1;
my $i     = 0;
$td       = $init_del;
foreach my $in (@xArray) {
  if ($in==0){  #(-MSB)
    #- Just doing nothing seems ok   
  }else{
     $in = $in+$td;
     my $inp = $in+50;
     my $inm = $in-50;
     print $FH "Vs$vN n$lSig 0 pwl 0 $v1 ${inm}p $v1 ${in}p $v2 ${inp}p $v1\n";
     print $FH "Rs$vN n$lSig n$lSigm  100\n";
     print $FH "Xs${vN}_sfq n$lSigm nX$i VCC dcsfq\n";
     $vN=$vN+1;
     $lSig=$lSig+2;
     $lSigm=$lSig+1;
     $i = $i+1;
     print $FH "\n";
   }
}

$i  = 0;        #- keeps track of the Tap
print $FH "\n*- INFO: Coefficients\n";

foreach my $coef (@coeffArray) {
   my @bitArray = split('',$coef);
   my $j = 0;  #- Keeps track of the bit
   print $FH  "**-INFO: Tap: $i\n";
   foreach my $bit (@bitArray) {
      my $out="n$i$j";
      my $k; my $m; 
      if ($i==0){
        if ($j==0){$k='';}
        else{$k=$j-1; $k=$i.$k.'s';}
        $m=$j.'a';
      }elsif($j==0){
        $k=$i-1;
        my $k1=$bitsN-1; $k=$k.$k1.'s'; 
        $m=$i-1; $m=$m.$k1.'s';
      }else{
        $k = $j-1; $k=$i.$k.'s';
        $m=$j.'s';
      }
      if ($i==0) {$m=$j.a}
      else {$m=$i-1; $m=$m.$j.'s';}
      print $FH  "  X$instN SET_COEF${k} SET_COEF$i${j}s SET_COEF$i$j VCC split\n";
      $instN = $instN + 1;
      print $FH  "  X$instN RST_COEF${k} RST_COEF$i${j}s RST_COEF$i$j VCC split\n";
      $instN = $instN + 1;
      print $FH  "  X$instN nP$m nP$i${j}s nP$i$j VCC split\n";
      $instN = $instN + 1;
      if ($bit){
         print $FH  "  X$instN SET_COEF$i$j NCC$i$j RST_COEF$i$j nP${i}${j} $out VCC ndro_il\n\n";
      }else{
         print $FH  "  X$instN 0 NCC$i$j RST_COEF$i$j nP${i}${j} $out VCC ndro_il\n\n";
      } 
      $instN   = $instN + 1;
      $j   = $j + 1;
   }
   $i = $i + 1;
};

close($FH);
