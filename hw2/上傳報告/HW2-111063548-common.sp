*hw1_differential pair

.prot
.lib 'cic018.l' TT
.unprot
.option post
.option ABSTOL=1e-7 RELTOL=1e-7 POST=1 CAPTAB ACCURATE=1 DELMAX=1e-9

*circuit
M1 vop g1 s gnd n_18 W=0.31u L=0.18u m=10
M2 von g2 s gnd n_18 W=0.31u L=0.18u m=10
MS s vbs1 gnd gnd n_18 W=0.51u L=0.18u m=10

*source and components
VDD vdd gnd dc 1.5

RD1 vdd vop 14.3k
RS1 g1 vi_p 10k
 
RD2 vdd von 14.3k
RS2 g2 vi_n 10k

CL1 vop gnd 0.5p
CL2 von gnd 0.5p

Vac in gnd ac sin(0 32.5m 1x 0)     
Eac1 vi_p vbs in gnd 1
Eac2 vi_n vbs in gnd 1
VBS vbs gnd dc 0.65

VBS1 vbs1 gnd dc 0.61

*simulation
.op
*.dc Vac -1.5 1.5 0.01
.ac dec 10 100 100G
.tf v(vop) Vac
.pz v(vop,von) vac
.meas AC gmax MAX vdb(vop,von)
.meas AC BW when vdb(vop,von)='gmax-3'
.meas DC d_av find deriv('v(vop,von)') when v(vac)=1 

*THD
.tran 0.1us 10us
.four 1x v(vop)
.four 1x v(von)
.four 1x v(vop,von)


.end




