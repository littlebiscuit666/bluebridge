citys=[18.47 95.10
    16.47 94.64
    20.09 94.54
    14.39 93.37
    25.23 97.24
    22.00 93.05
    23.47 92.02
    16.20 96.29
    17.30 97.38
    13.05 98.12
    15.53 97.38
    24.52 95.59
    16.41 97.13
    15.09 92.55];
% save('D:\matlab_model\citys')

%% v.初始化参数
NC_max=200;       %最大迭代次数
m=22;             %蚂蚁的个数（城市数1.5倍）
alpha=1;          %alpha信息素因子[1,4];
beta=4;           %beta启发因子[3,4,5]比较合适
rho=0.2;          %信息素挥发因子[0.1 0.2 0.5]比较合适
Q=20;             
NC=1;             %迭代次数，一开始为1
n=14;

Eta=1./D;         %这个是 1/D(i,j) ，这个是矩阵 
Tau=ones(n,n);    %表示边(i,j)的信息素
Table=zeros(m,n); %路径记录表

rBest=zeros(NC_max,n);          %记录各代最佳路线
lBest=inf.*ones(NC_max,1);      %记录各代最佳路线长度
lAverage=zeros(NC_max,1);       %记录各代路线平均长度

% VI.迭代寻找最佳路径
while NC<=NC_max
    %第一步：随机产生各个蚂蚁的起点城市
    start=zeros(m,1);
    for i=1:m
        temp=randperm(n);
        start(i)=temp(1);
    end
    Table(:,1)=start;       %table表的第一列是所有蚂蚁的起点城市
    citys_index=1:n;        %？？？所有城市索引的一个集合
     
    %第二步：逐个蚂蚁路径选择
    
    for i=1:m
         %逐个城市路径选择
         for j=2:n
             tabu=Table(i, 1:(j-1));                    %禁忌表，蚂蚁已访问的城市
             Allow_index=~ismember(citys_index,tabu);
             P=Allow;                                   %Allow表：存放待访问的城市
             
             %计算从城市j到剩下未访问城市的转移概率
             for k=1:size(Allow,2)                      %等待访问的城市数量
                 P(k)=Tau(tabu(end),Allow(k))^alpha*Eta(tabu(end),Allow(k))^beta;
             end
             P=P/sum(P);                                %归一化
             
             %采取轮盘赌法选择下一个访问城市
             Pc=cumsum(p);
             target_index=find( Pc>=rand );
             target=Allow(target_index(1));
             Table(i,j)=target;
         end
    end
     
     %第三步：计算各个蚂蚁的路径距离
     length=zeros(m,1);
     for i=1:m
         Route=Table(i,:);
         for j=1:(n-1)
             length(i)=length(i)+D(Route(j),Route(j+1));
         end
         length(i)=length(i)+D(Route(n),Route(1));
     end
     
     %第四步：计算最短路径及平均距离
     if NC==1
         [min_Length,min_index]=min(length);
         lBest(NC)=min_Length;
         lAverage(NC)=ean(lengrh);
         rBest(NC,:)=Table(min_index,:);
     else
         [min_Length,min_index]=min(length);
         lBest(NC)=min(lBest(NC-1),min_Length);
         lAverage(NC)=mean(length);
         if lBest(NC)==min_Length
             rBest(NC,:)=Table(min_index,:);
         else
             rBest(NC,:)=rBest((NC-1),:);
         end
     end
     %第五步，更新信息素
     Delta_tau=zeros(n,n);
     for i=1:m
         for j=1:(n-1)
             Delta_tau(Table(i,j),Table(i,j+1))=Delta_tau(Table(i,j),Table(i,j+1))+Q/length(i);
         end
         Delta_tau(Table(i,n),Table(i,1))=Delta_tau(Table(i,n),Table(i,1))+Q/length(i);
     end
     Tau=(1-rho).*Tau+Delta_tau;
     %第六步：迭代次数加一，清空记录表
     NC=NC+1;
     Table=zeros(m,n);
end
%% 结果显示
[short_Length,shortest_index]=min(lBest);
shortest_Route=rBest(shortest_index,:);
disp(['最短距离' num2str(shortest_Length)]);
disp(['最短路径' num2str([shortest_Route shortest_Route(1)])]);


     
     
     
     
     
     
             
             
             
  
         
         
         
    
         
     
             
             
             
                 
                 
             
             
             
             
             
             
             
             

















