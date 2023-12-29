Analog IC Term Project: closed-loop DM AC response

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
                       
.param rfb=50k   * Your feedback resistance

Xop Vinp Vinn vdd vss vop von vocm my_op 

rload1 von 0 rload
rload2 vop 0 rload
cload1 von 0 cload
cload2 vop 0 cload
rtest1 Vinn test2 rfb
rtest2 Vinp test1 rfb
rtest3 Vinn Vop rfb
rtest4 Vinp Von rfb

vdd vdd 0 dc supplyp
vgnd vss 0 dc supplyn
vocm vocm 0 dc comon
                                                                                
vinp test1 0 dc comon ac 0.5 0
vinn test2 0 dc comon ac 0.5 180
                                                                                
.ac dec 10 10 1g
.probe ac vdb(vop,von) vp(vop,von)
                                                                                
.meas ac dcgain_in_db max vdb(vop,von)
.meas ac dcgain max vm(vop,von)

.end
