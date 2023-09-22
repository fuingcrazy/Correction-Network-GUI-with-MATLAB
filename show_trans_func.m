function str_func=show_trans_func(gs_num,gs_deno)
gs_num_len=length(gs_num);
gs_deno_len=length(gs_deno);
i=0;str_func='';
%分子
for i=1:1:gs_num_len
    if gs_num(i)~=0;%只显示非0参数
         if ~strcmp(str_func,'')%前面有表达式，需要+号
              str_func=sprintf('%s+',str_func);
         end
         if gs_num(i)==1%参数为1
             if (gs_num_len-i)==0%S0
                 str_func=sprintf('%s%d',str_func,gs_num(i));%显示参数1
             elseif (gs_num_len-i)==1%S1
                 str_func=sprintf('%sS',str_func);%只显示S
             else %S2、S3....高阶
                 str_func=sprintf('%sS^%d',str_func,(gs_num_len-i));%显示S的次方
             end
         else%参数不为1
             str_func=sprintf('%s%g',str_func,gs_num(i));%显示参数
             if (gs_num_len-i)==0%S0
                 %不显示
             elseif (gs_num_len-i)==1%S1
                 str_func=sprintf('%sS',str_func);%只显示S 
             else %S2、S3....高阶
                 str_func=sprintf('%sS^%d',str_func,(gs_num_len-i));%显示S的次方
             end
         end
    end
end    
%‘/’
str_func=sprintf('%s/',str_func);% ‘/’
%分母
str_temp=str_func;
for i=1:1:gs_deno_len
    if gs_deno(i)~=0;%只显示非0参数
         if ~strcmp(str_func,str_temp)%前面有表达式，需要+号
              str_func=sprintf('%s+',str_func);
         end
         if gs_deno(i)==1%参数为1
             if (gs_deno_len-i)==0%S0
                 str_func=sprintf('%s%d',str_func,gs_deno(i));%显示参数1
             elseif (gs_deno_len-i)==1%S1
                 str_func=sprintf('%sS',str_func);%只显示S
             else %S2、S3....高阶
                 str_func=sprintf('%sS^%d',str_func,(gs_deno_len-i));%显示S的次方
             end
         else%参数不为1
             str_func=sprintf('%s%g',str_func,gs_deno(i));%显示参数
             if (gs_deno_len-i)==0%S0
                 %不显示
             elseif (gs_deno_len-i)==1%S1
                 str_func=sprintf('%sS',str_func);%只显示S 
             else %S2、S3....高阶
                 str_func=sprintf('%sS^%d',str_func,(gs_deno_len-i));%显示S的次方
             end
         end
    end
end