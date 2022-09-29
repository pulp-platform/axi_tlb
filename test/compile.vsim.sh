set -e

[ ! -z "$VSIM" ] || VSIM=vsim

bender script vsim -t test -t rtl \
    --vlog-arg="-svinputport=compat" \
    --vlog-arg="-override_timescale 1ns/1ps" \
    --vlog-arg="-suppress 2583" \
    > compile.vsim.tcl
echo 'return 0' >> compile.vsim.tcl

$VSIM -c -do 'exit -code [source compile.vsim.tcl]'