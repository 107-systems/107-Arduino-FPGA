107-Arduino-Viper
=================
[![Build Status](https://travis-ci.org/107-systems/107-Arduino-Viper.svg?branch=master)](https://travis-ci.org/107-systems/107-Arduino-Viper)

This repository contains the [firmware](examples/Viper-Firmware/Viper-Firmware.ino), VHDL code and Arduino library for the MKR VIDOR 4000 FPGA powering the Viper quadcopter.

## `examples`
This folder contains examples which demonstrate how to use the Arduino library to interface with the FPGA as well as the overall Viper Quadcopter firmware.

## `extras`
### `extras/rtl`
This directory contains the Register-Transfer-Level VHDL code intended to be to synthesized for the MKR VIDOR 4000 FPGA. In order to analyse the VHDL code and run testbenches [GHDL](http://ghdl.free.fr/) needs to be installed after which it can be invoked via `make`.
```bash
sudo apt-get install ghdl gtkwave
cd rtl
make all
```

### `extras/syn`
This directory contains the [Quartus Version 19.1.0 Build 670 09/22/2019 SJ Lite Edition](https://fpgasoftware.intel.com/?edition=lite) synthesis project for generating the FPGA configuration file for the Cyclone 10 FPGA (*10CL016YU256C8G*) mounted on the MKR VIDOR 4000.

## `src`
This directory contains the Arduino library for interfacing with the FPGA.
