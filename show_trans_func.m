function str_func=show_trans_func(gs_num,gs_deno)
gs_num_len=length(gs_num);
gs_deno_len=length(gs_deno);
i=0;str_func='';
%����
for i=1:1:gs_num_len
    if gs_num(i)~=0;%ֻ��ʾ��0����
         if ~strcmp(str_func,'')%ǰ���б��ʽ����Ҫ+��
              str_func=sprintf('%s+',str_func);
         end
         if gs_num(i)==1%����Ϊ1
             if (gs_num_len-i)==0%S0
                 str_func=sprintf('%s%d',str_func,gs_num(i));%��ʾ����1
             elseif (gs_num_len-i)==1%S1
                 str_func=sprintf('%sS',str_func);%ֻ��ʾS
             else %S2��S3....�߽�
                 str_func=sprintf('%sS^%d',str_func,(gs_num_len-i));%��ʾS�Ĵη�
             end
         else%������Ϊ1
             str_func=sprintf('%s%g',str_func,gs_num(i));%��ʾ����
             if (gs_num_len-i)==0%S0
                 %����ʾ
             elseif (gs_num_len-i)==1%S1
                 str_func=sprintf('%sS',str_func);%ֻ��ʾS 
             else %S2��S3....�߽�
                 str_func=sprintf('%sS^%d',str_func,(gs_num_len-i));%��ʾS�Ĵη�
             end
         end
    end
end    
%��/��
str_func=sprintf('%s/',str_func);% ��/��
%��ĸ
str_temp=str_func;
for i=1:1:gs_deno_len
    if gs_deno(i)~=0;%ֻ��ʾ��0����
         if ~strcmp(str_func,str_temp)%ǰ���б��ʽ����Ҫ+��
              str_func=sprintf('%s+',str_func);
         end
         if gs_deno(i)==1%����Ϊ1
             if (gs_deno_len-i)==0%S0
                 str_func=sprintf('%s%d',str_func,gs_deno(i));%��ʾ����1
             elseif (gs_deno_len-i)==1%S1
                 str_func=sprintf('%sS',str_func);%ֻ��ʾS
             else %S2��S3....�߽�
                 str_func=sprintf('%sS^%d',str_func,(gs_deno_len-i));%��ʾS�Ĵη�
             end
         else%������Ϊ1
             str_func=sprintf('%s%g',str_func,gs_deno(i));%��ʾ����
             if (gs_deno_len-i)==0%S0
                 %����ʾ
             elseif (gs_deno_len-i)==1%S1
                 str_func=sprintf('%sS',str_func);%ֻ��ʾS 
             else %S2��S3....�߽�
                 str_func=sprintf('%sS^%d',str_func,(gs_deno_len-i));%��ʾS�Ĵη�
             end
         end
    end
end