# viper-vidor-fpga
This repository contains the VHDL code for the MKR VIDOR 4000 FPGA powering the Viper quadcopter.

## RTL
This directory contains the Register-Transfer-Level VHDL code intended to be to synthesized for the MKR VIDOR 4000 FPGA. In order to analyse the VHDL code and run testbenches [GHDL](http://ghdl.free.fr/) needs to be installed after which it can be invoked via `make`.
```bash
sudo apt-get install ghdl gtkwave
cd rtl
make all
```

