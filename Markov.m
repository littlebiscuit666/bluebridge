%�����ɷ��ԣ�ϵͳͨ����ÿ��ʱ��������״̬������ģ�
%�����ʱ�ڵ��¸�״ֻ̬ȡ�������ʱ�ڵ�״̬��ת�Ƹ��ʣ�����ǰ��ʱ�ڵ�״̬�޹ء�
%�������ʳ�Ϊ�޺�Ч�ԡ���������ɷ��ԣ�Markov��������֪���ڣ���������ʷ�޹ء�

%���˵�״̬��Ϊ���� ���� ����������״̬����һ����Ϊһ��ʱ�Σ���ת�Ƹ���Ϊ��
%���꽡�����꽡���ĸ���Ϊ0.8�����꼲���ĸ���Ϊ0.19�����������ĸ���Ϊ0.01
%���꼲�����꽡���ĸ���Ϊ0.65�����꼲���ĸ���Ϊ0.30�����������ĸ���Ϊ0.05
%�����������������ĸ���Ϊ1
%Ҫ�����ģ������˵�ƽ������


clear all
n=200;                                   %ģ��200��
r=rand(10000,n);                         %����[0,1]���ȷֲ��������
X=zeros(10000,n);                        %������¼����
X(:,1)=ones(10000,1);                    %��һ��ȫ������
Y=zeros(10000,1);                        %������¼����
for i=1:10000                            %���ģ��10000��
    for j=1:n-1
%1������ 2����������3��������
        if X(i,j)==1                             %������꽡��
            if r(i,j)<=0.8
                X(i,j+1)=1;%���꽡��
            elseif r(i,j)<=0.99
                X(i,j+1)=2;%���꼲��                          
            else
                X(i,j+1)=3;%��������ѭ������¼���
                Y(i)=j+1;
            break      
            end
        elseif X(i,j)==2                         %1������꼲��
            if r(i,j)<=0.65
                X(i,j+1)=1;%���꽡��
            elseif r(i,j)<=0.95
                X(i,j+1)=2;%���꼲��
            else
                X(i,j+1)=3;%��������ѭ������¼���
                Y(i)=j+1;
            break                               
            end
        end                                      %1��end
    end
end
sum(Y)/10000