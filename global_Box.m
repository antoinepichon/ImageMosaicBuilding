function [box_fusion,box1,box2,x0,y0] = global_Box(img1,img2)

[x0,y0]=correlationPhase(img1,img2);
[box1]=box(img1);
[box2]=translateBox(box1,x0,y0);
box_fusion=zeros(2,2);
for i=1:2
    for j=1:2
        if i==1
            if (box1(i,j)<box2(i,j)) % On garde le minimum pour l'origine 
                                     % (coin supérieur gauche)
                box_fusion(i,j)=box1(i,j);
            else
                box_fusion(i,j)=box2(i,j);
            end
        else
            if (box1(i,j)>box2(i,j)) % On garde le maximum pour le deuxieme
                                     % point de la boite (coin inférieur
                                     % droit)
                box_fusion(i,j)=box1(i,j);
            else
                box_fusion(i,j)=box2(i,j);
            end
        end
    end
end

% Si on a une origine inférieure à 0, on la translate en (0,0);

if box_fusion(1,1)<0
    box_fusion(1,1)=box_fusion(1,1)-x0;
    box_fusion(2,1)=box_fusion(2,1)-x0;
end

if box_fusion(1,2)<0
    box_fusion(1,2)=box_fusion(1,2)-y0;
    box_fusion(2,2)=box_fusion(2,2)-y0;
end