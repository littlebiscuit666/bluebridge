clear all;
im= imread('Flowers.jpg');
im_res=imresize(im, 0.5);
subplot(1,2,1);
imshow(im);
subplot(1,2,2);
imshow(im_res);