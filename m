for i=1:18%ѭ������·��,���븽��1����Ƭͼ��
 name=strcat('c:\7\tu(',num2str(i),').bmp');
 A=imread(name);
 h=im2double(A);
 L(:,i+1)=h(:,1);
 R(:,i+1)=h(:,72);
end

% % Ѱ��ҳ���Ե�������ҳ�����ҳ�����ұ�Ե����Ƭ
% for a=1:19 
%  suml(1,a)=sum(L(:,a));
%  sumr(1,a)=sum(R(:,a));
%  end
% ����ֽ��Ƭj�����Ե��ֽ��Ƭi���ұ���֮���ŷ�Ͼ��� 
for j=1:18
    for k=1:18
     d(:,j)=double(L(:,j))-double(R(:,k));
       M(j,k)=sum(d(:,j).*d(:,j));
    end
end

% % �����ֽ��Ƭj���Եŷ�Ͼ�������е���С�ߵ���Ƭ,�����������괢����mi��
% for l=1:19
%     mi(1,l)=min(M(l,:))
% end





