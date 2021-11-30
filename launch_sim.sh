#!/bin/zsh

##############################################
# Author      : LPGG 
# Date        : Feb-03-2021
# Description : Some help launching FIR 
#               simulations
#############################################

#- Clean last simulation
rm -rf output

#- Create file for new simulation
mkdir output
cp octave/* output/
cp perl/* output/
cp spice_netlist/* output/
cd output

for i in {1..5}
  do 
     echo "$i iteration"
     #- Call Octave to generate the input and the expected output
     /Applications/Octave-4.4.1.app/Contents/Resources/usr/bin/octave-octave-app data4spice.m
     #- Create the perl file to generate the circuit input
     cat stimulus_prefix.pl stimulus.pl stimulus_sufix.pl > stimulus_builder.pl
     perl stimulus_builder.pl
     #- Run the simulation
     ./start_wrspice_script.sh
     #- Clean the file
     sed '/Index/d' file.txt > file1.txt
     sed '/--/d' file1.txt > file.txt
     sed -E 's/[\t ]+/,/g' file.txt > file1.txt
     rm -rf file.txt
     mv file1.txt file.txt
     #- Postprocessing
     /Applications/Octave-4.4.1.app/Contents/Resources/usr/bin/octave-octave-app dataFromSpice.m
     #- Clean
     rm -rf stimulus_builder.pl
     rm -rf stimulus.cir
     rm -rf file.txt 
     rm -rf file1.txt
 done

/Applications/Octave-4.4.1.app/Contents/Resources/usr/bin/octave-octave-app finalPostProcessing.m

cd ../

mv output/stimulus.txt .
mv output/result.txt .
