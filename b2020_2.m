[dmin,path]=Floyd(A1); 
%输出起点 1 到终点 27 的最短路径 
i=15;j=27; 
k=path(i,j); 
disp(i); 
while k~=j 
    disp(k); 
    k=path(k,j); 
end 
disp(j); 
d=dmin(i,j);

%% 计算1/25/26/27的消耗，没有沙暴
weather=[2 2 1 3 1 2 3 1 2 2 3 2 1 2 2 2 3 3 2 2 1 1 2 1 3 2 1 1 2 2];
water_sum=0;food_sum=0;
for d=1:3
    if weather(d)==1
        water=5;
        food=7;
    else 
        water=8;
        food=6; 
    end
    water_sum=water_sum+2*water;
    food_sum=food_sum+2*food;
end
fund=10000-water_sum*5-food_sum*10;
disp(['第一关第一种方案剩余资金',num2str(fund),'元'])
%% 第一关方案二
% 首先是1/25/24/23/21/9/15，先到达村庄。
% 6个间隔+1个沙暴天气+1个沙暴天气，第8天到村庄
d=1;
water_sum1=0;food_sum1=0;
while d<=8
    if weather(d)==1
        water=5;
        food=7;
        water_sum1=water_sum1+2*water;
        food_sum1=food_sum1+2*food;
	elseif weather(d)==2
        water=8;
        food=6; 
        water_sum1=water_sum1+2*water;
        food_sum1=food_sum1+2*food;
    elseif weather(d)==3
        water=10;
        food=10;
        water_sum1=water_sum1+water;
        food_sum1=food_sum1+food;
    end
    d=d+1;
end
fund1=10000-water_sum1*5-food_sum1*10;

%% 计算从村庄到终点的消耗，由于确定了挖7天
% 所以第20天，到达村庄15，15/9/21/27
% 从第21天返回终点，只需要3天，
water_sum3=0;food_sum3=0;
for d=21:23
    if weather(d)==1
        water=5;
        food=7;
    else 
        water=8;
        food=6; 
    end
    water_sum3=water_sum3+2*water;
    food_sum3=food_sum3+2*food;
end


%% 下面出现了问题
% 下面计算15/13/12*(11——25)/13/15
% 食物、水、挖矿收入(第9-10/11-25/26-27)
income=(25-11+1)*1000;
water_sum2=0;food_sum2=0;
for d=9:27
    if d==9
        water_sum2=water_sum2+2*8;
        food_sum2=food_sum2+2*6;
    elseif d==10
        water_sum2=water_sum2+2*8;
        food_sum2=food_sum2+2*6;
    elseif d==26
        water_sum2=water_sum2+2*8;
        food_sum2=food_sum2+2*6;
    elseif d==27
        water_sum2=water_sum2+2*5;
        food_sum2=food_sum2+2*7;
    else
        if weather(d)==1
           water=5;
           food=7;
        elseif weather(d)==2
            water=8;
            food=6;
        elseif weather(d)==3
            water=10;
            food=10;
        end
        water_sum2=water_sum2+3*water;
        food_sum2=food_sum2+3*food;
    end
end

% 水 3kg，食物 2kg
% 对比单价知道应该带贵的，也就是初始water 98;food 453
% food 还需要 98+380+38-453=63 20元/kg
% water 还需要 98+406+42-98=448 10元/kg
% 98*5+453*10+63*20+448*10=10760
% 那可能出现的问题就是，资源有限
fund2=10000-10760+income;    

%% 那可能出现的问题就是，资源有限，下面考虑这个问题
% 如果二阶段需要water 406，food 380
% 而现在剩下 water 98-98=0kg，food 453-98=355kg
% 需要water 406,food 25 计算此时的重量
% 所以说挖矿不能太多天
% 最佳决策是1200kg的东西能维持(村庄——矿山——村庄)
% 然后这1200的东西怎么买到，后面再做讨论
% 还是从第9天开始——不知道哪一天
% 计算挖矿1/2/3/4...的物资消耗
%%
% while water_sum2+food_sum2<=1200
%     if d==9
%         water_sum2=water_sum2+2*8;
%         food_sum2=food_sum2+2*6;
%     elseif d==10
%         water_sum2=water_sum2+2*8;
%         food_sum2=food_sum2+2*6;
%         else
%         if weather(d)==1
%            water=5;
%            food=7;
%         elseif weather(d)==2
%             water=8;
%             food=6;
%         elseif weather(d)==3
%             water=10;
%             food=10;
%         end
%         water_sum2=water_sum2+3*water;
%         food_sum2=food_sum2+3*food;

%% 通过这个语句判断那返回的两天中是否有沙暴
d=input('输入挖矿的天数');         %5,15
minerend=d+10;      %15,25,指的是挖矿结束
dend=minerend+2;    %17,27,指的是返回村庄
for D=minerend+1:dend
    if weather(D)==3
        dend=dend+1;
        continue
    end
end
%% 计算消耗物资
water_sum2=0;food_sum2=0;
% 第9天和第10天，到达12矿场，第11天开始挖，先算挖矿d天
water_sum2=water_sum2+2*8;
food_sum2=food_sum2+2*6;
water_sum2=water_sum2+2*8;
food_sum2=food_sum2+2*6;
for d=11:minerend
    if weather(d)==1
        water=5;
        food=7;
    elseif weather(d)==2
        water=8;
        food=6;
     elseif weather(d)==3
        water=10;
        food=10;
     end
        water_sum2=water_sum2+3*water;
        food_sum2=food_sum2+3*food; 
end
% 返回村庄消耗的物资
for D=minerend+1:dend
    if weather(D)==1
        water=5;
        food=7;
        water_sum2=water_sum2+2*water;
        food_sum2=food_sum2+2*food;
    elseif weather(D)==2
        water=8;
        food=6;
        water_sum2=water_sum2+2*water;
        food_sum2=food_sum2+2*food;
    elseif weather(D)==3
        water=10;
        food=10;
        water_sum2=water_sum2+water;
        food_sum2=food_sum2+food;
    end
end 
weight=2*food_sum2+3*water_sum2;
disp(['此时货物总重量为',num2str(weight),'kg'])
% 根据尝试得到挖矿的天数最多为7天
% 根据此计算sum3的物资消耗
%% 下面计算fund
water_start=98;
food_start=(1200-98*2+98*3)/2+98;
% 747>98+211+40，因此食物带满，剩下带水
% 假设一村庄可以放东西
food_start=98+211+40;
water_start=floor((1200-food_start*2)/3);
water_village=98+245+36-water_start;
food_village=0;
fund2=10000+7*1000-food_start*10-...
food_village*20-water_start*5-water_village*10;
% 这个是算下来是10555

% 假设二村庄不能放东西（题目要求）
% 这句话的意思是，没消耗的东西要带在身上
% 这部分是一个明显的线性规划
% 得到的结果是初始条件 food 309、water 194
% 乡村买food 0、water 149
% 乡村买food 40、water 36
food_sum321=98+211+40;
water_sum321=98+245+36;
fund3=10000+7000-309*10-194*5-(349-309)*20-(379-194)*10;













    
    
        




    
    








