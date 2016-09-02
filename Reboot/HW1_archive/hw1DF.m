%% A* Manhattan, map 1

clear all
close all
home

mapa = read_map('maze1.pgm');
mapID = 1;
close figure 1
[loc, nodes] = get_start(mapa);
goal = get_goal(mapa);
prompt = 'Input Epsilon Value for Heuristic: ';
epsilon = input(prompt);

tic
h = manhattan(mapa, nodes, epsilon);
F = zeros(nodes, 1);
path = cell(nodes, 1);
path{loc} = {loc};
F(:) = inf;
F(loc) = h(loc) + numel(path{loc}) - 1;
find(min(F));

while(loc ~= goal)
    if numel(find(F==min(F))) == 1
        loc = find(F==min(F));
    else
        loc = randsample(find(F==min(F)),1);
    end
    [moves, num_moves] = get_neighbors(mapa, loc);
    for i = 1:num_moves
        if moves(i) == goal
            path{moves(i)} = [path{loc}, moves(i)];
            loc = goal; %endgame
            break
        elseif moves(i) ~= loc
            path{moves(i)} = [path{loc}, moves(i)];
            F(moves(i)) = h(moves(i)) + numel(path{moves(i)}) - 1;
        end
    end
    F(loc) = inf;
end

plotto = zeros(numel(path{goal}));
for j = 1:numel(path{goal})
    [x,y] = state_from_index(mapa, cell2mat(path{goal}(j)));
    plotto(j,1) = x;
    plotto(j,2) = y;
end
titles = ' A*, Manhattan Heuristic with:';
plot_path2(mapa, plotto, titles, toc, epsilon, numel(path{goal}), mapID);

%% A* Euclidean

clear all
close all
home

mapa = read_map('maze1.pgm');
mapID = 1;
close figure 1
[loc, nodes] = get_start(mapa);
goal = get_goal(mapa);
prompt = 'Input Epsilon Value for Heuristic: ';
epsilon = input(prompt);

tic
h = euclid(mapa, nodes, epsilon);
F = zeros(nodes, 1);
path = cell(nodes, 1);
path{loc} = {loc};
F(:) = inf;
F(loc) = h(loc) + numel(path{loc}) - 1;
find(min(F));

while(loc ~= goal)
    if numel(find(F==min(F))) == 1
        loc = find(F==min(F));
    else
        loc = randsample(find(F==min(F)),1);
    end
    [moves, num_moves] = get_neighbors(mapa, loc);
    for i = 1:num_moves
        if moves(i) == goal
            path{moves(i)} = [path{loc}, moves(i)];
            loc = goal; %endgame
            break
        elseif moves(i) ~= loc
            path{moves(i)} = [path{loc}, moves(i)];
            F(moves(i)) = h(moves(i)) + numel(path{moves(i)}) - 1;
        end
    end
    F(loc) = inf;
end

plotto = zeros(numel(path{goal}));
for j = 1:numel(path{goal})
    [x,y] = state_from_index(mapa, cell2mat(path{goal}(j)));
    plotto(j,1) = x;
    plotto(j,2) = y;
end
titles = ' A*, Euclidean Heuristic with:';
plot_path2(mapa, plotto, titles, toc, epsilon, numel(path{goal}), mapID);

%% A* Manhattan, map 2

clear all
close all
home

mapa = read_map('maze2.pgm');
mapID = 2;
close figure 1
[loc, nodes] = get_start(mapa);
goal = get_goal(mapa);
prompt = 'Input Epsilon Value for Heuristic: ';
epsilon = input(prompt);

tic
h = manhattan(mapa, nodes, epsilon);
F = zeros(nodes, 1);
path = cell(nodes, 1);
path{loc} = {loc};
F(:) = inf;
F(loc) = h(loc) + numel(path{loc}) - 1;
find(min(F));

while(loc ~= goal)
    if numel(find(F==min(F))) == 1
        loc = find(F==min(F));
    else
        loc = randsample(find(F==min(F)),1);
    end
    [moves, num_moves] = get_neighbors(mapa, loc);
    for i = 1:num_moves
        if moves(i) == goal
            path{moves(i)} = [path{loc}, moves(i)];
            loc = goal; %endgame
            break
        elseif moves(i) ~= loc
            path{moves(i)} = [path{loc}, moves(i)];
            F(moves(i)) = h(moves(i)) + numel(path{moves(i)}) - 1;
        end
    end
    F(loc) = inf;
end

plotto = zeros(numel(path{goal}));
for j = 1:numel(path{goal})
    [x,y] = state_from_index(mapa, cell2mat(path{goal}(j)));
    plotto(j,1) = x;
    plotto(j,2) = y;
end
titles = ' A*, Manhattan Heuristic with:';
plot_path2(mapa, plotto, titles, toc, epsilon, numel(path{goal}), mapID);

%% A* Euclidean, map 2

clear all
close all
home

mapa = read_map('maze2.pgm');
mapID = 2;
close figure 1
[loc, nodes] = get_start(mapa);
goal = get_goal(mapa);
prompt = 'Input Epsilon Value for Heuristic: ';
epsilon = input(prompt);

tic
h = euclid(mapa, nodes, epsilon);
F = zeros(nodes, 1);
path = cell(nodes, 1);
path{loc} = {loc};
F(:) = inf;
F(loc) = h(loc) + numel(path{loc}) - 1;
find(min(F));

while(loc ~= goal)
    if numel(find(F==min(F))) == 1
        loc = find(F==min(F));
    else
        loc = randsample(find(F==min(F)),1);
    end
    [moves, num_moves] = get_neighbors(mapa, loc);
    for i = 1:num_moves
        if moves(i) == goal
            path{moves(i)} = [path{loc}, moves(i)];
            loc = goal; %endgame
            break
        elseif moves(i) ~= loc
            path{moves(i)} = [path{loc}, moves(i)];
            F(moves(i)) = h(moves(i)) + numel(path{moves(i)}) - 1;
        end
    end
    F(loc) = inf;
end

plotto = zeros(numel(path{goal}));
for j = 1:numel(path{goal})
    [x,y] = state_from_index(mapa, cell2mat(path{goal}(j)));
    plotto(j,1) = x;
    plotto(j,2) = y;
end
titles = ' A*, Euclidean Heuristic with:';
plot_path2(mapa, plotto, titles, toc, epsilon, numel(path{goal}), mapID);

%% RRT, map 1

clear all 
close all
home

tic
mapa = read_map('maze1.pgm'); 
mapID = 1; 
close figure 1;
[loc, nodes] = get_start(mapa);
goal = get_goal(mapa);
tree = [1, 1, NaN];
count1 = 1;
count2 = 1;
endgame = 0;

while(endgame ~= 1)
    count1 = count1 + 1;
    if mod(count2, 5) == 0
        loc = goal;
    else
        loc = randsample((1:goal), 1);
    end
    pts = length(tree(:,1));
    distances = zeros(pts,2);
    for i = 1:pts
        distances(i,1) = tree(i,1);
        distances(i,2) = euclid2(mapa, loc, tree(i,2));
    end
    distances([find(distances(:,2)==0)],:) = [];
    distances = sortrows(distances,2); 
    for j = 1:size(distances,1)
        if check_hit2(mapa, tree(distances(j,1), 2), loc) ~= 1
            tree = [tree; count1, loc, distances(j,1)];
            if loc == goal || loc == 624 || loc == 600
                endgame = 1;
            end
            break
        elseif j == size(distances,1)
            count1 = count1 - 1;
            break
        else
            continue
        end
    end
    count2 = count2 + 1;
end

path = tree(end,2);
root = tree(end,3);
while ~isnan(root)
    path = [path; tree(root,2)];
    root = tree(root,3);
end
flipud(path);

plotto = zeros(length(path), 2);
for j = 1:numel(path)
    [x,y] = state_from_index(mapa, path(j));
    plotto(j,1) = x;
    plotto(j,2) = y;
end

pathlen = 0;
for k = 2:numel(path)
    pathlen = pathlen + euclid2(mapa, path(k), path(k-1));
end
titles = ', RRT';
plot_path(mapa, plotto, titles, toc, numel(path), mapID, pathlen);

%% RRT, map 2

clear all 
close all
home

tic
mapa = read_map('maze2.pgm'); 
mapID = 2; 
close figure 1;
[loc, nodes] = get_start(mapa);
goal = get_goal(mapa);
tree = [1, 1, NaN];
count1 = 1;
count2 = 1;
endgame = 0;

while(endgame ~= 1)
    count1 = count1 + 1;
    if mod(count2, 5) == 0
        loc = goal;
    else
        loc = randsample((1:goal), 1);
    end
    pts = length(tree(:,1));
    distances = zeros(pts,2);
    for i = 1:pts
        distances(i,1) = tree(i,1);
        distances(i,2) = euclid2(mapa, loc, tree(i,2));
    end
    distances([find(distances(:,2)==0)],:) = [];
    distances = sortrows(distances,2); 
    for j = 1:size(distances,1)
        if check_hit2(mapa, tree(distances(j,1), 2), loc) ~= 1
            tree = [tree; count1, loc, distances(j,1)];
            if loc == goal || loc == 624 || loc == 600
                endgame = 1;
            end
            break
        elseif j == size(distances,1)
            count1 = count1 - 1;
            break
        else
            continue
        end
    end
    count2 = count2 + 1;
end

path = tree(end,2);
root = tree(end,3);
while ~isnan(root)
    path = [path; tree(root,2)];
    root = tree(root,3);
end
flipud(path);

plotto = zeros(length(path), 2);
for j = 1:numel(path)
    [x,y] = state_from_index(mapa, path(j));
    plotto(j,1) = x;
    plotto(j,2) = y;
end

pathlen = 0;
for k = 2:numel(path)
    pathlen = pathlen + euclid2(mapa, path(k), path(k-1));
end
titles = ', RRT';
plot_path(mapa, plotto, titles, toc, numel(path), mapID, pathlen);

%% A* Euclidean, Map 1, 4D

clear all
close all
home

tic
mapa = read_map_for_dynamics('maze1.pgm');
mapID = 1;
close figure 1
[loc, nodes] = get_start_dynamic(mapa);
goal = get_goal_dynamic(mapa);
%prompt = 'Input Epsilon Value for Heuristic: ';
%epsilon = input(prompt);
epsilon = 2.3;
h = euclid(mapa, 625, epsilon);
F = zeros(nodes, 1);
path = cell(nodes, 1);
path{loc} = {loc};
F(:) = inf;
F(loc) = h(loc) + numel(path{loc}) - 1;
find(min(F));
counter = 1;

while(loc ~= goal)
    if numel(find(F==min(F))) == 1
        loc = find(F==min(F));
    else
        loc = randsample(find(F==min(F)),1);
    end
    [moves, num_moves] = get_neighbors_dynamic(mapa, loc);
    for i = 1:num_moves
        if moves(i) == goal
            path{moves(i)} = [path{loc}, moves(i)];
            loc = goal; %endgame
            break
        elseif moves(i) ~= loc
            path{moves(i)} = [path{loc}, moves(i)];
            [x, y, dx, dy] = dynamic_state_from_index(mapa, moves(i));
            ind = index_from_state(mapa,x,y);
            F(moves(i)) = h(ind) + counter;
        end
    end
    F(loc) = inf;
    counter = counter + 1;
end

plotto = zeros(numel(path{goal}));
for j = 1:numel(path{goal})
    [x,y,dx,dy] = dynamic_state_from_index(mapa, cell2mat(path{goal}(j)));
    plotto(j,1) = x;
    plotto(j,2) = y;
end
titles = ' A*, Euclidean Heuristic with:';
plot_path3(mapa, plotto, titles, toc, epsilon, numel(path{goal}), mapID);

%% A* Euclidean, Map 2, 4D

clear all
close all
home

tic
mapa = read_map_for_dynamics('maze2.pgm');
mapID = 2;
close figure 1
[loc, nodes] = get_start_dynamic(mapa);
goal = get_goal_dynamic(mapa);
%prompt = 'Input Epsilon Value for Heuristic: ';
%epsilon = input(prompt);
epsilon = 2.3;
h = euclid(mapa, 625, epsilon);
F = zeros(nodes, 1);
path = cell(nodes, 1);
path{loc} = {loc};
F(:) = inf;
F(loc) = h(loc) + numel(path{loc}) - 1;
find(min(F));
counter = 1;

while(loc ~= goal)
    if numel(find(F==min(F))) == 1
        loc = find(F==min(F));
    else
        loc = randsample(find(F==min(F)),1);
    end
    [moves, num_moves] = get_neighbors_dynamic(mapa, loc);
    for i = 1:num_moves
        if moves(i) == goal
            path{moves(i)} = [path{loc}, moves(i)];
            loc = goal; %endgame
            break
        elseif moves(i) ~= loc
            path{moves(i)} = [path{loc}, moves(i)];
            [x, y, dx, dy] = dynamic_state_from_index(mapa, moves(i));
            ind = index_from_state(mapa,x,y);
            F(moves(i)) = h(ind) + counter;
        end
    end
    F(loc) = inf;
    counter = counter + 1;
end

plotto = zeros(numel(path{goal}));
for j = 1:numel(path{goal})
    [x,y,dx,dy] = dynamic_state_from_index(mapa, cell2mat(path{goal}(j)));
    plotto(j,1) = x;
    plotto(j,2) = y;
end

pathlen = 0;
for k = 2:numel(path{goal})
    [x1, y1, dx1, dy1] = dynamic_state_from_index(mapa, cell2mat(path{goal}(k)));
    [x2, y2, dx1, dy1] = dynamic_state_from_index(mapa, cell2mat(path{goal}(k-1)));
    k1 = index_from_state(mapa,x1,y1);
    k2 = index_from_state(mapa,x2,y2);
    pathlen = pathlen + euclid2(mapa, k1, k2);
end
titles = ' A*, Euclidean Heuristic with:';
plot_path3(mapa, plotto, titles, toc, epsilon, counter, mapID, pathlen);

