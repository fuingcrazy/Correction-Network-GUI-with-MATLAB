function res1(sys)
disp(['System dynamic properties->']);
disp(['  ']);

%显示仿真结果数据
 
t=0:0.01:15;
[y,t]=step(sys,t);
 ymax=max(y);
 yss=y(length(t));
 overshoot=(ymax-yss)/yss*100;
 [pkvalue,pkindex]=max(y);
 pkt=t(pkindex)*0.01;
 s=1500;
 while y(s)>0.98*yss && y(s)<1.02*yss
     s=s-1;
 end
 settle_time=(s-1)*0.01;

 disp(['Ymax(Step Response)=',num2str(ymax)])
 disp(['Steady state outputY(∞)=',num2str(yss)])
 disp(['Overshootδ%=',num2str(overshoot)])
 disp(['Raising time=',num2str(pkt)])
 disp(['Process time=',num2str(settle_time)])
