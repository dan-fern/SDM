function pos = moveMostLikely(maze, pos, belief)

noise = 0;
[~, targetV] = max(belief(:));
tempV = maze.V(:,:,targetV);
[~, moves] = getNeighbors(maze, pos);
desiredMove = find(tempV == max(tempV(moves(:))));
desiredDirection = getMoveDirection(maze, pos, desiredMove);
actualMove = move_maze(maze, pos, desiredDirection, noise);
pos = actualMove;

end