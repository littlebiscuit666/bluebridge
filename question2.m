% %%三种方法实现灰度化与调用MATLAB函数实现灰度化
% 
% Img=imread('ILoveCUMT.jpg');
% [n,m,a]=size(Img);%判断图像的大小
% method=input('请输入采取的方法（输入1或2或3）');
% 
% % 方法一是最大值法
% % 方法二是平均值法
% % 方法三是加权平均值法
% 
% GrayImage= rgb2gray(Img);       %调用MATLAB函数实现灰度化
% 
% Img_Gray=zeros(n,m);
% for x=1:n                       %通过双循环对图像进行灰度化处理
%     for y=1:m
%         switch method
%             case 1
%                 Img_Gray(x,y)=max(Img(x,y,1),max(Img(x,y,2),Img(x,y,3)));       %第一种方法实现灰度化
%             case 2
%                 Img_Gray(x,y)=(Img(x,y,1)+Img(x,y,2)+Img(x,y,3))/3;             %第二种方法实现灰度化
%             case 3
%                 Img_Gray(x,y)=0.3*Img(x,y,1)+0.59*Img(x,y,2)+0.11*Img(x,y,3);   %第三种方法实现灰度化
%         end
%     end
% end
% subplot(2,2,1);
% figure(1),imshow(Img);title('原图像')
% subplot(2,2,2);
% figure(1),imshow(Img);title('第一种方法')
% subplot(2,2,4)
% figure(1),imshow(uint8(Img_Gray));title('第三种方法')


%%三种方法实现灰度化与调用MATLAB函数实现灰度化

Img=imread('ILoveCUMT.jpg');
figure,imshow(im1);
[n,m,a]=size(Img);%判断图像的大小

GrayImage= rgb2gray(Img);%调用MATLAB函数实现灰度化
Img_Gray=zeros(n,m);

for x=1:n       %通过双循环对图像进行灰度化处理
    for y=1:m
       Img_Gray(x,y)=max(Img(x,y,1),max(Img(x,y,2),Img(x,y,3)));        %第一种方法实现灰度化
    end
end
subplot(2,2,2);
figure(1),imshow(uint8(Img_Gray));title('最大值法')

for x=1:n       %通过双循环对图像进行灰度化处理
    for y=1:m
       Img_Gray(x,y)=(Img(x,y,1)+Img(x,y,2)+Img(x,y,3))/3;              %第二种方法实现灰度化
    end
end
subplot(2,2,3);
figure(1),imshow(uint8(Img_Gray));title('平均值法')

for x=1:n       %通过双循环对图像进行灰度化处理
    for y=1:m
        Img_Gray(x,y)=0.3*Img(x,y,1)+0.59*Img(x,y,2)+0.11*Img(x,y,3);   %第三种方法实现灰度化
    end
end
subplot(2,2,4);
figure(1),imshow(uint8(Img_Gray));title('加权平均值法')
subplot(2,2,1);
figure(1),imshow(Img);title('原图');

