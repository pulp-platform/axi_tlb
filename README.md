# AXI Translation Lookaside Buffer

A Translation Lookaside Buffer (TLB) for [AXI4+ATOPs](https://github.com/pulp-platform/axi) interfaces [originally contributed](https://github.com/pulp-platform/axi/pull/98) to the PULP AXI IP repository. It is passive (i.e. it does *not* update its own page table) and thus primarily intended as an IOTLB.

Depending on your usecase, instantiate

*  `axi_tlb_noreg` if you want your own device or regfile to provide page entries and control.
*  `axi_tlb` if you want to use the included, generated regfile using our [`register_interface`](https://github.com/pulp-platform/register_interface).

## Reconfiguring AXI TLB

To simplify TLB reconfiguration in your project, you can include the GNU Make fragment `axi_tlb.mk` in your makefile, for example:

```make
include $(bender path axi_tlb)/axi_tlb.mk

# Alternative TLB parameters
AXI_TLB_NUMENTRIES = 16
AXI_TLB_ADDRWIDTH = 48

# Rebuild TLB RTL
all: axi_tlb
```

## Simulation

A simple standalone testbench is provided. If you have access to Questa Advanced Simulator, you can run it using the scripts provided in `test`:

```
make vsim
```
