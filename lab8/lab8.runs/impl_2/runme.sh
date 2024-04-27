#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
# 

if [ -z "$PATH" ]; then
  PATH=/home/cedar/Xilinx/SDK/2018.3/bin:/home/cedar/Xilinx/Vivado/2018.3/ids_lite/ISE/bin/lin64:/home/cedar/Xilinx/Vivado/2018.3/bin
else
  PATH=/home/cedar/Xilinx/SDK/2018.3/bin:/home/cedar/Xilinx/Vivado/2018.3/ids_lite/ISE/bin/lin64:/home/cedar/Xilinx/Vivado/2018.3/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=/home/cedar/Xilinx/Vivado/2018.3/ids_lite/ISE/lib/lin64
else
  LD_LIBRARY_PATH=/home/cedar/Xilinx/Vivado/2018.3/ids_lite/ISE/lib/lin64:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='/home/cedar/Documents/School/TAMU/2021/Autumn/ECEN 248/Laboratory Material/Lab 8/lab8/lab8.runs/impl_2'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

# pre-commands:
/bin/touch .init_design.begin.rst
EAStep vivado -log clock_divider.vdi -applog -m64 -product Vivado -messageDb vivado.pb -mode batch -source clock_divider.tcl -notrace


