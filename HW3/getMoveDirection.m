function direction = getMoveDirection(maze, pos, move)

[x1, y1] = maze_XY_from_index(maze, pos);
[x2, y2] = maze_XY_from_index(maze, move);

if x1 - x2 == 1
    direction = 4;
elseif x1 - x2 == -1
    direction = 2;
elseif y1 - y2 == -1
    direction = 3;
else
    direction = 1;
end

end