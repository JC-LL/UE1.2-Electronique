echo "======= analyzing vhdl files ======"
echo "=> controler_pkg.vhd"
ghdl -a --work=accelerator_lib controler_pkg.vhd
echo "=> controler.vhd"
ghdl -a --work=accelerator_lib controler.vhd
echo "=> datapath.vhd"
ghdl -a --work=accelerator_lib datapath.vhd
echo "=> fsmd.vhd"
ghdl -a --work=accelerator_lib fsmd.vhd
echo "=> fsmd_tb.vhd"
ghdl -a --work=accelerator_lib fsmd_tb.vhd

echo "======= elaborating simulation ======"
