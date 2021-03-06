% w = (cR*throttle + b)*1/(1+sT)
U0 = QuadrotorModel.cR*QuadrotorControl.throttle+QuadrotorModel.b;
Var.td1 = adrc_td(Var.td1, U0(1));
U(1,1) =  U0(1) + QuadrotorModel.T*Var.td1.v2;
Var.td2 = adrc_td(Var.td2, U0(2));
U(2,1) =  U0(2) + QuadrotorModel.T*Var.td2.v2;
Var.td3 = adrc_td(Var.td3, U0(3));
U(3,1) =  U0(3) + QuadrotorModel.T*Var.td3.v2;
Var.td4 = adrc_td(Var.td4, U0(4));
U(4,1) =  U0(4) + QuadrotorModel.T*Var.td4.v2;
QuadrotorControl.throttle = (U-QuadrotorModel.b)/QuadrotorModel.cR;
QuadrotorControl.throttle = constrain(QuadrotorControl.throttle, 0, 1);