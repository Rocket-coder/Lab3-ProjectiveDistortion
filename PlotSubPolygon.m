function PlotSubPolygon(Px,Py,shadecol,points,L,Name)
% 
np=size(Px,1); % number of points
% set(gcf,'Color','w') 
% subplot(1,1,1)
%-- Corners ---------------------------------------------
plot(L(1),L(3),'-go','LineWidth',1,'MarkerEdgeColor','b',...
                 'MarkerFaceColor','b','MarkerSize',5);
hold on            
plot(L(2),L(3),'-go','LineWidth',1,'MarkerEdgeColor','b',...
                 'MarkerFaceColor','b','MarkerSize',5);
hold on            
plot(L(1),L(4),'-go','LineWidth',1,'MarkerEdgeColor','b',...
                 'MarkerFaceColor','b','MarkerSize',5);
            
plot(L(2),L(4),'-go','LineWidth',1,'MarkerEdgeColor','b',...
                 'MarkerFaceColor','b','MarkerSize',5); 
hold on 
%------- Shading -------------------------------------
if shadecol~=0; fill(Px,Py,shadecol); end;
%-- Polygon --------------------------------------------
plot(Px,Py,'-bo','LineWidth',3,'MarkerEdgeColor','k',...
              'MarkerFaceColor','k','MarkerSize',1);       
hold on     
%-- Points -------------------------------------
if points==1;
  dx = 0.15; dy=0.2;
  ts2='\fontsize{16}\bf\color{black}';
  for p=0:np-2;
      plot(Px(p+1),Py(p+1),'-ko','LineWidth',1,'MarkerEdgeColor','k',...
                 'MarkerFaceColor','r','MarkerSize',10);   
      ps=int2str(p);
      text(Px(p+1)+dx, Py(p+1)+dy, [ts2,'P_{',ps,'}']);       
      hold on
  end;
end;
%---------------------------------------------------------
set(gca,'XColor','b','YColor','b','fontsize',14,'fontweight','b');
ts1='\fontsize{18}\bf\color{red}';
title([ts1,Name]);  
ts3='\fontsize{16}\bf\color{black}';
xlabel([ts3,'x']); ylabel([ts3,'y']); 
axis(L);
axis square; %axis tight; %axis equal  
grid on
%grid off
%hold off
end
%
