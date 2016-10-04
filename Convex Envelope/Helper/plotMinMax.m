function plotMinMax(x1grid,x2grid,U)

hold on
minU = min(U(:))
[minX2,minX1] = find(U == minU);
h = scatter3(x1grid(minX1),x2grid(minX2),ones(length(minX1),1)*minU,'filled');
h.SizeData = 500;

x1minpt = x1grid(minX1)
x2minpt = x2grid(minX2)

maxU = max(U(:));
[maxX2,maxX1] = find(U == maxU);
h = scatter3(x1grid(maxX1),x2grid(maxX2),ones(length(maxX1),1)*maxU,'filled');
h.SizeData = 500;

x1maxpt = x1grid(maxX1)
x2maxpt = x2grid(maxX2)

hold off