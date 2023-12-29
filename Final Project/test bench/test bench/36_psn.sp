Analog IC Term Project: open-loop PS- AC response

.lib 'cic018.l' tt
.unprotect
.option post acout=0 accurate
.include "op.sp" 

.param rload=25k   * Your resistive load
.param cload=5p   * Your capacitive load

.param supplyp=1.5 * Your positive supply voltage
.param supplyn=0    * Your negative supply voltage
.param comon=0.75 * Your output common mode voltage

Xop  Vinp Vinn vdd vss vop von vocm my_op 

rload1 von 0 rload
rload2 vop 0 rload
cload1 von 0 cload
cload2 vop 0 cload

vdd vdd 0 dc supplyp
vgnd vss 0 dc supplyn ac 1
vocm vocm 0 dc comon

vinp vinp 0 dc comon
vinn vinn 0 dc comon

.ac dec 10 10 1g

.meas ac psn_in_db find vdb(vop) at=10k
.end
