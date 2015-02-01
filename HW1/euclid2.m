function length = euclid2(map, loc1, loc2)

[x1,y1] = state_from_index(map, loc1);
[x2,y2] = state_from_index(map, loc2);
length = sqrt((x1 - x2) .^ 2 + (y1 - y2) .^ 2);

return