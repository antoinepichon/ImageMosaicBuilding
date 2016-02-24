function [box_out]=translateBox(box_in,x0,y0)

box_out=zeros(2,2);

box_out(1,1)=box_in(1,1)+x0;
box_out(2,1)=box_in(2,1)+x0;
box_out(1,2)=box_in(1,2)+y0;
box_out(2,2)=box_in(2,2)+y0;

end