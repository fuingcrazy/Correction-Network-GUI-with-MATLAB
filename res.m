function res()
clc;
disp(['输出响应各性能指标->']);
disp(['  ']);

%显示仿真结果数据
   a=0;u=0;ymax=0;yw=0;ct=0;tmax=0;ts=0;
   global time_date;%存放时域数据结果
   [res_m,res_n]=size(time_date);% m*n
   y=time_date(:,2);
   t=time_date(:,1);
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