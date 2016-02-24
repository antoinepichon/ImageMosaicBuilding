function [mask_set,mask_x,mask_y,new_mask]=maskHandler(N,h_box,l_box,h_sub,l_sub,x,y,global_box)

% Initialisation

mask_x=[];
mask_y=[];
new_mask=zeros(h_box,l_box);
mask_set={};

% Détermination des masques de x et de y, selon le minimum des x(i) qui
% joue le rôle d'origine ici

for i=1:N
    mask_set{i}=zeros(h_box,l_box);
    mask_x(i)=abs(x(i)-global_box(1,1)+1);
    mask_y(i)=abs(y(i)-global_box(1,2)+1);
    new_mask(mask_y(i):mask_y(i)+h_sub(i)-1,mask_x(i):mask_x(i)+l_sub(i)-1)=1;  
end


% Masque de la mosaique
% 
% for i=1:N
%     size(mask_set{i})
%     size(new_mask)
%     tmp=new_mask;
%     new_mask=tmp + mask_set{i};
% end
% 
%     new_mask(new_mask>1)=1;
% 
figure, 
imshow(new_mask)
title('\fontsize{12}\bfMasque de la mosaique');