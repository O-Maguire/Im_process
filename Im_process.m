function Im_process(IMG,savefilename)
    maximize
    moveFigureToLargestMonitor
    set(gcf, 'color', 'w'); 
    set(gca,'FontSize',20,'LineWidth',2)
    set(findall(gca, 'Type', 'Line'),'LineWidth',2);
    if nargin<2
    else
        drawnow
        saveas(IMG,savefilename)
    end    
end


function moveFigureToLargestMonitor(fig)
% Ensures figure appears on the largest monitor (true fullscreen)

    if nargin < 1
        fig = gcf;
    end

    % Get monitor geometry
    mons = get(groot,'MonitorPositions');  % [x y width height]

    % Identify largest monitor by area
    areas = mons(:,3) .* mons(:,4);
    [~, idx] = max(areas);
    tgt = mons(idx,:);

    % Step 1 — Force MATLAB to use pixel units
    set(fig, 'Units', 'pixels');

    % Step 2 — Move figure FIRST (MUST happen before maximizing)
    set(fig, 'OuterPosition', tgt);

    drawnow; pause(0.05);  % small sync pause (important on Windows)

    % Step 3 — Maximize the window *after* it is on the right screen
    try
        set(fig, 'WindowState', 'normal');  % reset
        drawnow;
        set(fig, 'WindowState', 'maximized');
    catch
        % Older MATLAB fallback
        set(fig, 'OuterPosition', tgt);
    end

    drawnow;
end

