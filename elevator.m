%�����Ŷ���������ģ��
%һ����4������ ��������0��30�ľ��ȷֲ�
clc
clear all

QUETIME=0;                          %�ȴ��Ĺ˿ʹ��ڶ��е�ƽ��ʱ��
quetotal=0;                         %��ʱ��ȴ��Ĺ˿�����
remain=0;                           %�²��������̺��ڵȴ��Ĺ˿���
flrvec=zeros(4,12);
selvec=zeros(4,12);

for i=1:500
between(i)=fix(rand*31);            %�˿�i��i-1�����ʱ����
floor(i)=fix(rand*11)+2;            %�˿�iѡ���¥��
wait(i)=0;                          %�˿�i�Ŷӵĵȴ�ʱ��
end

i=1;
Time=between(i);                    %ʱ��
for j=1:4
    Return(j)=Time;                 %ÿ�����ݵĿɳ���ʱ��  
end

while(1)
    if  Time>=4800
        break;
    end

if Time>=min(Return)                %������ڲ��Ŷ�
    if Time>=Return(1)
    j=1;
    elseif Time>=Return(2)
    j=2;
    elseif Time>=Return(3)
    j=3;
    elseif Time>=Return(4)
    j=4;
    end

 occup(j)=0;                        %��ǰռ�õ���j�ĳ˿���
 first(j)=i;                        %��һ������j���ݵ���i   
 
 for k=1:12
 selvec(j,k)=0;                       %��ʾk���Ƿ�ѡ��
 flrvec(j,k)=0;                       %��ʾk�㱻ѡ���˼���
 end

 selvec(j,floor(i))=1;
 flrvec(j,floor(i))=flrvec(j,floor(i))+1;
 occup(j)=occup(j)+1;
 
 while(1)
 if between(i+1)<=15&occup(j)<12
 i=i+1;                              %������һλ�˿Ͳ�����ʱ��
 Time=Time+between(i);               
 for k=1:4
 if Time>=Return(k)
     Return(k)=Time;
 end
 end
 selvec(j,floor(i))=1;
 flrvec(j,floor(i))=flrvec(j,floor(i))+1;
 occup(j)=occup(j)+1;
 else
     break;
 end
 end
 limit=i;                             %���һ������ɳ˵��ݵ���
 
 for k=12:0-1:1    
 if selvec(j,k)==1
    MAX=k;
    break;
 end
 end
 Return(j)=Time+20*(MAX-1)+3*sum(flrvec(j,:))+10*sum(selvec(j,:))+15;                  

 i=i+1;
 Time=Time+between(i);  

else                                  %��������Ŷ� Time
%��ʼ���Ŷ�
    quecust=i;                        %���е�һλ�˿͵ı��    
    queue=1;                          %��ǰ�ȴ�һ�����ݱ�ɿɳ��õ����Ŷӵ��ܳ���
    arrive(i)=Time;                   %�˿Ϳ�ʼ�Ŷ�ʱ��
while 1
while 1
%������һ���˿�
    i=i+1;   
    Time=Time+between(i);
    queue=queue+1;
    arrive(i)=Time;                  
if Time>=Return(1)
j=1; break;
elseif Time>=Return(2)
j=2; break;
elseif Time>=Return(3)
j=3; break;
elseif Time>=Return(4)
j=4; break;
else
    continue;
end
end

%�Ŷ��е�������
for k=1:12
selvec(j,k)=0;
flrvec(j,k)=0;
end
remain=queue-12;                      %�������ڶ����е���

if remain<=0
R=i;                                  %����ϵ��ݵ���
occup(j)=queue;
else
R=quecust+11;
occup(j)=12;
end

C=0;
%����j���˳˿�
for k=quecust:R
selvec(j,floor(k))=1;
flrvec(j,floor(k))=flrvec(j,floor(k))+1;
C=C+(Time-arrive(k));
end
QUETIME=QUETIME+C;                    %ͳ���ܵȴ�ʱ��
quetotal=quetotal+occup(j);           %ͳ���ܵȴ�����

first(j)=quecust;

if remain<=0
quene=0;
while(1)
 if between(i+1)<=15&occup(j)<12
 i=i+1;                              %������һλ�˿Ͳ�����ʱ��
 Time=Time+between(i);               
 for k=1:4
 if Time>=Return(k)
     Return(k)=Time;
 end
 end
 selvec(j,floor(i))=1;
 flrvec(j,floor(i))=flrvec(j,floor(i))+1;
 occup(j)=occup(j)+1;
 else
     break;
 end
 end
 limit=i;                             %���һ������ɳ˵��ݵ���
 for k=12:0-1:1    
 if selvec(j,k)==1
    MAX=k;
    break;
 end
 end
 Return(j)=Time+20*(MAX-1)+3*sum(flrvec(j,:))+10*sum(selvec(j,:))+15;                  

 i=i+1;
 Time=Time+between(i);  
break;
else 
    limit=R;
 for k=12:0-1:1    
 if selvec(j,k)==1
    MAX=k;
    break;
 end
 end
 Return(j)=Time+20*(MAX-1)+3*sum(flrvec(j,:))+10*sum(selvec(j,:))+15;     
 i=i+1;
 Time=Time+between(i);  
queue=remain;
quecust=R+1;
end
end

end
end
i-queue
quetotal
QUETIME=QUETIME/quetotal