function [img_mosaic]=fusionN(subimg_set,mask_set,mask_x,mask_y,h_box,l_box,h_sub,l_sub,N)

img_mosaic={};
mask_fusion=zeros(h_box,l_box);
img_fusion=mask_fusion;

for i=1:N
    img_mosaic{i}=mask_fusion;
    img_mosaic{i}(mask_y(i):h_sub+mask_y(i)-1,mask_x(i):l_sub+mask_x(i)-1)=...
                 subimg_set{i}(1:h_sub,1:l_sub);
end

for j=1:length(subimg_set)
    mask_fusion(:,:)=mask_fusion(:,:)+mask_set{j}(1:h_box,1:l_box);
    img_fusion(1:h_box,1:l_box)=img_fusion(1:h_box,1:l_box)...
                               +img_mosaic{j}(1:h_box,1:l_box)...
                               .*mask_set{j}(1:h_box,1:l_box);
end

for a=1:h_box
    for b=1:l_box
        temp=img_fusion(a,b)/mask_set(a,b);
        if mask_fusion(a,b)==0
            img_fusion(a,b)=0;
        else
            img_fusion(a,b)=temp;
        end
    end
end
