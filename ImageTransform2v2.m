function A =ImageTransform2v2(B,T,ht,wt,L)
% Perspective transform of an image with 9 subpixels
% T  is the transformation matrix
% [ht,wt]  is the size of output matrix A
% L is the margin size
%---------------------------------------------------
[M,N]=size(B);   
A=255*ones(ht,wt,'uint8');    % white background  
d=0.5;   c=d/2;       % subpixel size and subsubpixel size
D=d*[-1,-1,0; -1,0,0; -1,1,0;
      0,-1,0;  0,0,0;  0,1,0;
      1,-1,0;  1,0,0;  1,1,0]; 
C=c*[-1,-1,0; -1,1,0; 
      1,-1,0;  1,1,0];    
D=[D;C]; D=D';
L=L-1; 
ft='\fontsize{12}\bf\color{black}';
hd='Transform by I2 method in progress...';
h=waitbar(0,[ft,hd]);
set(h,'Color','c');
for px=1:M;     
  for py=1:N;     
%---------------------------------------------- pixel (px,py)
    v=[px+L; py+L;1]; % coordinates  
    V=[v,v,v,v,v,v,v,v,v,v,v,v,v];
    V=V+D; 
    TV=T*V;
    for k=1:size(V,2); 
       Tv=TV(:,k);
       if Tv(3)==0; error('zero coordinate'); end;
       Xk=ceil(Tv(1)/Tv(3)); 
       Yk=ceil(Tv(2)/Tv(3));
       if ~((Xk>ht)||(Xk<1)||(Yk>wt)||(Yk<1));
           A(Xk,Yk)=B(px,py);      
       end;
    end;
%----------------------------------------------------    
  end;  
  waitbar(px/M);
end;
close(h);
end

