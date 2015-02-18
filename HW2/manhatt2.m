function [h, distance] = manhatt2(map, nodes, start, target)

[targX, targY] = state_from_in(map,target);
h = zeros(10, 10);
for i = 1:nodes
    [X,Y] = state_from_in(map,i);
    h(i) = (abs(targX - X) + abs(targY - Y));
end

distance = h(start);
return
