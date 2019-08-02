function Im_process(IMG,savefilename)
    maximize
    set(gcf, 'color', 'w'); 
    set(gca,'FontSize',20,'LineWidth',2)
    set(findall(gca, 'Type', 'Line'),'LineWidth',2);
    if nargin<2
    else
        drawnow
        saveas(IMG,savefilename)
    end    
end
