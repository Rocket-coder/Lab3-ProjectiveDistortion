function A =ImageTransform(B,T,K,sf)
% Perspective transform of an image (no subpixels!)
% T  is the transformation matrix
% K  is the size of square output matrix A
% sf is the scale factor
%---------------------------------------------------
[M,N]=size(B); 
A=255*ones(K,'uint8');   % white background  
%A=zeros(K,'uint8');     % black background  
L=(K+1)/2;
s=1/sf;
for x=1:M; 
for y=1:N;
  v=[sf*(x-L); sf*(y-L); 1];
  Tv=T*v;
  if Tv(3)==0; error('zero coordinate'); end;
  X=round(L+s*Tv(1)/Tv(3)); 
  Y=round(L+s*Tv(2)/Tv(3));
  if ~((X>K)||(X<1)||(Y>K)||(Y<1));
      A(X,Y)=B(x,y);      
  end;
end;    
end;
end
