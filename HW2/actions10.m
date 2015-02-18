%% Populate map, generate all possible map.actions
function [ map ] = actions10(map, sides)

map.rows = sides;
map.cols = sides;
map.action = 5 + zeros(sides,sides);
map.actions = cell(sides,sides);
[map.actions{:}] = deal([]);

corners = [1 sides (sides * sides - sides + 1) (sides * sides)];
walls1 = [2, 3, 4, 5, 6, 7, 8, 9, 92, 93, 94, 95, 96, 97, 98, 99];
walls2 = [11, 21, 31, 41, 51, 61, 71, 81, 20, 30, 40, 50, 60, 70, 80, 90];
walls = [walls1, walls2];
walls = sort(walls);

map.action(walls) = 4;
map.action(corners) = 3;

for i = 1:(sides * sides)
    map.actions{i} = [map.actions{i}, i];
    if map.action(i) == 3
        if i == 1 
            map.actions{i} = [map.actions{i}, i + 1];
            map.actions{i} = [map.actions{i}, i + 10];
        elseif i == 10
            map.actions{i} = [map.actions{i}, i - 1];
            map.actions{i} = [map.actions{i}, i + 10];
        elseif i == 91 
            map.actions{i} = [map.actions{i}, i + 1];
            map.actions{i} = [map.actions{i}, i - 10];
        else
            map.actions{i} = [map.actions{i}, i - 1];
            map.actions{i} = [map.actions{i}, i - 10];
        end
    elseif map.action(i) == 4
        if i < 10 
            map.actions{i} = [map.actions{i}, i - 1];
            map.actions{i} = [map.actions{i}, i + 1];
            map.actions{i} = [map.actions{i}, i + 10];
        elseif mod(i,10) == 0
            map.actions{i} = [map.actions{i}, i - 1];
            map.actions{i} = [map.actions{i}, i - 10];
            map.actions{i} = [map.actions{i}, i + 10];
        elseif i > 90
            map.actions{i} = [map.actions{i}, i - 1];
            map.actions{i} = [map.actions{i}, i + 1];
            map.actions{i} = [map.actions{i}, i - 10];
        else
            map.actions{i} = [map.actions{i}, i - 4];
            map.actions{i} = [map.actions{i}, i + 1];
            map.actions{i} = [map.actions{i}, i + 10];
        end
    else
        map.actions{i} = [map.actions{i}, i - 1];
        map.actions{i} = [map.actions{i}, i + 1];
        map.actions{i} = [map.actions{i}, i - 10];
        map.actions{i} = [map.actions{i}, i + 10];
    end
end

clear i; clear j;  clear k;
end