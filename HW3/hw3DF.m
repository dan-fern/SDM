%% Part 3.1/3.2 (Greedy/B&B Solver for Map 1 with budget of 8)
clear all
close all
home

load('maps.mat');
[x,y,z] = generateVis(map1);
mapa = actions(map1, map1.sideSize);
mapa.cost = manhatt(mapa, 16, 1);
budget = 8;
path = [1, 1];
for i = 1:budget
    timeLeft = budget - i + 1;
    index = index_from_st(mapa, path(end,1), path(end,2));
    neighbors = mapa.actions{index};
    for j = 1:numel(neighbors)
        nextIndex = find(z==max(z(neighbors)));
        if mapa.cost(nextIndex) >= timeLeft
            neighbors(neighbors==nextIndex) = []; 
            clear nextIndex;
        else
            [X,Y] = state_from_in(mapa,nextIndex);
            path = [path; X, Y];
            break;
        end
    end
end
[info, cost] = evaluatePath(path, mapa)
plotPath(path, mapa, 'Greedy Solution, Map 1, Budget = 8');
greedy = path;
clear path;

% Branch and Bound section below
openSet = cell(1);
openSet{1} = [1,1]; 
[lower, cost] = evaluatePath(greedy, mapa);
path = [];
goal = 16;
maxZ = max(max(z));
while(~isempty(openSet))
    pop = cell2mat(openSet(end));
    openSet(end)=[];
    index = index_from_st(mapa, pop(end,1), pop(end,2));
    neighbors = mapa.actions{index};
    for i = 1:numel(neighbors)
        [X,Y] = state_from_in(mapa,neighbors(i));
        popNbrs = [pop; X, Y];
        [info, cost] = evaluatePath(popNbrs, mapa);
        timeLeft = budget - length(popNbrs(:,1)) + 1;
        upper = timeLeft * maxZ + info;
        if upper < lower
            continue;
        elseif neighbors(i) == goal && cost == budget
                lower = upper;
                path = popNbrs;
        elseif cost >= budget
            continue;
        else
            openSet(end + 1) = {popNbrs};
        end
    end
end
[info, cost] = evaluatePath(path, mapa)
plotPath(path, mapa, 'B&B Solution, Map 1, Budget = 8');

%% Part 3.1/3.2 (Greedy/B&B Solver for Map 2 with budget of 8)
clear all
close all
home

load('maps.mat');
[x,y,z] = generateVis(map2);
mapa = actions(map2, map2.sideSize);
mapa.cost = manhatt(mapa, 16, 1);
budget = 8;
path = [1, 1];
for i = 1:budget
    timeLeft = budget - i + 1;
    index = index_from_st(mapa, path(end,1), path(end,2));
    neighbors = mapa.actions{index};
    for j = 1:numel(neighbors)
        nextIndex = find(z==max(z(neighbors)));
        if mapa.cost(nextIndex) >= timeLeft
            neighbors(neighbors==nextIndex) = []; 
            clear nextIndex;
        else
            [X,Y] = state_from_in(mapa,nextIndex);
            path = [path; X, Y];
            break;
        end
    end
end
[info, cost] = evaluatePath(path, mapa)
plotPath(path, mapa, 'Greedy Solution, Map 2, Budget = 8');
greedy = path;
clear path;

% Branch and Bound section below
openSet = cell(1);
openSet{1} = [1,1]; 
[lower, cost] = evaluatePath(greedy, mapa);
path = [];
goal = 16;
maxZ = max(max(z));
while(~isempty(openSet))
    pop = cell2mat(openSet(end));
    openSet(end)=[];
    index = index_from_st(mapa, pop(end,1), pop(end,2));
    neighbors = mapa.actions{index};
    for i = 1:numel(neighbors)
        [X,Y] = state_from_in(mapa,neighbors(i));
        popNbrs = [pop; X, Y];
        [info, cost] = evaluatePath(popNbrs, mapa);
        timeLeft = budget - length(popNbrs(:,1)) + 1;
        upper = timeLeft * maxZ + info;
        if upper < lower
            continue;
        elseif neighbors(i) == goal && cost == budget
                lower = upper;
                path = popNbrs;
        elseif cost >= budget
            continue;
        else
            openSet(end + 1) = {popNbrs};
        end
    end
end
[info, cost] = evaluatePath(path, mapa)
plotPath(path, mapa, 'B&B Solution, Map 2, Budget = 8'); 

%% Part 3.1/3.2 (Greedy/B&B Solver for Map 1 with budget of 6)
clear all
close all
home

load('maps.mat');
[x,y,z] = generateVis(map1);
mapa = actions(map1, map1.sideSize);
mapa.cost = manhatt(mapa, 16, 1);
budget = 6;
path = [1, 1];
for i = 1:budget
    timeLeft = budget - i + 1;
    index = index_from_st(mapa, path(end,1), path(end,2));
    neighbors = mapa.actions{index};
    for j = 1:numel(neighbors)
        nextIndex = find(z==max(z(neighbors)));
        if mapa.cost(nextIndex) >= timeLeft
            neighbors(neighbors==nextIndex) = []; 
            clear nextIndex;
        else
            [X,Y] = state_from_in(mapa,nextIndex);
            path = [path; X, Y];
            break;
        end
    end
end
[info, cost] = evaluatePath(path, mapa)
plotPath(path, mapa, 'Greedy Solution, Map 1, Budget = 6');
greedy = path;
clear path;

% Branch and Bound section below
openSet = cell(1);
openSet{1} = [1,1]; 
[lower, cost] = evaluatePath(greedy, mapa);
path = [];
goal = 16;
maxZ = max(max(z));
while(~isempty(openSet))
    pop = cell2mat(openSet(end));
    openSet(end)=[];
    index = index_from_st(mapa, pop(end,1), pop(end,2));
    neighbors = mapa.actions{index};
    for i = 1:numel(neighbors)
        [X,Y] = state_from_in(mapa,neighbors(i));
        popNbrs = [pop; X, Y];
        [info, cost] = evaluatePath(popNbrs, mapa);
        timeLeft = budget - length(popNbrs(:,1)) + 1;
        upper = timeLeft * maxZ + info;
        if upper < lower
            continue;
        elseif neighbors(i) == goal && cost == budget
                lower = upper;
                path = popNbrs;
        elseif cost >= budget
            continue;
        else
            openSet(end + 1) = {popNbrs};
        end
    end
end
[info, cost] = evaluatePath(path, mapa)
plotPath(path, mapa, 'B&B Solution, Map 1, Budget = 6'); 

%% Part 3.1/3.2 (Greedy/B&B Solver for Map 2 with budget of 6)
clear all
close all
home

load('maps.mat');
[x,y,z] = generateVis(map2);
mapa = actions(map2, map2.sideSize);
mapa.cost = manhatt(mapa, 16, 1);
budget = 6;
path = [1, 1];
for i = 1:budget
    timeLeft = budget - i + 1;
    index = index_from_st(mapa, path(end,1), path(end,2));
    neighbors = mapa.actions{index};
    for j = 1:numel(neighbors)
        nextIndex = find(z==max(z(neighbors)));
        if mapa.cost(nextIndex) >= timeLeft
            neighbors(neighbors==nextIndex) = []; 
            clear nextIndex;
        else
            [X,Y] = state_from_in(mapa,nextIndex);
            path = [path; X, Y];
            break;
        end
    end
end
[info, cost] = evaluatePath(path, mapa)
plotPath(path, mapa, 'Greedy Solution, Map 2, Budget = 6');
greedy = path;
clear path;

% Branch and Bound section below
openSet = cell(1);
openSet{1} = [1,1]; 
[lower, cost] = evaluatePath(greedy, mapa);
path = [];
goal = 16;
maxZ = max(max(z));
while(~isempty(openSet))
    pop = cell2mat(openSet(end));
    openSet(end)=[];
    index = index_from_st(mapa, pop(end,1), pop(end,2));
    neighbors = mapa.actions{index};
    for i = 1:numel(neighbors)
        [X,Y] = state_from_in(mapa,neighbors(i));
        popNbrs = [pop; X, Y];
        [info, cost] = evaluatePath(popNbrs, mapa);
        timeLeft = budget - length(popNbrs(:,1)) + 1;
        upper = timeLeft * maxZ + info;
        if upper < lower
            continue;
        elseif neighbors(i) == goal && cost == budget
                lower = upper;
                path = popNbrs;
        elseif cost >= budget
            continue;
        else
            openSet(end + 1) = {popNbrs};
        end
    end
end
[info, cost] = evaluatePath(path, mapa)
plotPath(path, mapa, 'B&B Solution, Map 2, Budget = 6'); 

%% Part 3.3 (Algorithm Design: MEGA SUPER GREEDY!!)
clear all
close all
home

load('maps.mat');
[x,y,z] = generateVis(mapBig);
target = find(z==max(max(z)));
path = [1, 1];
mapa = actions10(mapBig, mapBig.sideSize);
start = index_from_st(mapa, path(1), path(1));
[mapa.cost, distance] = manhatt2(mapa, 100, start, target);
hurryup = distance;
budget = 30;
for i = 1:budget
    timeLeft = budget - i + 1;
    index = index_from_st(mapa, path(end,1), path(end,2));
    neighbors = mapa.actions{index};
    if timeLeft == hurryup
        for k = 1:hurryup
            point = hurryup + 1 - k;
            path = [path; path(point, 1), path(point, 2)];
        end
    break;
    end
    for j = 1:numel(neighbors)
        nextIndex = find(z==max(z(neighbors)));
        if distance == 0
            [X,Y] = state_from_in(mapa,nextIndex);
            path = [path; X, Y];
            break;
        elseif mapa.cost(nextIndex) >= distance
            neighbors(neighbors==nextIndex) = []; 
            clear nextIndex;
        else
            [X,Y] = state_from_in(mapa,nextIndex);
            path = [path; X, Y];
            distance = distance - 1;
            break;
        end
    end
end
[info, cost] = evaluatePath(path, mapa)
plotPath(path, mapa, 'Part 3.3: Mega Super Greedy Search'); 
