set -e

[ ! -z "$VSIM" ] || VSIM=vsim

echo "vsim tb_axi_tlb -t 1ps  -voptargs="+acc"; log -r /*" > start.vsim.tcl

$VSIM -c -do 'exit -code [source start.vsim.tcl; run -a]'