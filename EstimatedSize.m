function [nw,ne,sw,se,K]=EstimatedSize(nwt,net,swt,set,Method,rwh);
% Evaluate size of the corrected image
% Based on the area estimation + the known ratio of sides
%--------------------------------------------------------
if rwh==0; rwh=1.5; end; % by default (if unknown)
switch Method
%----------------------------------------------------
case 1; % By area estimation    
d1=set-nwt; d1=[d1,0];
d2=net-swt; d2=[d2,0];
S=0.5*norm(vecprod(d1,d2));  % area in (pixels)^2 
%S=1.5*S;                     % Correction
h=sqrt(S/rwh);  
w0=round(rwh*h); h0=round(h);
printvector('Size by area estimation: [h,w]=',[h0,w0]);
%------------------------------------------------------
case 2; % By side length estimation
hw=abs(nwt(1)-swt(1));  % wn=abs(nwt(2)-net(2));
he=abs(net(1)-set(1));  % ws=abs(swt(2)-set(2));
h=max(hw,he);           % w=max(wn,ws); s=w/h;
h=0.85*h;               % correction
w0=round(rwh*h); h0=round(h);
printvector('Size by sides length estimation [h,w]=',[h0,w0]);
%-------------------------------------------------------
otherwise error('Wrong method');
end;
%-------------------------------------------------------
my=40;                        % left margin (arbitrary)
K=max(h0,w0)+2*my;            % the size of image
if mod(K,2)==0; K=K+1;end;    % K must be odd
mx=floor((K-h0)/2);           % top and bottom margins
x0=mx; y0=my;         
nw=[x0,   y0];  
ne=[x0,   y0+w0];
sw=[x0+h0,y0];  
se=[x0+h0,y0+w0];
end

