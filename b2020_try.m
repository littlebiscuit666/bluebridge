%% 想算一算走完30天，耗费了多少水、食物、价格
d=1;
water_sum1=0;food_sum1=0;
while d<=30
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
weight=2*water_sum1+3*food_sum1;
% 30天走满的话，食物366，水390，承重1878.
% 除了沙暴天气，就没有停过，所以消耗比方案二大一些