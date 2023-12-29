*dufferential amp without CMFB
.prot
.lib 'cic018.l' TT
.unprot
.option post
+unwrap
.option ABSTOL=1e-7 RELTOL=1e-7 POST=1 CAPTAB ACCURATE=1 DELMAX=1e-9
.param ws=4.7u
.param wn=15u
.param wp=40u

**********************circuit************************

MM1 OUT1 node1 net15 VSS N_18 W='wn' L=0.5u m=1   
MM2 OUT2 node2 net15 VSS N_18 W='wn' L=0.5u m=1

MMS net15 VX VSS VSS N_18 W='ws' L=1u m=2

MM3 OUT1 net18 VDD VDD P_18 W='wp' L=1.2u m=5      
MM4 OUT2 net18 VDD VDD P_18 W='wp' L=1.2u m=5

*****************source and component****************

Vac in gnd ac 1  
Eac1 node1 VCM in gnd 0.5
Eac2 node2 VCM in gnd -0.5
VCM VCM gnd dc 0.78
VX VX gnd dc 0.53
VDD VDD gnd dc 1.5
VSS VSS gnd dc 0

RF1 OUT1 net18 305k
RF2 OUT2 net18 305k 
                                         
*************measurement and analysis****************
.op
*.dc wp 0.3u 50u 0.05u
.meas dc volt find i(mms) when VDD=1.5
.ac dec 10 100 100G
.tf v(OUT1,OUT2) Vac
.pz v(OUT1,OUT2) Vac
.end
