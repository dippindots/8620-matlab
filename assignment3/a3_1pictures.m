close all;
%clear all;
clc;

im=imread('material/cat.JPG');
%show 
%figure,imshow(im,[]);title('Raw');  %????????

im=im2bw(im);                       %??????????
figure,imshow(im,[]),title('BW');   %????????????
[rows,cols] = size(im);
im2=imfill(~im,'holes');             %????
im3 = bwmorph(im2,'remove');                   %????????
%figure,imshow(im2,[]); title('')             %????

figure,imshow(im3,[]);

%im4 = flipud(im3);
[a,b]= find(im3==1); % get the coordinates
%a= fliplr(a);
%a = a';
figure,scatter(b,a);

row = a(1); col = b(1);
boundary = bwtraceboundary(im2,[row,col],'ne');
%boundary = boundary(1:end-1,:);
figure 
subplot(121),imshow(im),title('original image');
subplot(122),
imshow(im3),title('binary boundary'),hold on;

%reconstruct image
contour = zeros(rows,cols);
for i = 1:820
            contour(a(i,1),b(i,1)) = 1;
end
figure 
imshow(contour);

dis = zeros(rows,cols);
for i = 1:rows
    for j = 1:cols
        for k = 1:820
            distmp = ((i-a(i,1))^2 + (j-b(i,1))^2) - 0;
            dis(i,j) = 10000000000;
            if (distmp < dis(i,j))
                dis(i,j) = distmp;
            end
        end
    end
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
bw = zeros(200,200);
bw(50,50) = 1; bw(50,150) = 1; bw(150,100) = 1;
D1 = bwdist(im,'euclidean');
RGB1 = repmat(mat2gray(D1), [1 1 3]);
figure
imshow(RGB1),
title('Euclidean')
%imcontour(D1)

