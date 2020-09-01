function setupRobotSim_BO()

%% Figure setup
% FigureName - Name of simulation figure window
FigureName = 'Robot Simulator';
FigureTag = 'RobotSimulator';
existingFigures = findobj('type','figure','tag',FigureTag);
if ~isempty(existingFigures)
    figure(existingFigures(1)); % bring figure to the front
    error('There is already an existing figure window for RobotSimulator.');
end
Figure = figure('Name',FigureName,'tag',FigureTag);
ax = axes('parent',Figure);

%% Load maps
mapVar = get_param(gcb,'mapVar');
mapForSim = evalin('base',mapVar);

if ~isempty(mapForSim)
    show(mapForSim.simMap,'Parent',ax);            
else
    emptyMap = zeros(8,'logical');
    mapResolution = 2;
    simMap = robotics.BinaryOccupancyGrid(emptyMap,mapResolution);
    show(simMap,'Parent',ax);            
end

%% Plotting
poseX = str2double(get_param(gcb,'startX'));
poseY = str2double(get_param(gcb,'startY'));
poseTheta = str2double(get_param(gcb,'startTheta'));

xAxesLim = get(ax,'XLim');
lineLength = xAxesLim(2)/15;
poseXp = [poseX poseX+lineLength*cosd(poseTheta)];
poseYp = [poseY poseY+lineLength*sind(poseTheta)];

hold(ax,'on');
title(ax,'Circle = robot position, Line = robot orientation');
PlotHandle1 = plot(ax,poseXp,poseYp,'r');
PlotHandle2 = plot(ax,poseX,poseY,'bo','MarkerFaceColor',[1 1 1]);
hold(ax,'off');

assignin('base','PlotHandle1',PlotHandle1);
assignin('base','PlotHandle2',PlotHandle2);
assignin('base','lineLength',lineLength);
end