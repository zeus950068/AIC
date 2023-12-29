*hw1_CS MOS

.prot
.lib 'cic018.l' TT
.unprot
.option post

*circuits
M1 vout g gnd gnd n_18 W=0.85u L=0.18u m=2

*components and sources
RL vdd vout 13.2k
RS in g 10k
CL vout gnd 0.5pf

VDD vdd gnd dc 1.5
VGS b gnd dc 0.64
Vi in b ac 1

*simulation and anaysis
.op
.tf v(vout) vi
.DC vgs 0 1.5 0.001
.probe v(vout)
.probe d_gain=deriv(‘v(vout)’) 
.meas DC d_av find deriv('v(vout)') when v(vi)=1

.ac dec 10 1 1000g 
.pz v(vout) vi 
.probe vdb(vout) vp(vout)
.meas AC gmax MAX vdb(vout)
.meas AC BW when vdb(vout)='gmax-3'

.end





