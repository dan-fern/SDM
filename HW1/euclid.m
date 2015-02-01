function h = euclid(map, nodes, epsilon)

rows = sqrt(nodes);
cols = sqrt(nodes);
h = zeros(rows, cols);
for i = 1:nodes
    [X,Y] = state_from_index(map,i);
    h(i) = sqrt((cols - X) .^ 2 + (rows - Y) .^ 2) * epsilon;
end

return