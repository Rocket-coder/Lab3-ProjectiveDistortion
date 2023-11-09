function ShowCoordinates(X,Y,m,n,Name);
%
X=X(1:4); Y=Y(1:4); 
X=X'; Y=Y';
xs=vector2str(X,m,n);
ys=vector2str(Y,m,n);
scip=blanks(length(Name));
printstring([Name,'x - '],xs);
printstring([scip,'y - '],ys);
end

