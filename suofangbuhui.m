%% 获取图片基本信息
clear all;
im= imread('Flowers.jpg');
im_r=im(:,:,1);im_g=im(:,:,2);im_b=im(:,:,3);
[row,col]=size(im_r);
R=zeros(row,col);
G=zeros(row,col);
B=zeros(row,col);
%%
big=2;
for i=1:round(row*2)
    for j=1:round(col*2)
        R(i,j)=im(round(i/big),round(j/big));
        G(i,j)=im(round(i/big),round(j/big));
        B(i,j)=im(round(i/big),round(j/big));
    end
end
%% 图像的拼接的结果图
im_res(:,:,1)=R;
im_res(:,:,2)=G;
im_res(:,:,3)=B;
subplot(1,2,1);
imshow(im);
xlabel('原图');
subplot(1,2,2);
imshow(uint8(im_res));
xlabel('放大1.5倍');



