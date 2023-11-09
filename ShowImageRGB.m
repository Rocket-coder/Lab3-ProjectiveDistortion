function ShowImageRGB(A,T)
%show RGB IMAGE 
% 
%sn=256; 
%l=double(min(min(A))); 
%h=double(max(max(A)));
fs='\fontsize{20}\bf\color{red}';
%IS=grayslice(mat2gray(double(A),[l,h]),sn);
subplot(1,1,1), subimage(A)
    title([fs,T])
    %colormap(jet(sn))
    set(gcf,'Color','w')
    set(gca,'TickDir','out'), 
    set(gca,'XColor','k','YColor','k','fontsize',11,'fontweight','b')
    %setcolourbar(l,h);
    %colorbar
end

