% Floyd 算法函数 
function [d,path]=Floyd(A) 
% A——地区的邻接矩阵 
% d——最短路的距离，即消耗的最短天数 
% path——最短路的路径 
[m,~]=size(A); % n 为 A 的行数 
d=A; 
path=zeros(m,m); 
for i=1:m 
    for j=1:m 
        if A(i,j)~=inf 
            path(i,j)=j; %j 是 i 的后续点 
        end 
    end 
end 
for k=1:m 
    for i=1:m 
        for j=1:m 
            if d(i,j)>d(i,k)+d(k,j) 
                d(i,j)=d(i,k)+d(k,j); 
                path(i,j)=path(i,k); 
            end 
        end 
    end 
end 

