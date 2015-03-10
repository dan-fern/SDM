function pos = moveQMDP(maze, pos, belief) % not functional

V = dot(belief(:), maze.V); 
[~, moves] = getNeighbors(maze, pos);
desiredMove = find(V == max(V(moves(:))));
desiredDirection = getMoveDirection(maze, pos, desiredMove);
actualMove = move_maze(maze, pos, desiredDirection, noise);
pos = actualMove;

end