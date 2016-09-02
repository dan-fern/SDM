% Function for testing paths in 4D and 2D problems
% By Geoff Gordon and Geoff Hollinger, 2007

%Displays a path on the 2D map given by the path input vector.
%Path is a vector of (x,y) coordinates with format:
%path(1,:) = [x1 y1]
%path(2,:) = [x2 y2]
%etc...

function plot_path3(map, XY, title_name, toc, epsilon, nodes, mapID, len)

figureHandle = figure('Position',[25,55,800,600]);
figure(1);
colors=['b' 'r'];
imagesc(map.cells');

colormap(bone);
A= 1-colormap;
colormap(A);
tit1 = ['Map ', num2str(mapID), ','];
tit2 = [' Epsilon = ', num2str(epsilon)];
tit3 = [', Run Time = ', num2str(toc), ' sec,'];
tit4 = [' Length = ', num2str(len)];
tit5 = [', and ', num2str(nodes), ' Nodes Expanded'];
tits = strcat(tit1, title_name, tit2, tit3, tit4, tit5);
title(tits,'FontSize',10);

for i = 1: size(XY,1)-1
    Cindex = mod(i,2);
    line('Xdata',[XY(i,1) XY(i+1,1)], 'Ydata',[XY(i,2) XY(i+1,2)],'Color',colors(Cindex+1),'LineWidth',4);
end    