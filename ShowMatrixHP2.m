function ShowMatrixHP2(A,S,x,y);
% Demonstraton of a 3x3-matrix
%
m=8; n=4;
a=A(1,1); b=A(1,2); e=A(1,3);
c=A(2,1); d=A(2,2); f=A(2,3);
g=A(3,1); h=A(3,2); p=A(3,3);
%detAs=number2str(det(A),m,n);
MT=['$$',S,'=\left[\begin{array}{rrr}',...
   number2str(a,m,n),'&',number2str(b,m,n),'&',number2str(e,m,n),'\\'...
   number2str(c,m,n),'&',number2str(d,m,n),'&',number2str(f,m,n),'\\'...
   number2str(g,m,n),'&',number2str(h,m,n),'&',number2str(p,m,n),'\\'...
              '\end{array}\right]$$'];
%TXT={MT;['det(A)=',detAs]};  
TXT=MT;  
text('Interpreter','latex','String',TXT,...
   'Position',[x,y],'FontSize',18,'FontWeight','bold','Color','k')
end

