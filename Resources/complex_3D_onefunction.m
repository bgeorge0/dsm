% Simple 3D example
% Showing the effect of the different types of regularization
% Note the following:
% 1. Strong length regularization gives shortest possible curve.
% 2. Strong curvature regularization gives a straight curve.
% 3. Strong torsion regularization gives a curve contained in a plane.

function c = complex_3D_onefunction(diff_pts, poi1, poi2)
%addpath(genpath('curve_extraction'))

xyz = diff_pts;

% Sort out data
dx = min(diff(unique(sort(diff_pts(:,1)))));
dy = min(diff(unique(sort(diff_pts(:,2)))));
dz = min(diff(unique(sort(diff_pts(:,3)))));
dxyz = [dx dy dz];%*.2;

min_x = min(diff_pts(:,1));
min_y = min(diff_pts(:,2));
min_z = min(diff_pts(:,3));
min_xyz = [min_x min_y min_z];

% Convert to indicies;
[new_x, new_y, new_z] = pt2ind(xyz(:,1),xyz(:,2),xyz(:,3), dxyz, min_xyz);
xyzi = [new_x, new_y, new_z];

% Set voxel weights;
data = inf(max(floor(xyzi)));
data(sub2ind(size(data), floor(xyzi(:,1)), floor(xyzi(:,2)), floor(xyzi(:,3)) )) = 1;

% Start set
% True at voxels where it allowed to start
start_set = false(size(data));
[xi,yi,zi] = pt2ind(poi1(1),poi1(2),poi1(3), dxyz, min_xyz);
start_set(floor(xi),floor(yi),floor(zi)) = true;

% End set
% True at voxels where it allowed to end
end_set = false(size(data));
[xi,yi,zi] = pt2ind(poi2(1),poi2(2),poi2(3), dxyz, min_xyz);
end_set(floor(xi),floor(yi),floor(zi)) = true;

% Set disallowed
% Currently not used (i.e. disallowed = false for all pts)
disallowed = false(size(data));

% FIT CURVE HERE
% Fit_Curve(data, start_set, end_set, disallowed, length, curveature, torsion)
c = Fit_Curve(data, start_set, end_set, disallowed, 1, 10, 0);
[xs,ys,zs] = ind2pt(c{1}.shortest_path(:,1), c{1}.shortest_path(:,2), c{1}.shortest_path(:,3), dxyz, min_xyz);
c{1}.shortest_path_pts = [xs,ys,zs];
c{1}.xyz = xyz;
c{1}.xyzi = xyzi;
end

%% Convert (x,y,z) to voxel indicies
function [xi,yi,zi] = pt2ind(x,y,z, dxyz, min_xyz)
xi = round((1+(x-min_xyz(1))/dxyz(1)));
yi = round((1+(y-min_xyz(2))/dxyz(2)));
zi = round((1+(z-min_xyz(3))/dxyz(3)));
end

%% Convert voxel indicies to point cloud coordinates
function [x,y,z] = ind2pt(xi,yi,zi, dxyz, min_xyz)
x = min_xyz(1) + dxyz(1)*(xi-1);
y = min_xyz(2) + dxyz(2)*(yi-1);
z = min_xyz(3) + dxyz(3)*(zi-1);
end

%% Create curve object and fit
function c = Fit_Curve(data, start_set, end_set, disallowed, length_penalty, curvature_penalty, torsion_penalty)

c = {};

C = Curve_extraction(data, start_set, end_set, disallowed);
C.set_connectivity_by_radius(5);

C.store_visit_time = true;
strength = 1e2;

C.length_penalty = length_penalty.*strength;
C.curvature_penalty = curvature_penalty.*strength;
C.torsion_penalty = torsion_penalty.*strength;

c{1}.C = C;
c{1}.shortest_path = C.shortest_path();

end

