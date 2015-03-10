function [neighbors, moves] = getNeighbors(maze, index)

allmoves = zeros(4,1);

for k = 1:4
    allmoves(k) = is_move_valid(maze, index, k);
end

allmoves((allmoves == -1)) = [];
neighbors = numel(allmoves);
moves = allmoves;

end