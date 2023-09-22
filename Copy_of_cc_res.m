clc
disp(['输出响应各性能指标->']);
disp(['  ']);

%G(S)
num_g=str2num(get_param('cc_system/G(S)','K1'));%分子参数
den_g=get_param('cc_system/G(S)','den_g');%分母参数
den_g=eval(den_g);

%exp(-τ s)
T=str2num(get_param('cc_system/delay_e','delay_time'));
[num_t,den_t]=pade(T,5);%纯时间延迟环节可以由有理函数来近似,[num,den]=pade(T,n),其中T为延迟时间常数，n为要求拟合的阶数

%H(s)
num_h=str2num(get_param('cc_system/H(S)','K2'));%分子参数
den_h=get_param('cc_system/H(S)','den_h');%分母参数
den_h=eval(den_h);

%仿真时间
t0=str2num(get_param('cc_system','StartTime'));%仿真起始时间
tf=str2num(get_param('cc_system','StopTime'));%仿真终止时间
tss=str2num(get_param('cc_system','FixedStep'));%仿真步长
t=t0:tss:tf;

%仿真系统
%[num,den]=series(num_g,den_g,num_t,den_t);%G(s)*exp(-τ s)
%[num,den]=feedback(num,den,num_h,den_h);%加上反馈
%[y,x]=step(num,den,t);%阶跃响应

%显示仿真结果数据
   a=0;u=0;ymax=0;yw=0;ct=0;tmax=0;ts=0;
   %global linear_c;
   [res_m,res_n]=size(system_res);% m*n
   y=system_res(:,2);
   t=system_res(:,1);
   t_size=length(t);
   for i=2:1:(t_size-1)
       if (y(i+1)<y(i) & y(i-1)<y(i) & a==0)
              y1=y(i);
              ymax=y1;
              tmax=t(i);
              a=1;
              yw=y(t_size);
              ct=(ymax-yw)/yw;
       elseif (y(i+1)>y(i) & y(i-1)>y(i))
              y2=y(i);
              if abs(y2-yw)<0.05
                 ts=t(i);
              end
       elseif ((y(i)>yw & y(i+1)<yw) | (y(i)<yw & y(i+1)>yw))
              u=u+1;
       end
    end

disp(['输出量最大值Ymax=',num2str(ymax)]);
disp(['输出量稳态值Y(∞)=',num2str(yw)]);
disp(['超调量δ%=',num2str(ct)]);
disp(['上升时间=',num2str(tmax)]);
disp(['过渡过程时间=',num2str(ts)]);
disp(['振荡次数=',num2str(u)]);