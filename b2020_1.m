D=zeros(1,30);
D(1)=1;
near=zeros(1,27);
for i=1:27
    place=0;
    for j=1:27
        if map(i,j)==1
            place=place+1;
        end
    end
    near(i)=place;
end
weather=[2 2 1 3 1 2 3 1 2 2 3 2 1 2 2 2 3 3 2 2 1 1 2 1 3 2 1 1 2 2];
%% 第一关每天的消耗量
for d=1:30
    if weather(d)==1
        water=5;
        food=7;
    end
    if weather(d)==2
        water=8;
        food=6;
    end
    if weather(d)==3
        water=10;
        food=10;
    end
end
%% 确定每一点的相邻的地点
nearmap=zeros(27,8);
for i=1:27
    k=1;
    next=zeros(1,near(1));
    for j=1:27
        if map(i,j)==1
            next(k)=j;
            k=k+1;
        end
    end
    nearmap(i,:)=[next,zeros(1,8-length(next))];
end
%% 准备开始走了吧?(只走到第15个村庄)
dicide=rand;
% p=randi(near(1));
% while road(end)~=15
D=1;
road=1;
while road(end)~=15
    D=D+1;
    road(D)=nearmap(road(D-1),randi(near(road(D-1))));
    if length(road)-length(unique(road))==0
        road(D)=road(D);
    else
        nearmap(road(D-1),road(D))=0;
        road(D)=0;
        D=D-1;
    end
end
            
%     D=D+1;
%     road(D)=nearmap(D-1,randi(near(D-1)));

%% 准备换一种遍历写法
D=1;
road=1;


    



















        
        
        
