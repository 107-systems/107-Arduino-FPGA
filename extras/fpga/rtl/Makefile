all: analyze

analyze:
	ghdl -a grpPackages/pkgViper/viper-p.vhd
	ghdl -a grpOV2640/pkgOV2640Defs/OV2640Defs-p.vhd
	ghdl -a grpOV2640/unitFrequencyDivider/FrequencyDivider-e.vhd
	ghdl -a grpOV2640/unitFrequencyDivider/FrequencyDivider-Rtl-a.vhd
	ghdl -a grpOV2640/unitOV2640/OV2640-e.vhd
	ghdl -a grpOV2640/unitOV2640/OV2640-Rtl-a.vhd
	ghdl -a grpRgbLed/pkgRgbLedDefs/RgbLedDefs-p.vhd
	ghdl -a grpRgbLed/unitRgbLedEncoder/RgbLedEncoder-e.vhd
	ghdl -a grpRgbLed/unitRgbLedEncoder/RgbLedEncoder-Rtl-a.vhd
	ghdl -a unitSynchronizer/Synchronizer-e.vhd
	ghdl -a unitSynchronizer/Synchronizer-Rtl-a.vhd
	ghdl -a grpSpi/unitSpiSynchronizer/SpiSynchronizer-e.vhd
	ghdl -a grpSpi/unitSpiSynchronizer/SpiSynchronizer-Rtl-a.vhd
	ghdl -a -P=altera_mf/ ../ip/syspll.vhd
	ghdl -a unitViperQuadcopterTop/ViperQuadcopterTop-e.vhd
	ghdl -a unitViperQuadcopterTop/ViperQuadcopterTop-Rtl-a.vhd
