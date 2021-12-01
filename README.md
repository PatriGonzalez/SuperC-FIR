[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.5746714.svg)](https://doi.org/10.5281/zenodo.5746714)

# SuperC-FIR
Netlist for Finite Impulse Response (FIR) filter using temporal and pulse-stream encoding

# Description

A bash script executes three steps: (i) a stimulus generator in perl and octave to create the stimulus file with inputs and filter coefficients randomly generated for a Multiply-Accumulation (MAC) operation. (ii) Then it launches a WRSPICE simulation of the FIR filter. (iii) Finally we use octave to post-process the WRSPICE simulation results. 

# Software dependencies

* WRSPICE: Open source circuits simulation and analysis tool, available in Linux, Apple OS X, and Microsoft Windows. 
* Octave: Open source scientific programming language compatible with Matlab. 
* Perl: Portable programming language. 
* Bash: Unix shell and command language.

# Use example

After installing the software dependencies, download the github repository and run launch_sim.sh in a terminal. 

# Expected results

* The inputs, coefficients and expected result in file \textit{stimulus.txt}.
* The MAC result from the WRSPICE simulation in \textit{result.txt}
* An average error obtained from the MAC unit. i.e.
    
//////////////////////////////////////////////////////////////////////
The average error in 20 MAC operations is 3.35
//////////////////////////////////////////////////////////////////////

The expected error should not be larger than 5.

# Experiment customization
The number of iterations can be set by opening the \textit{launch\_sim.sh} and modify the end of the \textit{for loop}. That is, \textit{for i in {1..<ITERATION>}}.

