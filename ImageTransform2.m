function A =ImageTransform2(B,T,K,sf);
% Perspective transform of an image with 13 subpixels
% T  is the transformation matrix
% K  is the size of square output matrix A
% sf is the scale factor
%---------------------------------------------------
[M,N]=size(B);   
A=255*ones(K,'uint8');  % white background  
%A=zeros(K,'uint8');    % black background  
d=0.5*sf;   c=d/2;       % subpixel size and subsubpixel size
D=d*[-1,-1,0; -1,0,0; -1,1,0;
      0,-1,0;  0,0,0;  0,1,0;
      1,-1,0;  1,0,0;  1,1,0]; 
C=c*[-1,-1,0; -1,1,0; 
      1,-1,0;  1,1,0];    
D=[D;C]; D=D';
L=(K+1)/2;
s=1/sf;
ft='\fontsize{12}\bf\color{black}';
hd='Transform by I2 method in progress...';
h=waitbar(0,[ft,hd]);
set(h,'Color','c');
for px=1:M;     
  for py=1:N;     
%---------------------------------------------- pixel (px,py)
    x=sf*(px-L); y=sf*(py-L);     % coordinates  
    v=[x;y;1];
    V=[v,v,v,v,v,v,v,v,v,v,v,v,v];
    V=V+D; 
    TV=T*V;
    for k=1:size(V,2); 
       Tv=TV(:,k);
       if Tv(3)==0; error('zero coordinate'); end;
       Xk=round(L+s*Tv(1)/Tv(3)); 
       Yk=round(L+s*Tv(2)/Tv(3));
       if ~((Xk>K)||(Xk<1)||(Yk>K)||(Yk<1));
           A(Xk,Yk)=B(px,py);      
       end;
    end;
%----------------------------------------------------    
  end;  
  waitbar(px/M);
end;
close(h);
end

