%% 读入数据
rgb = imread('Clock1.jpg');
imshow(rgb)
%% 确定圆形半径（鼠标划线）
d = drawline;
pos = d.Position;
diffPos = diff(pos);
diameter = hypot(diffPos(1),diffPos(2));
disp(diameter);

%% 调整灵敏度寻找圆
gray_image = rgb2gray(rgb);
imshow(gray_image)
[centers,radii] = imfindcircles(rgb,[20 25],'ObjectPolarity','dark', ...
    'Sensitivity',0.97);
%% 寻找到的结果
imshow(rgb);
h = viscircles(centers,radii);

