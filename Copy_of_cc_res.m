clc
disp(['�����Ӧ������ָ��->']);
disp(['  ']);

%G(S)
num_g=str2num(get_param('cc_system/G(S)','K1'));%���Ӳ���
den_g=get_param('cc_system/G(S)','den_g');%��ĸ����
den_g=eval(den_g);

%exp(-�� s)
T=str2num(get_param('cc_system/delay_e','delay_time'));
[num_t,den_t]=pade(T,5);%��ʱ���ӳٻ��ڿ�����������������,[num,den]=pade(T,n),����TΪ�ӳ�ʱ�䳣����nΪҪ����ϵĽ���

%H(s)
num_h=str2num(get_param('cc_system/H(S)','K2'));%���Ӳ���
den_h=get_param('cc_system/H(S)','den_h');%��ĸ����
den_h=eval(den_h);

%����ʱ��
t0=str2num(get_param('cc_system','StartTime'));%������ʼʱ��
tf=str2num(get_param('cc_system','StopTime'));%������ֹʱ��
tss=str2num(get_param('cc_system','FixedStep'));%���沽��
t=t0:tss:tf;

%����ϵͳ
%[num,den]=series(num_g,den_g,num_t,den_t);%G(s)*exp(-�� s)
%[num,den]=feedback(num,den,num_h,den_h);%���Ϸ���
%[y,x]=step(num,den,t);%��Ծ��Ӧ

%��ʾ����������
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

disp(['��������ֵYmax=',num2str(ymax)]);
disp(['�������ֵ̬Y(��)=',num2str(yw)]);
disp(['��������%=',num2str(ct)]);
disp(['����ʱ��=',num2str(tmax)]);
disp(['���ɹ���ʱ��=',num2str(ts)]);
disp(['�񵴴���=',num2str(u)]);