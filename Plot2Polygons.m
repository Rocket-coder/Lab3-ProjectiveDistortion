function Plot2Polygons(X1,Y1,X2,Y2,sf,shadecol,points,L,Name1,Name2)
% 
X1=sf*[X1;X1(1)];   Y1=sf*[Y1;Y1(1)];
X2=sf*[X2;X2(1)];   Y2=sf*[Y2;Y2(1)];

set(gcf,'Color','w') 
subplot(1,2,1)
PlotSubPolygon(X1,Y1,shadecol,points,L,Name1)
hold off
subplot(1,2,2)
PlotSubPolygon(X2,Y2,shadecol,points,L,Name2)
hold off
end

