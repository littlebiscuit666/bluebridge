clear all;
I = imread('ILoveCUMT.jpg');
% I=rgb2gray(I);
subplot(1,2,1),imshow(I);
disp(size(I));
[H,W] = size(I);

t=zeros(30,40);
for i=1:30
    for j =1:40
        t(i,j)=I(i,j);
    end
end
disp(size(t));
subplot(1,2,2),imshow(t);