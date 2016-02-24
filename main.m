% On commence par prendre 3 images différentes de l'image de départ
% (Même orientation et même phase)  

clear all;
close all;
clc;

A=double(imread('test.jpg'));
figure(1), imshow(uint8(A)), colorbar
title('\fontsize{12}\bfImage de base');

h=300;
l=300;

%% Détermination des sous images

A2=zeros(h,l);
A2=A(50:350,50:350);
figure(2), imshow(uint8(A2)), colorbar
title('\fontsize{12}\bfPremière sous-image');

A1=zeros(h,l);
A1=A(110:410,110:410);
figure(3), imshow(uint8(A1)), colorbar
title('\fontsize{12}\bfDeuxième sous-image');

%% Fusion de deux images

[box_fusion,box2,box1,x0,y0]=global_Box(A2,A1);
    
[mask2,mask1,A2_bis,A1_bis]=mask(box_fusion,x0,y0,A2,A1);

[img_fufu,mask_fufu]=fusion(A2_bis,A1_bis,mask2,mask1,x0,y0);

%% Fusion de N images

h_sub=150;
l_sub=200;
N=5;
[img_fusion]=mosaic(N,h_sub,l_sub,A);