%% 获取图片基本信息
clear all;
im= imread('Flowers.jpg');
im_r=im(:,:,1);im_g=im(:,:,2);im_b=im(:,:,3);
[row,col]=size(im_r);
R=zeros(row,col);
G=zeros(row,col);
B=zeros(row,col);
%% 坐标变换
R(:,:)=im_r(end:-1:1,end:-1:1);
G(:,:)=im_g(end:-1:1,end:-1:1);
B(:,:)=im_b(end:-1:1,end:-1:1);
%% R/G/B的拼接
im_res(:,:,1)=R;
im_res(:,:,2)=G;
im_res(:,:,3)=B;
%% 图像的生成
subplot(1,2,1);
imshow(im);
xlabel('原图')
subplot(1,2,2);
imshow(uint8(im_res));
xlabel('对角镜像')