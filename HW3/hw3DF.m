%% MDP
clear all
close all
%home

maze = load_maze('maze0.txt');
noise = 0.2;
discount = 0.9;
nodes = maze.R * maze.C;
time = 100;
robPos = 1;
target = find(maze.reward == max(maze.reward(:)));

maze = qNavigate(maze, nodes, time, noise, discount, target);
reward = 0;
for i = 1:time
    draw_maze(maze, robPos, maze.V);
    tit1 = ['MDP qNavigate() at time = ', num2str(i)];
    tit2 = [', noise = ', num2str(noise)];
    tits = [tit1, tit2];
    title(gca, tits);
    [neighbors, moves] = getNeighbors(maze, robPos);
    desiredMove = find(maze.V == max(maze.V(moves(:))));
    desiredDirection = getMoveDirection(maze, robPos, desiredMove);
    actualMove = move_maze(maze, robPos, desiredDirection, noise);
    robPos = actualMove;
    reward = reward + maze.reward(robPos);
end

%%
clear all
close all
%home

maze = load_maze('maze1.txt');
nodes = maze.R * maze.C;
values = zeros(maze.R, maze.C, nodes);
time = 100;
noise = 0.3;
discount = 0.9;
robPos = 1;

for i = 1:nodes
    maze = qNavigate(maze, nodes, time, noise, discount, i);
    values(:,:,i) = maze.V;
end
maze.V = values; clear values;
belief = 1 / (maze.R * maze.C) * ones(maze.R, maze.C);
reward = 0;

for i = 1:time
    draw_maze(maze, robPos, maze.V(:,:,belief==max(belief(:))));
    robPos = moveMostLikely(maze, robPos, belief);
    maze = moveTarget(maze);
    QPos = find(maze.reward == max(maze.reward(:)));
    if robPos == QPos
        belief(:) = 0;
        belief(robPos) = 1;
    else
        tempBelief = zeros(maze.R, maze.C);
        for j = 1:nodes
            tempProb = 0;
            for k = 1:4
                move = is_move_valid(maze, j, k);
                if move == -1
                    tempProb = 0.25 * belief(j) + tempProb;
                else
                    tempProb = 0.25 * belief(move) + tempProb;
                end
            end
            tempBelief(j) = tempProb;
        end
        belief = tempBelief;
        belief(robPos) = 0;
        belief = belief / norm(belief);
    end
    reward = reward + maze.reward(robPos);
end

%%
clear all
close all
%home

maze = load_maze('maze1.txt');
nodes = maze.R * maze.C;
values = zeros(maze.R, maze.C, nodes);
time = 200;
noise = 0.1;
discount = 0.9;
robPos = 1;

for i = 1:nodes
    maze = qNavigate(maze, nodes, time, noise, discount, i);
    values(:,:,i) = maze.V;
end
maze.V = values; clear values;
belief = 1 / (maze.R * maze.C) * ones(maze.R, maze.C);

for i = 1:time
    draw_maze(maze, robPos, maze.V(:,:,belief==max(belief(:))));
    robPos = moveQMDP(maze, robPos, belief);
    maze = moveTarget(maze);
    QPos = find(maze.reward == max(maze.reward(:)));
    if robPos == QPos
        belief(:) = 0;
        belief(robPos) = 1;
    else
        tempBelief = zeros(maze.R,maze.C);
        for j = 1:nodes
            tempProb = 0;
            for k = 1:4
                move = is_move_valid(maze, j, k);
                if move == -1
                    tempProb = 0.25 * belief(j) + tempProb;
                else
                    tempProb = 0.25 * belief(move) + tempProb;
                end
            end
            tempBelief(j) = tempProb;
        end
        belief = tempBelief;
        belief(robPos) = 0;
        belief = belief / norm(belief);
    end
end
