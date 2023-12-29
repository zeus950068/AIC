*hw3 feedback amplifier
.prot
.lib 'cic018.l' TT
.unprot
.option post
.option ABSTOL=1e-7 RELTOL=1e-7 POST=1 CAPTAB ACCURATE=1 DELMAX=1e-9

******************circuit************************
M2 Vout g VDD VDD p_18 W=35u L=0.34u m=1
M1 Vout g VSS VSS n_18 W=43.4u L=0.34u m=3
************source and component***************
RF g Vout 3k
CL Vout gnd 0.5p
Cg g gnd 0.5p
VSS VSS gnd dc 0
VDD VDD gnd dc 1.5
Iin gnd g ac 1
Rs g gnd 100k

**********measurement and anayze*************
.op
.ac dec 10 100 100G
.tf v(Vout) Iin
.pz v(Vout) Iin
.probe v(Vout)
.probe vp(Vout)
.meas AC gmax MAX vdb(Vout)
.meas AC BW when vdb(Vout)='gmax-3'

.end

