#!/bin/bash
####################################
# Author     : LPGG
# Description: run WRSPICE command
#              for file wrapper.cir
#################################### 

export wrspice=/usr/local/xictools/wrspice/bin/wrspice

#$wrspice -m /usr/local/xictools/wrspice.current/devkit/examples/jj/module_dist/jj.so wrapper.cir

$wrspice -m /usr/local/xictools/wrspice.current/devkit/examples/jj/module_dist/jj.dylib wrapper.cir
