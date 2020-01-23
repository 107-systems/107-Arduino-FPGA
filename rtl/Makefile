all: analyze

analyze:
	ghdl -a grpPackages/pkgViper/viper-p.vhd
	ghdl -a grpOV2640/pkgOV2640Defs/OV2640Defs-p.vhd	
	ghdl -a grpOV2640/unitOV2640/OV2640-e.vhd	
	ghdl -a grpOV2640/unitOV2640/OV2640-Rtl-a.vhd
	ghdl -a unitSynchronizer/Synchronizer-e.vhd
	ghdl -a unitSynchronizer/Synchronizer-Rtl-a.vhd
	ghdl -a unitVidor/Vidor-e.vhd
	ghdl -a unitVidor/Vidor-Rtl-a.vhd

