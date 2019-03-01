function [dosemap] = FullUnwrap(xyzD, poi1, poi2, xyz_stom, grid_res)

do_plot = true;
if do_plot
    figure;
    hold on;
    xlabel('X')
    ylabel('Y')
    zlabel('Z')
end

disp('Fixing points to uniform grid')
% Round all points to 4 decimal places
xyzD = round(xyzD,4);
poi1 = round(poi1,4);
poi2 = round(poi2,4);
xyz_stom = round(xyz_stom,4);
grid_res = round(grid_res,4);
% Fix PTS if not on uniform grid (which seems to happen at random)
%xyzD(:,1) = max(xyzD(:,1)) + (floor((xyzD(:,1) - max(xyzD(:,1)))/grid_res(1))*grid_res(1));
%xyzD(:,2) = max(xyzD(:,2)) + (floor((xyzD(:,2) - max(xyzD(:,2)))/grid_res(2))*grid_res(2));
%xyzD(:,3) = max(xyzD(:,3)) + (floor((xyzD(:,3) - max(xyzD(:,3)))/grid_res(3))*grid_res(3));
if do_plot
    mx = max(xyzD(:,4));
    inds = xyzD(:,4) > (0.9*mx);
    plot3(xyzD(inds,1),xyzD(inds,2),xyzD(inds,3), 'r.')
    plot3(poi1(1),poi1(2),poi1(3),'b.');
    plot3(poi2(1),poi2(2),poi2(3),'b.');
end
disp(' -> DONE'); drawnow; %pause

disp('Forcing start and end to be inside the structure')
% knnsearch to make sure poi1 and poi2 are actually points in xyzD
poi1IDX = knnsearch(xyzD(:,1:3),poi1);
poi1 = xyzD(poi1IDX,1:3);
poi2IDX = knnsearch(xyzD(:,1:3),poi2);
poi2 = xyzD(poi2IDX,1:3);
if do_plot
    plot3(poi1(1),poi1(2),poi1(3),'bx');
    plot3(poi2(1),poi2(2),poi2(3),'bx');
end
disp(' -> DONE'); drawnow; %pause

disp('Creating surface mesh')
%Create surface mesh using alphashape
structXYZ = [xyzD(:,1),xyzD(:,2),xyzD(:,3)];
[~,S]=alphavol(structXYZ, max(grid_res), 0); % Removed plot flag
Snew.faces = S.faces;
Snew.vertices = S.X;
disp(' -> DONE'); drawnow; %pause

disp('Fitting the curve')
%hobbyspline = complex_3D(structXYZ, poi1, poi2){1}.shortest_path_pts;
c = complex_3D_onefunction(structXYZ, poi1, poi2);
hobbyspline = c{1}.shortest_path_pts;
if do_plot
    plot3(hobbyspline(:,1),hobbyspline(:,2),hobbyspline(:,3),'b-');
    for i = 1:size(hobbyspline,1)-1
        camva(120)
        campos(hobbyspline(i,1:3));
        camtarget(hobbyspline(i+1,1:3));
        drawnow;
        pause(.1);
    end
end
disp(' -> DONE'); drawnow;% pause

disp('Finding structure intersections')
[perim, perim_point, overlap_matrix12] = PlaneThroughSlice_UniformCircle(structXYZ, hobbyspline, Snew, xyzD, grid_res);
disp(' -> DONE'); drawnow; %pause

disp('Unwrapping')
if prod(cellfun('isempty', overlap_matrix12)) == 1
    display('Warning - some overlap may have occured');
end    
[dosemap, ~, ~] = Unwrapping(xyzD, Snew, perim, perim_point);
disp(' -> DONE'); drawnow; %pause

disp('Fixing orientation')
%Fix DSM orientation%
%Calculate distance from end of spline to nearest point on stomach contour
[~,d_first] = knnsearch(xyz_stom,hobbyspline(1,:));
[~,d_last] = knnsearch(xyz_stom,hobbyspline(end,:));
if d_first > d_last
    dosemap = flipud(dosemap);
end
disp(' -> DONE'); drawnow; %pause