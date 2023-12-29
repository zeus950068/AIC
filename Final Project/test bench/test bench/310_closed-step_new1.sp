Analog IC Term Project: closed-loop step response+ 

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

Vi1 test1 0 pulse(0.5 1.0 50ns 5n 5n 20.05us)
Vi2 test2 0 pulse(1.0 0.5 50ns 5n 5n 20.05us) 

.tran 0.1ns 20.05us

.PROBE tran vout=par('v(vop,von)') vin=par('v(vtest1,vtest2)') 

.meas tran final1 find v(vop) at 20.049us
.meas tran hlimit1 param='final1*1.005'
.meas tran llimit1 param='final1*0.995'
.meas tran htime1 when v(vop)=hlimit1 cross=last
.meas tran ltime1 when v(vop)=llimit1 cross=last
.meas tran pos_settling param='max(htime1,ltime1)-50n' 

.meas tran final2 find v(von) at 20.049us
.meas tran hlimit2 param='final2*1.005'
.meas tran llimit2 param='final2*0.995'
.meas tran htime2 when v(von)=hlimit2 cross=last
.meas tran ltime2 when v(von)=llimit2 cross=last
.meas tran neg_settling param='max(htime2,ltime2)-50n'

.meas tran begin1 find v(vop) at 1ns
.meas tran SRp_V1 param='begin1*0.9 + final1*0.1'
.meas tran SRp_V2 param='begin1*0.1 + final1*0.9'
.meas tran SRp_time TRIG v(vop) VAL=SRp_V1 RISE=1
+                   TARG v(vop) VAL=SRp_V2 RISE=1
.meas tran SRp_diff param='SRp_V2-SRp_V1'
.meas tran SRp param='(SRp_V2-SRp_V1)/SRp_time'

.meas tran begin2 find v(von) at 1ns
.meas tran SRn_V1 param='begin2*0.9 + final2*0.1'
.meas tran SRn_V2 param='begin2*0.1 + final2*0.9'
.meas tran SRn_time TRIG v(von) VAL=SRn_V1 FALL=1
+                   TARG v(von) VAL=SRn_V2 FALL=1
.meas tran SRn_diff param='SRn_V1-SRn_V2'
.meas tran SRn param='(SRn_V1-SRn_V2)/SRn_time'

.probe i(xop.cc1)

.end
