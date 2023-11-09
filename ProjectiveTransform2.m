function H=ProjectiveTransform2(XT,YT,X,Y)
%
%ShowCoordinates(XT,YT,7,3,'Inside Initial corners - XT,YT: ');
%ShowCoordinates(X,Y,7,3,'Inside Final corners - X,Y: ');
H=zeros(3);
T=zeros(8);
h=zeros(8,1);
b=zeros(8,1);
%--------------------
x1=X(1); y1=Y(1);
x2=X(2); y2=Y(2);
x3=X(3); y3=Y(3);
x4=X(4); y4=Y(4);
%--------------------
X1=XT(1); Y1=YT(1);
X2=XT(2); Y2=YT(2);
X3=XT(3); Y3=YT(3);
X4=XT(4); Y4=YT(4);
%------------------------------------------
T=[x1, y1, 1,  0,  0, 0, -X1*x1, -X1*y1;
    0,  0, 0, x1, y1, 1, -Y1*x1, -Y1*y1;
   x2, y2, 1,  0,  0, 0, -X2*x2, -X2*y2; 
    0,  0, 0, x2, y2, 1, -Y2*x2, -Y2*y2;
   x3, y3, 1,  0,  0, 0, -X3*x3, -X3*y3;
    0,  0, 0, x3, y3, 1, -Y3*x3, -Y3*y3;
   x4, y4, 1,  0,  0, 0, -X4*x4, -X4*y4;
    0,  0, 0, x4, y4, 1, -Y4*x4, -Y4*y4];
%------------------------------------------
b=[X1, Y1, X2, Y2, X3, Y3, X4, Y4];
h=T\(b');
H=[h(1),h(2),h(3);
   h(4),h(5),h(6);
   h(7),h(8),1];
end

