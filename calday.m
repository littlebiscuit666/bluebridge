%% 计算剩余的水量、食物、资金
% 我这个方案共用了
% 1-8(到达村庄)、9-10(到达矿山)、11-17(采矿)
% 18-20(返回村庄)、21—23(到达终点)
fsum=349;wsum=379;
f1=309;w1=194;
f2=0;w2=149;
f3=0;w3=36;
% 阶段一
d=1;
w1=194;f1=309;
while d<=8
    if weather(d)==1
        water=5;
        food=7;
        w1=w1-2*water;
        f1=f1-2*food;
	elseif weather(d)==2
        water=8;
        food=6; 
        w1=w1-2*water;
        f1=f1-2*food;
    elseif weather(d)==3
        water=10;
        food=10;
        w1=w1-water;
        f1=f1-food;
    end
    disp(['第',num2str(d),'天剩下食物',num2str(f1)])
    disp(['第',num2str(d),'天剩下水',num2str(w1)])
    d=d+1;
end
% 然后在第8天买水
f2=211+0;w2=96+149;
% 第9天
f2=f2-6*2;disp(['第九天食物剩下',num2str(f2)]);
w2=w2-8*2;disp(['第九天水剩下',num2str(w2)]);
% 第10天
f2=f2-6*2;disp(['第10天食物剩下',num2str(f2)]);
w2=w2-8*2;disp(['第10天水剩下',num2str(w2)]);
% 第11-17天
for d=11:17
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
     w2=w2-3*water;
     f2=f2-3*food; 
     disp(['第',num2str(d),'天剩下食物',num2str(f2)])
     disp(['第',num2str(d),'天剩下水',num2str(w2)])
end
% 第18-20天
for d=18:20
    if weather(d)==1
        water=5;
        food=7;
        w2=w2-2*water;
        f1=f1-2*food;
	elseif weather(d)==2
        water=8;
        food=6; 
        w2=w2-2*water;
        f2=f2-2*food;
    elseif weather(d)==3
        water=10;
        food=10;
        w2=w2-water;
        f2=f2-food;
    end
    disp(['第',num2str(d),'天剩下食物',num2str(f2)])
    disp(['第',num2str(d),'天剩下水',num2str(w2)])
end   

% 第21-23天，先购买f3/w3
f3=40;w3=36;
for d=21:23
    if weather(d)==1
        water=5;
        food=7;
        w3=w3-2*water;
        f3=f3-2*food;
	elseif weather(d)==2
        water=8;
        food=6; 
        w3=w3-2*water;
        f3=f3-2*food;
    elseif weather(d)==3
        water=10;
        food=10;
        w3=w3-water;
        f3=f3-food;
    end
    disp(['第',num2str(d),'天剩下食物',num2str(f3)])
    disp(['第',num2str(d),'天剩下水',num2str(w3)])
end












