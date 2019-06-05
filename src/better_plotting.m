% Better drawing
function UNWRAPPING_DATA = better_plotting(UNWRAPPING_DATA)

xyzD = UNWRAPPING_DATA.as_points.point_cloudD;
tri = UNWRAPPING_DATA.as_tri.tri;

subplot(1,2,1);
hh = trisurf(tri);
hold on;
axis off

C_Tri = zeros(size(tri.ConnectivityList,1), 1);
for i = 1:length(tri.ConnectivityList)
    C_Tri(i) = mean(xyzD(tri.ConnectivityList(i,:)',4));
end

set(gca,'CLim',[min(C_Tri), max(C_Tri)]);
%set(gca,'CLim',[0, max(C_Tri)]);
set(hh,'FaceColor','flat',...
    'FaceVertexCData',C_Tri,...
    'CDataMapping','scaled',...
    'LineStyle','none');
colormap jet
axis vis3d
alpha 0.25

plot3(UNWRAPPING_DATA.as_points.full_path(:,1),UNWRAPPING_DATA.as_points.full_path(:,2),UNWRAPPING_DATA.as_points.full_path(:,3),'g-')
plot3(UNWRAPPING_DATA.as_points.unwrap_centre(1),UNWRAPPING_DATA.as_points.unwrap_centre(2),UNWRAPPING_DATA.as_points.unwrap_centre(3),'gx')

for slice_index = 1:size(UNWRAPPING_DATA.as_points.surface_points,1)
    cax = UNWRAPPING_DATA.as_points.full_path(1+slice_index,:);
    sp = UNWRAPPING_DATA.as_points.surface_points;%(slice_index,:,:);
    sp_index = floor(size(sp,2)/2);
    plot3([cax(1), sp(slice_index, sp_index, 1)], [cax(2), sp(slice_index, sp_index, 2)], [cax(3), sp(slice_index, sp_index, 3)], 'g-');
    plot3([sp(slice_index,:,1) sp(slice_index,1,1)], [sp(slice_index,:,2) sp(slice_index,1,2)], [sp(slice_index,:,3) sp(slice_index,1,3)], 'b-')
end

subplot(1,2,2);
imagesc(flipud(UNWRAPPING_DATA.dsm));
axis image
axis off

end