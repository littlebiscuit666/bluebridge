%��ͯ�۱����⣺һ��ͯÿ���峿�ӱ����������Ĺ���ֽ�����ۣ���ֽ������Ϊÿ��aԪ���۳�Ϊ
%��Ϊÿ��bԪ������ͯÿ�칺����ֽn�ݣ�ÿ���۳��ı�ֽ�ķ���������ģ����ݹ�ȥ�۱��������k
%���Ӳ���Ϊ120�Ĳ��ɣ�Poisson���ֲ�
%����ͯÿ���峿�������ٷݱ�ֽ���Ի���������

clear all
a=0.35;                                                        % ��ֽ�Ľ���
b=0.5;                                                         % ��ֽ���ۼ�
lamda=120;                                                     % ���ɷֲ��Ĳ���
%ģ�����
m=45;                                                          % ������ĸ���
D=[];                                                          % ������¼ģ������
d=[];                                                          % ������¼��������
P=poissrnd(lamda,1,m);                                         % ���������
for i=60:lamda+20                                              % �Զ�����60��120��������
    dsum=0;
    for j=1:m                                                  % ģ��m�����
    if P(j)>=i                                                 % ����ֽȫ���۳�ʱ
    dsum=dsum+i*(b-a);    
    elseif P(j)<i                                              % ����ֽδȫ���۳�ʱ
    dsum=dsum+P(j)*b-i*a;
    end
    end
    D=[D,dsum/m];
end
[Dmax,n]=max(D);
fprintf('Ӧ�����ı�ֽ����ģ��n=%3d\n',n+59);
fprintf('���ܻ�õ����������ģ��D=%4.3f\n',Dmax);


%�������
for i=60:lamda+20
    dsum=0;
    for j=0:i-1
    dsum=dsum+(j-i)*poisspdf(j,lamda);                          % poisspdf(j,lamda)  ָ����Ϊlamda�Ĳ��ɷֲ��� k=j
    end
    dsum=i*(b-a)+b*dsum;
    d=[d,dsum];
end
[dmax,N]=max(d);
fprintf('Ӧ�����ı�ֽ��������n=%3d\n',N+59);
fprintf('���ܻ�õ�������������D=%4.3f\n',dmax);