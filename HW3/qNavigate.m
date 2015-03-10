function maze = qNavigate(maze, nodes, time, noise, discount, target)
maze.reward(maze.reward == 1) = 0;
maze.reward(target) = 1;

maze.V = zeros(maze.R, maze.C);

for i = 1: time
    for j = 1:nodes
        [neighbors, moves] = getNeighbors(maze, j);
        for k = 1:4
            move = is_move_valid(maze, j, k);
            if move == -1
                actVal(k) = -inf;
            else
                tempVal = 0;
                for n = 1:neighbors
                    if moves(n) == move
                        prob = (1-noise) + noise / 4;
                    else
                        prob = noise / 4;
                    end
                    tempVal = discount * maze.V(moves(n)) * prob + tempVal;
                end
                actVal(k) = tempVal + maze.reward(j);
            end
        end
        maze.V(j) = max(actVal);
    end
end

end