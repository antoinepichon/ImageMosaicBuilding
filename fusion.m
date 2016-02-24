function [img_fufu,mask_fufu]=fusion(img1_bis,img2_bis,mask1,mask2,x0,y0)

mask_fufu=mask1;

for i=1:length(img1_bis)-1
    for j=1:length(img1_bis)-1
        if mask1(i,j)==0 && mask2(i,j)==0
            mask_fufu(i,j)=0;
        else
            mask_fufu(i,j)=1;
        end
    end
end

[x1,y1]=size(mask_fufu);

for i=1:x1
    for j=1:y1
        if mask_fufu(i,j)~=0
            img_fufu(i,j)=(mask1(i,j).*img1_bis(i,j)+mask2(i,j).*img2_bis(i,j))/...
                          (mask1(i,j)+mask2(i,j));
        else
            img_fufu(i,j)=0;
        end
    end
end

figure,
imshow(uint8(img_fufu))