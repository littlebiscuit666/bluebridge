clear;clc;close all;

I=imread('Canteen.jpg');

[a,b]=size(I)
imshow(I);
hold on;
plot(400,593,'ro','MarkerSize',20);

%%
clear all;
%figure
I = imread('Clock1.jpg');
imshow(I);
%xlabel('(a)原始图像');
figure
H = fspecial('motion',70,65);
MotionBlur = imfilter(I,H,'replicate');
imshow(MotionBlur);
xlabel('(b)运动模糊图像');
% figure
% H=fspecial('disk',10);
% blurred = imfilter(I,H,'replicate');
% imshow(blurred);
% xlabel('(c)模糊图像');
