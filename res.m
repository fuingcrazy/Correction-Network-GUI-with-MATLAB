function res()
clc;
disp(['�����Ӧ������ָ��->']);
disp(['  ']);

%��ʾ����������
   a=0;u=0;ymax=0;yw=0;ct=0;tmax=0;ts=0;
   global time_date;%���ʱ�����ݽ��
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

disp(['��������ֵYmax=',num2str(ymax)]);
disp(['�������ֵ̬Y(��)=',num2str(yw)]);
disp(['��������%=',num2str(ct)]);
disp(['����ʱ��=',num2str(tmax)]);
disp(['���ɹ���ʱ��=',num2str(ts)]);
disp(['�񵴴���=',num2str(u)]);