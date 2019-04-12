% Better drawing
function UNWRAPPING_DATA = better_plotting(UNWRAPPING_DATA)

xyzD = UNWRAPPING_DATA.as_points.point_cloudD;
xyzD(:,5) = 1:size(xyzD(:,1));      % As we don't have real data
tri = UNWRAPPING_DATA.as_tri.tri;

subplot(2,2,[1 3]);
hh = trisurf(tri);
hold on;
axis off

C_Tri = zeros(size(tri.ConnectivityList,1), 1);
for i = 1:length(tri.ConnectivityList)
    C_Tri(i) = mean(xyzD(tri.ConnectivityList(i,:)',5));
end

set(gca,'CLim',[min(C_Tri), max(C_Tri)]);
set(hh,'FaceColor','flat',...
    'FaceVertexCData',C_Tri,...
    'CDataMapping','scaled',...
    'LineStyle','none');
axis vis3d
alpha 0.25

plot3(UNWRAPPING_DATA.as_points.shortest_path(:,1),UNWRAPPING_DATA.as_points.shortest_path(:,2),UNWRAPPING_DATA.as_points.shortest_path(:,3),'m-')
plot3(UNWRAPPING_DATA.as_points.unwrap_centre(1),UNWRAPPING_DATA.as_points.unwrap_centre(2),UNWRAPPING_DATA.as_points.unwrap_centre(3),'mx')

sp = UNWRAPPING_DATA.as_points.surface_points;
for i = 1:size(sp,1)
    plot3(sp(i,:,1), sp(i,:,2), sp(i,:,3), 'r-')
end

subplot(2,2,4);
imagesc(flipud(UNWRAPPING_DATA.dsm));
axis image
axis off

end