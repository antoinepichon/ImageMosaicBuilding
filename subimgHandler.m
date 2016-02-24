function [subimg_set,x,y]=subimgHandler(N,l_sub,h_sub,A)

% Gestion des sous-images

x=zeros(1:N);
y=x;

for i=1:N
    [x(i),y(i)] = ginput(1); 
    x(i)=floor(x(i)); 
    y(i)=floor(y(i));
    
    line([x(i),x(i)+l_sub],[y(i),y(i)])
    line([x(i),x(i)],[y(i),y(i)+h_sub])
    line([x(i)+l_sub,x(i)+l_sub],[y(i),y(i)+h_sub])
    line([x(i),x(i)+l_sub],[y(i)+h_sub,y(i)+h_sub]) 
    
    subimg_set{i}=A(y(i):y(i)+h_sub-1,x(i):x(i)+l_sub-1);
end