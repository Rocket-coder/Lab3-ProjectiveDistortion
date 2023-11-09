function str=vector2str(vec,m,n)
%Vector of numbers into string
N=max(size(vec));
if N==1; 
   str=number2str(vec(1),m,n);   
else
   str='[';
   for x=1:N-1;
      str=[str,number2str(vec(x),m,n),',',blanks(1)];
   end;
   str=[str,number2str(vec(N),m,n),']'];
end;
%printvector(str,vec); blanks
end



