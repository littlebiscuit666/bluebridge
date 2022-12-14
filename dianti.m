%电梯问题随机模拟实验：
%设有r个人在一楼进入电梯，楼上共有n层。设每个乘客在任何一层楼出电梯的可能性相同，
%求直到电梯中的人下完为止，电梯须停次数的期望。


clear all
n=28;                             %电梯层数
r=14;                             %登梯人数
x=zeros(1,n);
N=5000;                           %模拟次数
s=0;
for i=1:N
    for k=1:n
        x(k)=0;
    end
    for j=1:r                     %对每个人进行模拟
    x(floor(rand*n)+1)=1;         %有人下梯
    end
    s=s+sum(x);                   %统计每次模拟中下的人数和
end
s=s/N;                            %平均
fprintf('解析解为%4.3f',n*(1-(1-1/n)^r));
fprintf('模拟解为%4.3f',s);