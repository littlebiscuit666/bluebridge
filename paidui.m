% w�ܵȴ�ʱ��  
%c(i)��i���˿͵���ʱ�� come 
%b(i)��i���˿Ϳ�ʼ�����ʱ�� begin
%e(i)��i���˿ͽ��������ʱ�� end

%ģ��һ��
clear all
c(1)=exprnd(10);             %��һ���˿͵���
b(1)=c(1);
i=1;
w=0;
while b(i)<=480
e(i)=b(i)+unifrnd(4,15);     
w=w+b(i)-c(i);               %�ۼƵȴ�ʱ��
i=i+1;
c(i)=c(i-1)+exprnd(10);      %�µĹ˿͵���
b(i)=max([c(i),e(i-1)]);     %�ؼ�,��ʼ�µķ���ʱ��
end
w/(i-1)
i-1


%ģ��һ����
for j=1:100
c(1)=exprnd(10);             %��һ���˿͵���
b(1)=c(1);
i=1;
w(j)=0;
while b(i)<=480
e(i)=b(i)+unifrnd(4,15);     
w(j)=w(j)+b(i)-c(i);         %�ۼƵȴ�ʱ��
i=i+1;
c(i)=c(i-1)+exprnd(10);      %�µĹ˿͵���
b(i)=max([c(i),e(i-1)]);     %��ʼ�µķ���ʱ��
end
t(j)=w(j)/(i-1);             %��¼����ȴ�ƽ��ʱ��
m(j)=i-1;                    %��¼�����������
end
mean(t)
mean(m)
