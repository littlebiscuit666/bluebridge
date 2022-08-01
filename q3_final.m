%% 第四问
clear;clc;close all;      
%% 发现人物所在区域
I=imread('Canteen.jpg');
imshow(I);
hold on;
plot(440,500,'ro','MarkerSize',20);
plot(670,500,'ro','MarkerSize',20);
plot(440,650,'ro','MarkerSize',20);
plot(670,650,'ro','MarkerSize',20);
xlabel('人物所在区域图像');
%% 选取人物图像并模糊处理
% 通过其他手段(或者试出来的)4个人物所在的位置是[500:650,440:670]
I = imread('Canteen.jpg');
I2=imcrop(I,[440 500 230 150]); 
subplot(1,2,1)
imshow(I2);                         %选取人物存在的像素部分
xlabel('(a)原始图像');
H = fspecial('motion',10,80);       %对图像进行运动模糊处理
MotionBlur = imfilter(I2,H,'replicate');
subplot(1,2,2)
imshow(MotionBlur);                 %人物模糊处理的结果
xlabel('运动模糊图像');
%% 将模糊处理的部分替换到原始的Canteen中
for i=500:650
    for j=440:670
        I(i,j,1)=MotionBlur(uint8(i-499),uint8(j-439),1);
        I(i,j,2)=MotionBlur(uint8(i-499),uint8(j-439),2);
        I(i,j,3)=MotionBlur(uint8(i-499),uint8(j-439),3);
    end
end
figure;imshow(uint8(I))
xlabel('最终效果图')




