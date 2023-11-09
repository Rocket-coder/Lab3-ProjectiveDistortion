% IMAGEDISTORTION2;
% Projective distortion of an image
%--------------------------------------------------------------------
sz=[int2str(ht),'x',int2str(wt)];
IName='My Rocket.jpg';
Prompt='\color{blue}   - press any key to start transform';
ShowImageBW(A,[IName,Prompt]); pause
tic;
PDI=ImageTransform2v2(A,T,ht,wt,m);     Name='I2';
%PDI=ImageTransform1v3(A,T,ht,wt,m);    Name='I1';
%PDI=ImageTransform0v3(A,T,ht,wt,m);   Name='I0';
printstring([IName,' -distortion time - '],[number2str(toc,7,2),' sec']);
Title=[IName,'    distorted by ',Name,' - size ',sz];
ShowImageBW(PDI,Title);
%-------------------- Median filtration -----------------------------
W5=[[0,1,0];...
    [1,1,1];...
    [0,1,0]];
%
W9=[[1,1,1];...
    [1,1,1];...
    [1,1,1]];
%
%PDI=MedianFiltration(PDI,W5); FName='W5';
%PDI=MedianFiltration(PDI,W9);  FName='W9';
%ShowImageBW3(PDI,['After median filtration by ',FName]);
%---------------------- Save image ----------------------------------
FileName=['D',Name,IName];
imwrite(PDI,FileName);


