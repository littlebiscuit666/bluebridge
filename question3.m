%错切
clear all;
im=(imread('ILoveCUMT.jpg'));
im1=rgb2gray(im);
figure,imshow(im1);
[row,col]=size(im1); %获取行数 和 列数

%图像的水平错切
G=zeros(row,col);
a=pi/6; %水平错切30度
b=tan(a);
for m=1:row
for n=1:col
G(round(m+b*n),n)=im1(m,n);
end
end
figure,imshow(uint8(G));

% I = imread('ILoveCUMT.jpg');
% tform = maketform('affine',[1 0 0;0.5 1 0; 0 0 1]);
% J = imtransform(I,tform);
% imshow(I);
% figure;
% imshow(J)