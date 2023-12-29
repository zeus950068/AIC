Vgs=  float(input('請輸入實際值Vgs='))
W = float(input('請輸入實際值W='))
L = float(input('請輸入實際值L='))
Vth = float(input('請輸入實際值Vth='))
gm = float(input('請輸入實際值gm='))

#工作區檢測
VDD = float(input('請輸入實際值VDD='))
RL = float(input('請輸入實際值RL='))
Id = float(input('請輸入實際值Id='))
if VDD-Id*RL>Vgs-Vth:
    print('SATURATION')

first_value=[Vgs,W,L,Vth,Id,gm]
#first_value = list(map(float,input('請輸入實際值vgs W L vth id gm:').split()))
#print(first_value)

new_vgs=float(input('請輸入更改值Vgs='))
new_W=float(input('請輸入更改值W='))
new_L=float(input('請輸入更改值L='))
new_RL = float(input('請輸入更改值RL='))

modify_value = [new_vgs,new_W,new_L,new_RL]

id_vov_factor = (modify_value[0]-first_value[3])**2/(first_value[0]-first_value[3])**2       #id正比於Vov平方
id_length_factor = (modify_value[1]/modify_value[2])/(first_value[1]/first_value[2])         #id正比於W/L
new_Id = first_value[4]*id_vov_factor*id_length_factor
print('new_Id=',new_Id)
gm_vov_vactor = (modify_value[0]-first_value[3])/(first_value[0]-first_value[3])
gm_id_factor = id_vov_factor*id_length_factor                                                #id變化倍數
new_gm = first_value[5]*gm_id_factor/gm_vov_vactor                                           #2Id/Vov
print('new_gm=',new_gm)