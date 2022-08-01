clear all;
syms x y;
xx=input('自变量的值');
yy=input('因变量的值');
% 需要三个数据
y=yy(1)*(x-xx(2))*(x-xx(3))/(xx(1)-xx(2))*(xx(1)-xx(3))...
    +yy(2)*(x-xx(1))*(x-xx(3))/(xx(2)-xx(1))*(xx(2)-xx(3))...
    +yy(3)*(x-xx(1)*(x-xx(2))/(xx(3)-xx(1))*(xx(3)-xx(2)));
disp(y);
f=collect(y,x);

t=0.47943*(0.56464-0.5)*(0.56464-0.6)/2;
t1=0.47943/8*0.01;