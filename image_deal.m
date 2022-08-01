function [bw] = image_deal(bw)
 
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%------------------------------输入参数-----------------------------  
% BW:处理前图像；  
%-------------------------------------------------------------------  
  
%------------------------------输出参数-----------------------------  
% BW:二值后图像；  
%-------------------------------------------------------------------  
  
% From Nanjing University of Science and Technology，ZLy 
%%建立sobel算子
sobel_xl=[-1,0,1;-2,0,2;-1,0,1];
sobel_xr=[1,0,-1;2,0,-2;1,0,-1];
sobel_yl=[1,2,1;0,0,0;-1,-2,-1];
sobel_yr=[-1,-2,-1;0,0,0;1,2,1];
%%图像灰度化
bw=rgb2gray(bw);
%%把图像数据类型转换为双精度浮点类型
bw=im2double(bw);
%%图像与sobel算子进行卷积
A=conv2(bw,sobel_xl);
B=conv2(bw,sobel_xr);
C=conv2(bw,sobel_yl);
D=conv2(bw,sobel_yr);
%%图像二值化
A=im2bw(A,graythresh(A));
B=im2bw(B,graythresh(B));
C=im2bw(C,graythresh(C));
D=im2bw(D,graythresh(D));
%%图像相加
bw=A+B+C+D;
imshow(bw);title('卷积后的图像');
%消除噪点
se=strel('disk',2);
bw=imclose(bw,se);
figure;imshow(bw);title('消除噪点后的图像');
end