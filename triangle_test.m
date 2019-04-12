%P = randn([10 3]);
P = gallery('uniformdata',[25,3],1);
dt = delaunayTriangulation(P);
cv = dt.convexHull;

o = [0 0 0];
d = [1 1 1];

figure
hold on
trisurf(C,dt.Points(:,1),dt.Points(:,2),dt.Points(:,3));
plot3([o(1) d(1)], [o(2) d(2)], [o(3) d(3)], 'rx-');

for i = 1:size(cv,1)
    p = dt.Points(cv(i,:),:);
    p0 = p(1,:);
    p1 = p(2,:);
    p2 = p(3,:);
    [flag, u, v, t] = rayTriangleIntersection (o, d, p0, p1, p2);
    if flag & (t > 0)
        u;
        v;
        t;
        x = o(1) + t*d(1);
        y = o(2) + t*d(2);
        z = o(3) + t*d(3);
        plot3(x,y,z,'ro');
    end
end