Analog IC Term Project: closed-loop 10KHz THD

.protect
.lib 'cic018.l' tt
.unprotect
.option post acout=0 accurate DELMAX=1e-9
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

Vi1 test1 vocm SIN(0  0.25 100k 0 0 0)    $100KHz test tone
Vi2 test2 vocm SIN(0 -0.25 100k 0 0 0)

.tran 1ns 1ms

.four 100k V(vop,von)
.four 100k V(vop)
.four 100k V(von)
.probe tran vout=par('V(vop,von)') vin=par('V(test1,test2)') 
.end
