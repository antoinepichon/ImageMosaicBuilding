function [img_fusion]=mosaic(N,h_sub,l_sub,A)

% Initialisation

figure, imshow(uint8(A))
title('\fontsize{12}\bfSélection des sous-images');

x=[];
y=[];

subimg_set={};

mask_cell={};

% Gestion des sous-images

[subimg_set,x,y]=subimgHandler(N,l_sub,h_sub,A);

% Initialisation des masques

h_sub=zeros(1:N);
l_sub=zeros(1:N);
size(l_sub)
size(x)
size(h_sub)
size(y)
for i=1:N
    [h_sub(i),l_sub(i)]=size(subimg_set{i});
    mask_cell{i}=ones(h_sub,l_sub);
end

% Taille de la boite englobante

l_box=max(x+l_sub)-min(x);
h_box=max(y+h_sub)-min(y);

% Coordonnées de la boite englobante

global_box=[min(x) min(y),min(x)+l_box min(y)+h_box];

% Gestion des différents masques de chaque sous_image

[mask_set,mask_x,mask_y,new_mask]=maskHandler(N,h_box,l_box,h_sub,l_sub,x,y,global_box);

% Création finale de la mosaique

img_mosaic={};
       
mask_fusion=zeros(h_box,l_box);
img_fusion=mask_fusion;

[img_mosaic]=fusionN(subimg_set,mask_set,mask_x,mask_y,h_box,l_box,h_sub,l_sub,N);