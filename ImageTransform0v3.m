function A =ImageTransform0v3(B,T,ht,wt,L)
% Perspective transform of an image (no subpixels!)
% T  is the transformation matrix
% [ht,wt]  is the size of output matrix A
% L is the margin size
%---------------------------------------------------
[M,N]=size(B); 
A=255*ones(ht,wt,'uint8');   % white background  
L=L-1; 
for x=1:M; 
for y=1:N;
  v=[x+L; y+L; 1];
  Tv=T*v;
  if Tv(3)==0; error('zero coordinate'); end;
  X=ceil(Tv(1)/Tv(3)); 
  Y=ceil(Tv(2)/Tv(3));
  if ~((X>ht)||(X<1)||(Y>wt)||(Y<1));
      A(X,Y)=B(x,y);   
  end;
end;    
end;
end
