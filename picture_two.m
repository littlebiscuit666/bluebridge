%%
clear;clc;close all;
Image=im2double(imread('tushuguan.jpg'));
[h,w,c]=size(Image);
NewImage=zeros(h,w,c);
for i=1:3
img=Image(:,:,i);
NewImage(:,:,i)=histeq(img,256);%调用Matlab函数 指定要有多少灰度级
end
figure;imshow(Image);title('yuantu');
figure;imshow(NewImage);title('直方图拉伸后');

%%
%% 数据读取
clear;clc;close all;
Imageori=imread('tushuguan.jpg');  %打开图像
Image=im2double(Imageori);%将图像归一化并转换为double数据
%% 同态滤波
logI=log(Image+1);  %对数运算，防止图像值为0
sigma=1414;  filtersize=[7 7];%高斯滤波器参数
lowfilter=fspecial('gaussian',filtersize,sigma); %构造高斯低通滤波器
highfilter=zeros(filtersize);%存储高斯高通滤波器模板
highpara=1; lowpara=0.8;%控制滤波器幅度范围的系数  
highfilter(ceil(filtersize(1,1)/2),ceil(filtersize(1,2)/2))=1;%4 4为1 向上取证
highfilter=highpara*highfilter-(highpara-lowpara)*lowfilter; %高斯低通滤波器转换为高斯高通滤波器
highpart=imfilter(logI,highfilter,'replicate','conv'); %时域卷积实现滤波
NewImage=highpart; %存储到NewImage当中
top=max(NewImage(:)); bottom=min(NewImage(:));%取图像的最大值和最小值
New=(NewImage-bottom)/(top-bottom);New=1.5.*(New);%数据的映射处理，符合人眼视觉特性 线性灰度级变换
figure(1);
subplot 121;imshow(Imageori);title('原图');
subplot 122;imshow(New);title('基于同态滤波的增强图像');



