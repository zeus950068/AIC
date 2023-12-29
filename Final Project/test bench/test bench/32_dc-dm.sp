Analog IC Term Project: open-loop DM DC sweep

.protect
.lib 'cic018.l' tt
.unprotect
.option post acout=0 accurate
.include "op.sp" 

.param rload=25k   * Your resistive load
.param cload=5p   * Your capacitive load

.param supplyp=1.5 * Your positive supply voltage
.param supplyn=0    * Your negative supply voltage
.param comon=0.75 * Your output common mode voltage

Xop Vinp Vinn vdd vss vop von vocm my_op 

rload1 von 0 rload
rload2 vop 0 rload
cload1 von 0 cload
cload2 vop 0 cload

vdd vdd 0 dc supplyp
vgnd vss 0 dc supplyn
vocm vocm 0 dc comon

.param sweepv=0

vinp vinp 0 dc 'comon+sweepv'
vinn vinn 0 dc 'comon-sweepv'

.dc sweepv  -0.1  0.1  0.00001

.meas dc vomax max v(vop)
.meas dc vomin min v(von)
.meas dc vodmax max v(vop,von)
.meas dc vodmin min v(vop,von)

.end
