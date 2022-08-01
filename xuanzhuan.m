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
sita=pi/4;                  %旋转45度
%% 计算R/g/b的旋转坐标
for i=1:row
    for j=1:col
         X=(i-row/2)*cos(sita)+(j-col/2)*sin(sita)+min(row,col);
         Y=-(i-row/2)*sin(sita)+(j-col/2)*cos(sita)+min(row,col);
         X=round(X);        %因为经过旋转后的坐标不是整数，需要取整
         Y=round(Y);
         R(X,Y)=im_r(i,j);
         G(X,Y)=im_g(i,j);
         B(X,Y)=im_b(i,j);
    end
end
%% 将R/G/B拼接起来
im_res(:,:,1)=R;
im_res(:,:,2)=G;
im_res(:,:,3)=B;
subplot(1,2,2)
imshow(uint8(im_res));
xlabel('旋转45度')


