%% Populate map, generate all possible map.actions
function [ map ] = actions(map, sides)

map.rows = sides;
map.cols = sides;
map.action = 5 + zeros(sides,sides);
map.actions = cell(sides,sides);
[map.actions{:}] = deal([]);

corners = [1 sides (sides * sides - sides + 1) (sides * sides)];
walls = [2, 3, 5, 8, 9, 12, 14, 15];
walls = sort(walls);

map.action(walls) = 4;
map.action(corners) = 3;

for i = 1:(sides * sides)
    map.actions{i} = [map.actions{i}, i];
    if map.action(i) == 3
        if i == 1 
            map.actions{i} = [map.actions{i}, i + 1];
            map.actions{i} = [map.actions{i}, i + 4];
        elseif i == 4
            map.actions{i} = [map.actions{i}, i - 1];
            map.actions{i} = [map.actions{i}, i + 4];
        elseif i == 13 
            map.actions{i} = [map.actions{i}, i + 1];
            map.actions{i} = [map.actions{i}, i - 4];
        else
            map.actions{i} = [map.actions{i}, i - 1];
            map.actions{i} = [map.actions{i}, i - 4];
        end
    elseif map.action(i) == 4
        if i == 2 || i == 3 
            map.actions{i} = [map.actions{i}, i - 1];
            map.actions{i} = [map.actions{i}, i + 1];
            map.actions{i} = [map.actions{i}, i + 4];
        elseif i == 8 || i == 12 
            map.actions{i} = [map.actions{i}, i - 1];
            map.actions{i} = [map.actions{i}, i - 4];
            map.actions{i} = [map.actions{i}, i + 4];
        elseif i == 14 || i == 15
            map.actions{i} = [map.actions{i}, i - 1];
            map.actions{i} = [map.actions{i}, i + 1];
            map.actions{i} = [map.actions{i}, i - 4];
        else
            map.actions{i} = [map.actions{i}, i - 4];
            map.actions{i} = [map.actions{i}, i + 1];
            map.actions{i} = [map.actions{i}, i + 4];
        end
    else
        map.actions{i} = [map.actions{i}, i - 1];
        map.actions{i} = [map.actions{i}, i + 1];
        map.actions{i} = [map.actions{i}, i - 4];
        map.actions{i} = [map.actions{i}, i + 4];
    end
end

clear i; clear j;  clear k;
end