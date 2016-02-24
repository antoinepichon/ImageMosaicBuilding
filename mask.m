function [mask1,mask2,A1_bis,A2_bis]=mask(box_fusion,x0,y0,A1,A2)

mask1=zeros(box_fusion(2,1),box_fusion(2,2));
mask2=mask1;
[h1,w1]=size(A1);
[h2,w2]=size(A2);
A1_bis=mask1;
A2_bis=A1_bis;

if x0<0 && y0<0
    mask1(-y0:-y0+h1-1,-x0:-x0+w1-1)=1;
    A1_bis(-y0:-y0+h1-1,-x0:-x0+w1-1)=A1;
    mask2(1:h2,1:w2)=1;
    A2_bis(1:h2,1:w2)=A2;
elseif x0<0 && y0>0
    mask1(1:h1,-x0:-x0+w1-1)=1;
    A1_bis(1:h1,-x0:-x0+w1-1)=A1;
    mask2(y0:y0+h2-1,1:w2)=1;
    A2_bis(y0:y0+h2-1,1:w2)=A2;
elseif x0>0 && y0<0
    mask1(-y0:-y0+h1-1,1:w1)=1;
    A1_bis(-y0:-y0+h1-1,1:w1)=A1;
    mask2(1:h2,x0:x0+w2-1)=1;
    A2_bis(1:h2,x0:x0+w2-1)=A2;
else
    mask1(1:h1,1:w1)=1;
    A1_bis(1:h1,1:w1)=A1;
    mask2(y0:y0+h2-1,x0:x0+w2-1)=1;
    A2_bis(y0:y0+h2-1,x0:x0+w2-1)=A2;
end

figure,
imshow(uint8(A1_bis))

figure,
imshow(uint8(A2_bis))