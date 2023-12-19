% IMAGECORRECTION2;
% Correction of a projectively distorted image
%%----- Data for Correction -------------------------------------
%PDI=imread('DI2CamelsBBW.png');
%PDI=imread('DI2My Rocket.jpg');
PDI=imread('Cher.jpg');
% nwt=[50,50];   net=[8,680];
% swt=[1000, 60];   set=[972,635];
nwt=[10,30];   net=[60,725];
swt=[535, 30];   set=[440,288];
rwh=1.5; 
%--------------------------------------------------------------------
Name=['Distorted image of size ',vector2str(size(PDI),7,1)];
ShowImageBW(PDI,Name); pause
sf=0.01;                             % pixel size 
%-------------- Size estimation ------------------------------------
Method =1;  % By area estimation  
%Method =2; % By side length estimation
[nw,ne,sw,se,K]=EstimatedSize(nwt,net,swt,set,Method,rwh); 
h=round(((sw-nw)+(se-ne))/2);
w=round(((se-sw)+(ne-nw))/2);
sz=[int2str(h(1)),'x',int2str(w(2))];
fsz=[int2str(K),'x',int2str(K)];
CorSize=[sz,'-size in ',fsz,' frame'];
printstring('After correction image has ',CorSize);
%-------- Coordinates ----------------------------------------------
L=(K+1)/2;
X=sf*([nw(1),ne(1),se(1),sw(1)]-L);
Y=sf*([nw(2),ne(2),se(2),sw(2)]-L);
XT=sf*([nwt(1),net(1),set(1),swt(1)]-L);
YT=sf*([nwt(2),net(2),set(2),swt(2)]-L);
% %----------------- Perspective transformation ---------------------
H=ProjectiveTransform2(X,Y,XT,YT) % H is the inverse transform matrix 
%-------------------- Image correction ------------------------------
tic;
A=ImageTransform2(PDI,H,K,sf);  Name='I2';
%A=ImageTransform1(PDI,H,K,sf);  Name='I1';
%A=ImageTransform(PDI,H,K,sf);   Name='I0';
printstring([Name,' correction time - '],[number2str(toc,7,2),' sec']);
Title=['Corrected by ',Name,' - ',CorSize];
ShowImageBW(A,Title); pause
%-------------------- Median filtration -----------------------------
W5=[[0,1,0];...
    [1,1,1];...
    [0,1,0]];
%
W9=[[1,1,1];...
    [1,1,1];...
    [1,1,1]];
%
%FA=MedianFiltration(A,W5); FName='W5';
FA=MedianFiltration(A,W9);  FName='W9';
ShowImageBW(FA,['After median filtration by ',FName]);
%---------------------- Save image ----------------------------------
FileName=[Title,'.png'];
imwrite(FA,FileName);


