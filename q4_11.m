clear all;
I = imread('Canteen.jpg');
im_r=I(:,:,1);
im_g=I(:,:,2);
im_b=I(:,:,3);
%% 下面这一部分算是截取了人物部分
for i=450:650
    for j=500:650
        I(i,j,1)=im_r(i,j);
        I(i,j,2)=im_g(i,j);
        I(i,j,3)=im_b(i,j);
    end
end

z=zeros(222,111,3);
for i=1:222
    for j=1:111
        z(i,j,1)=im_r(i,j);
        z(i,j,2)=im_g(i,j);
        z(i,j,3)=im_b(i,j);
    end
end

figure,imshow(uint8(z));

%% 下面是第二部分
% 图片的450到650有人物图像、行
% 图片的500到650有人物图像、列

clear;clc;close all;

I=imread('Canteen.jpg');
imshow(I);

[a,b]=size(I);
imshow(I);
hold on;
plot(450,500,'ro','MarkerSize',20);
plot(650,650,'ro','MarkerSize',20);
plot(450,650,'ro','MarkerSize',20);
plot(650,500,'ro','MarkerSize',20);
%%
I = imread('Canteen.jpg');
imshow(I);
I2=imcrop(I,[450 500 200 150]);
imshow(I2);
%xlabel('(a)原始图像');
figure
H = fspecial('motion',10,80);
MotionBlur = imfilter(I2,H,'replicate');
imshow(MotionBlur);
xlabel('(b)运动模糊图像');
%%
for i=500:650
    for j=450:650
        I(i,j,1)=MotionBlur(uint8(i-499),uint8(j-449),1);
        I(i,j,2)=MotionBlur(uint8(i-499),uint8(j-449),2);
        I(i,j,3)=MotionBlur(uint8(i-499),uint8(j-449),3);
    end
end
figure;imshow(uint8(I))

%% 下面是第三部分
A=[1 2 3;4 5 6;7 8 9];
B=zeros(3,3);
for i=1:2
    for j=1:2
        B(i,j)=A(i,j);
    end
end

% 从一个矩阵到另一个矩阵只能(i,j)索引
% 无语了，破防了



