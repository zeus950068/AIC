*Final Project - A Fully-Differential Two-Stage Op-Amp

.param vdd=1.5V
.param vss=0V
.param vocm=0.75V

.SUBCKT my_op Vinp Vinn vdd vss vop von vocm  

*Bias
MMB3 net5 net5 VDD VDD p_18 W=60u L=1u m=10

*Core Differential Amplifier
MM1 net41 Vinp net16 net16 p_18 W=10u L=0.4u m=10
MM2 net47 Vinn net16 net16 p_18 W=10u L=0.4u m=10
MM3 net41 net53 VSS VSS n_18 W=10u L=0.6u m=1
MM4 net47 net53 VSS VSS n_18 W=10u L=0.6u m=1
MM5 net16 net5 VDD VDD p_18 W=50u L=0.7u m=10
MM6 Von net47 VSS VSS n_18 W=40u L=0.6u m=1
MM7 Von net5 VDD VDD p_18 W=50u L=0.4u m=10
MM8 Vop net41 VSS VSS n_18 W=40u L=0.6u m=1
MM9 Vop net5 VDD VDD p_18 W=50u L=0.4u m=10

*Common Mode Feedback
MMF1 net55 VOCM net36 net36 p_18 W=10u L=0.4u m=9
MMF2 net53 net33 net36 net36 p_18 W=10u L=0.4u m=9
MMF3 net55 net55 VSS VSS n_18 W=10u L=0.6u m=1
MMF4 net53 net53 VSS VSS n_18 W=10u L=0.6u m=1
MMF5 net36 net5 VDD VDD p_18 W=50u L=0.7u m=10

*Bias
Rb net5 VSS 10K

*Core Differential Amplifier
RZ1 Vop net1 3.8K
CC1 net1 net41 3pF
RZ2 Von net2 3.8K
CC2 net2 net47 3pF

*Common Mode Feedback
RCM1 Vop net33 50K
RCM2 Von net33 50K

.ENDS
