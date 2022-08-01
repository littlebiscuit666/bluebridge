for i=1:18%循环定义路径,读入附件1的碎片图像
 name=strcat('c:\7\tu(',num2str(i),').bmp');
 A=imread(name);
 h=im2double(A);
 L(:,i+1)=h(:,1);
 R(:,i+1)=h(:,72);
end

% % 寻找页面边缘特征，找出处于页面左右边缘的碎片
% for a=1:19 
%  suml(1,a)=sum(L(:,a));
%  sumr(1,a)=sum(R(:,a));
%  end
% 计算纸碎片j的左边缘和纸碎片i的右边沿之间的欧氏距离 
for j=1:18
    for k=1:18
     d(:,j)=double(L(:,j))-double(R(:,k));
       M(j,k)=sum(d(:,j).*d(:,j));
    end
end

% % 求出与纸碎片j左边缘欧氏距离矩阵中的最小者的碎片,并将其纵坐标储存在mi中
% for l=1:19
%     mi(1,l)=min(M(l,:))
% end





