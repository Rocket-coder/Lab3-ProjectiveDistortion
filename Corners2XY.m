function [X,Y] = Corners2XY(nw,ne,sw,se,f);
%
%----------------------------------------
X=f*[nw(1) sw(1) se(1) ne(1)   nw(1) ];
Y=f*[nw(2) sw(2) se(2) ne(2)   nw(2) ];
X=X';
Y=Y';
end

