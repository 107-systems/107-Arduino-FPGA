`107-Arduino-Viper`
===================
[![Build Status](https://travis-ci.org/107-systems/107-Arduino-Viper.svg?branch=master)](https://travis-ci.org/107-systems/107-Arduino-Viper)

<p align="center">
  <a href="https://github.com/107-systems/107-Arduino-Viper"><img src="https://github.com/107-systems/.github/raw/main/logo/viper.jpg" width="40%"></a>
</p>

## Organisation Overview
#### :floppy_disk: Software
- [`107-Arduino-MCP2515`](https://github.com/107-systems/107-Arduino-MCP2515)

Arduino library for interfacing with a MCP2515 CAN transceiver via **SPI** in order to transmit/receive CAN frames.

- [`107-Arduino-BMP388`](https://github.com/107-systems/107-Arduino-BMP388)

Arduino library for interfacing with a BMP388 sensor via **SPI** in order retrieve barometric pressure for altitude estimation.

- [`107-Arduino-TMF8801`](https://github.com/107-systems/107-Arduino-TMF8801)

Arduino library for interfacing with a TMF8801 sensor via **I2C** in order to determine distance to ground when landing.

- [`107-Arduino-NMEA`](https://github.com/107-systems/107-Arduino-NMEA)

Arduino library for interfacing with a PA1010D GPS (MTK3333 chipset) sensor via **UART** in order to obtain GPS information during outdoor flight- .

- [`107-Arduino-FLIR-Lepton`](https://github.com/107-systems/107-Arduino-FLIR-Lepton)

Arduino library for interfacing with the FLIR Lepton sensor via **SPI**.

- [`107-Arduino-UAVCAN`](https://github.com/107-systems/107-Arduino-UAVCAN)

Arduino library providing an Arduino-style abstraction of [libcanard](https://github.com/UAVCAN/libcanard) for interfacing with the Zubax [Orel 20](https://kb.zubax.com/display/MAINKB/Zubax+Orel+20) ESCs via [UAVCAN](https://uavcan.org/).

- [`107-Arduino-BNO085`](https://github.com/107-systems/107-Arduino-BNO085)

Arduino library for interfacing with the BNO085 IMU.

- [`107-Arduino-Viper`](https://github.com/107-systems/107-Arduino-Viper)

Arduino library + sketches utilising all aforementioned libraries to achieve the desired end goal of using the Arduino MKR Vidor 4000 as a quadcopter flight controller.

#### :hammer: Hardware

- [`VidorCameraAdapter`](https://github.com/107-systems/VidorCameraAdapter)

Connects the downward facing OV2640 with the MiniPCIe connector of the Arduino MKR Vidor 4000.

- [`ViperBaseboard`](https://github.com/107-systems/ViperBaseboard)

Connects the Arduino MKR Vidor 4000 with all the other relevant sensors and actuators, provides power distribution, etc.

- [`ViperMechanics`](https://github.com/107-systems/ViperMechanics)

Mechanical parts, e.g. for mounting the ESCs to the quadcopter frame.

## Repository Overview
This repository contains the [firmware](examples/Viper-Firmware/Viper-Firmware.ino), VHDL code and Arduino library for the MKR VIDOR 4000 FPGA powering the Viper quadcopter.

#### `examples`
This folder contains examples which demonstrate how to use the Arduino library to interface with the FPGA as well as the overall Viper Quadcopter firmware.

#### `extras`
##### `extras/rtl`
This directory contains the Register-Transfer-Level VHDL code intended to be to synthesized for the MKR VIDOR 4000 FPGA. In order to analyse the VHDL code and run testbenches [GHDL](http://ghdl.free.fr/) needs to be installed after which it can be invoked via `make`.
```bash
sudo apt-get install ghdl gtkwave
cd rtl
make all
```

##### `extras/syn`
This directory contains the [Quartus Version 19.1.0 Build 670 09/22/2019 SJ Lite Edition](https://fpgasoftware.intel.com/?edition=lite) synthesis project for generating the FPGA configuration file for the Cyclone 10 FPGA (*10CL016YU256C8G*) mounted on the MKR VIDOR 4000.

#### `src`
This directory contains the Arduino library for interfacing with the FPGA.
