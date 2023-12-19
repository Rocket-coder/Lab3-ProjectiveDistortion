% FINDMATRIX;
% To find a matrix for the given 4+4-transform  
%--------------------------------------------------------------          % the window size  
L=12; WS=[0, L, 0, L];  % the window size  
% IName='CamelsBBW.png';
IName='My Rocket.jpg';
A=imread(IName); 
ShowImageRGB(A,IName); 
[h,w]=size(A);
printstring('Original image has size [h,w]=',vector2str([h,w],7,1));
pause;
%----- Corners of image (in MatLab image coordinates)----------
m=50;         % margin size
nw=[m,  m];   ne=[m,  m+w];  %
sw=[m+h,m];   se=[m+h,m+w];  % 
[X,Y] = Corners2XY(nw,ne,sw,se,1); % X,Y - 2-vectors
ShowCoordinates(X,Y,7,3,'Initial corners - X,Y: ');
%----- Corners of distorted image -----------------------------
nwt=nw+[0,0];  net=ne+[ 50,-100];
swt=sw+[0,10]; set=se+[-50,-150];
ht=2*m+max((swt(1)-nwt(1)),(set(1)-net(1)));
wt=2*m+max((net(2)-nwt(2)),(set(2)-swt(2)));
[XT,YT] = Corners2XY(nwt,net,swt,set,1); % X,Y - 2-vectors
ShowCoordinates(XT,YT,7,3,'Distorted corners - XT,YT: ');
%-------------------------------------------------- -----------
col1=[0.9,0.9,1.0]; % light blue
sf=0.01;            % scale factor
Name1='Original';   Name2='Distorted';
Plot2Polygons(X,Y,XT,YT,sf,col1,1,WS,Name1,Name2);         
hold on
%----------------- Perspective transformation -------
% Evaluation of the transform matrix on 
% the base of coordinates of 4+4 points only
T=ProjectiveTransform2(XT,YT,X,Y) 
ShowMatrixHP2(T,'T',0.15,11.0);
hold off
