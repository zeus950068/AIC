************************************************************************
*hw4:2 stage opa 
.prot
.lib 'cic018.l' TT
.unprot
.option post
+unwrap
.option ABSTOL=1e-7 RELTOL=1e-7 POST=1 CAPTAB ACCURATE=1 DELMAX=1e-9
.param x=10u
.param y=10u

**********************circuit************************
*upper pmos
Mb1 net6 net6 VDD VDD P_18 W=20u L=180.00n m=1
Mb2 net25 net6 VDD VDD P_18 W=10u L=180.00n m=1
Mb3 Vout net6 VDD VDD P_18 W=10u L=180.00n m=1

*current mirror_pmos
M3 net16 net16 gnd gnd N_18 W='y' L=800.00n m=1
M4 net12 net16 gnd gnd N_18 W='y' L=800.00n m=1
*current mirror_nmos
MM1 net16 Vin_negative net25 net25 P_18 W='x' L=400.00n m=1
MM2 net12 Vin_positive net25 net25 P_18 W='x' L=400.00n m=1

*output
M5 Vout net12 gnd gnd N_18 W=27.5u L=400.00n m=1


*****************source and component****************
VDD VDD gnd dc 1.5
VSS gnd gnd dc 0
Iref net6 gnd dc 100u
*Vac in gnd ac 1  
*Eac1 Vin_positive VCM in gnd 0.5
*Eac2 Vin_negative VCM in gnd -0.5
VCM Vin_positive gnd dc 0.75
Cc net12 net50 0.15pf
Rc net50 Vout 9.5k
Co Vout gnd 0.5p

Rf Vin_negative Vout 100k
Ri Vacin Vin_negative 100k
Vacin Vacin gnd pwl(0ns 0.3v 10ns 1.2v)      
*Vacin Vacin gnd pwl(0ns 1.2v 10ns 0.3v)     

*************measurement and analysis****************
.op
.ac dec 10 100 100G
.tf v(Vout) Vacin 
.pz v(Vout) Vacin
.meas ac phase find vp(Vout) at = unit_gain_frequency
.meas AC phase_margin param='180+phase'
.meas AC gmax find vdb(Vout) at 1kHz
.meas AC BW when vdb(Vout)='gmax-3'
.meas AC unit_gain_frequency when vdb(Vout)=0
.tran 0 100n 0.01n sweep t 0 10k 0.1k

.end


