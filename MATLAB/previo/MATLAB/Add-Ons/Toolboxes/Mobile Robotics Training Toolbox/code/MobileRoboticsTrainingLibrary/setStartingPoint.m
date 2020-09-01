function setStartingPoint()

%% Load maps
mapVar = get_param(gcb,'mapVar');
mapForSim = evalin('base',mapVar);

%% Set starting point
fh = figure;
if ~isempty(mapForSim)
    show(mapForSim.simMap)    
else
    emptyMap = zeros(8,'logical');
    mapResolution = 2;
    simMap = robotics.BinaryOccupancyGrid(emptyMap,mapResolution);
    show(simMap)    
end

fh.Name = 'Mark Starting Position';
title('Mark starting position on the line')
hold on
h = impoint;
wait(h);
startPt = getPosition(h);
poseX = startPt(1);
poseY = startPt(2);
close(fh);

set_param(gcb,'startX',num2str(poseX));
set_param(gcb,'startY',num2str(poseY));

end