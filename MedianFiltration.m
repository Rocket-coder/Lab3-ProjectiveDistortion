function G=MedianFiltration(A,W);
%
[M,N]=size(A);
[K,L]=size(W);
K1=(K-1)/2; L1=(L-1)/2; 
A=padarray(A,[K1 L1]);
MA=zeros(K*L,1);
G=zeros(M,N);
ft='\fontsize{12}\bf\color{black}';
hd='Median filtration in progress...';
h=waitbar(0,[ft,hd]);
set(h,'Color','c');
tic;
for x=K1+1:M-K1;
for y=L1+1:N-L1; 
        z=0;
        for p=-K1:K1;
        for q=-L1:L1;
            z=z+1;
            MA(z)=A(x+p,y+q);
        end;
        end;
        G(x,y)=median(MA);
end;
waitbar(x/M);
end;
close(h);
G=uint8(G);
printstring(['Median filtration time - '],[number2str(toc,7,2),' sec']);
ShowImageBW(G,'MF');
end
