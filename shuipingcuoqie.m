clear all;
im=imread('Flowers.jpg');
im_r=im(:,:,1);im_g=im(:,:,2);im_b=im(:,:,3);
a(:,:,1)=im_r;
a(:,:,2)=im_g;
a(:,:,3)=im_b;
subplot(1,2,1)
imshow(a);      %这一步只是试一试r、g、b能不能合并
xlabel('原图')

[row,col]=size(im_r);
R=zeros(row,col);
G=zeros(row,col);
B=zeros(row,col);
b=1;    %水平错切45度
%% 计算R/g/b的水平错切
for m=1:row
for n=1:col
R(m+b*n,n)=im_r(m,n);
G(m+b*n,n)=im_g(m,n);
B(m+b*n,n)=im_b(m,n);
end
end
%% 将R/G/B拼接起来
im_res(:,:,1)=R;
im_res(:,:,2)=G;
im_res(:,:,3)=B;
subplot(1,2,2)
imshow(uint8(im_res));
xlabel('水平错切45度')
