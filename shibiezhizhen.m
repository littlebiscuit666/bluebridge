close all;clear all;clc;
% 提取图像轮廓，提取图像边缘
I = imread('Clock2_1.jpg');
c = im2bw(I,graythresh(I));
figure;
subplot(1,3,1);imshow(I);
c = flipud(c);                 %实现矩阵c上下翻转
b = edge(c,'canny');
[u,v] = find(b);               %返回边界矩阵b中非零元素的位置
xp = v;                        %行值v赋给xp
yp = u;                        %列值u赋给yp
x0 = mean([min(xp),max(xp)]);  %x0为行值的均值
y0 = mean([min(yp),max(yp)]);  %y0为列值得均值
xp1 = xp-x0;
yp1 = yp-y0;
[cita,r] = cart2pol(xp1,yp1);
q = sortrows([cita,r]);        %从r列开始比较数值并按升序排序
cita = q(:,1);                 %赋角度值
r = q(:,2);                    %赋半径模值
subplot(1,3,2);polar(cita,r);  %画极坐标下的轮廓图
[x,y] = pol2cart(cita,r);      %将极坐标转化为平面坐标
x = x+x0;
y = y+y0;
subplot(1,3,3);plot(x,y);axis equal;