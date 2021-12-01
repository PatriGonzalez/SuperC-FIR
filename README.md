[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.5746714.svg)](https://doi.org/10.5281/zenodo.5746714)

# SuperC-FIR
Netlist for Finite Impulse Response (FIR) filter using temporal and pulse-stream encoding

# Description

A bash script executes three steps: 
* Stimulus generation: Using octave we randomly generate inputs and coefficients for the MAC unit and convert it to puls-streams and RL. Then in perl, we use this numbers to generate the stimulus to execute one Multiply-Accumulation (MAC) operation. 
* Circuit simulation: using WRSPICE we launch a simulation to obtain the result of a single MAC operation.
* Post-processing: We use octave to identify and count the pulses from the output of WRSPICE simulation result.

We repeat this process for a number of iterations that can be set. 

# Software dependencies

* WRSPICE: Open source circuits simulation and analysis tool, available in Linux, Apple OS X, and Microsoft Windows. 
* Octave: Open source scientific programming language compatible with Matlab. 
* Perl: Portable programming language. 
* Bash: Unix shell and command language.

# Use example

After installing the software dependencies, download the github repository and run `launch_sim.sh` in a terminal. 

# Expected results

* The inputs, coefficients and expected result in file `stimulus.txt`
* The MAC result from the WRSPICE simulation in `result.txt`
* An average error obtained from the MAC unit. i.e.
```//////////////////////////////////////////////////////////////////////
The average error in 20 MAC operations is 3.35
//////////////////////////////////////////////////////////////////////```
The expected error should not be larger than 5.

# Experiment customization
The number of iterations can be set by opening the `launch_sim.sh` and modify the end of the for loop. That is, `for i in {1..<ITERATION>`.

