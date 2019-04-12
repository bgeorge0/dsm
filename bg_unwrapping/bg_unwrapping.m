% bg_unwrapping
UNWRAPPING_DATA = struct;

% Load some data 
% This will in theory be from CERR
UNWRAPPING_DATA.as_points.START_POIs = test_startPOI;
UNWRAPPING_DATA.as_points.FINISH_POIs = test_endPOI;
UNWRAPPING_DATA.as_points.point_cloudD = test_structXYZD;
UNWRAPPING_DATA.as_points.point_cloudD(:,4) = 1:9483; % REMOVE THIS LATER
UNWRAPPING_DATA.as_points.point_cloud = UNWRAPPING_DATA.as_points.point_cloudD(:,1:3);
UNWRAPPING_DATA.as_points.unwrap_centre = (max(UNWRAPPING_DATA.as_points.point_cloud) + min(UNWRAPPING_DATA.as_points.point_cloud))/2;

% Convert the point cloud to a 3D labelmap
UNWRAPPING_DATA = cloud_to_labelmap(UNWRAPPING_DATA);
% Convert the points of interet in similar sized labelmaps
UNWRAPPING_DATA = pois_to_labelmap(UNWRAPPING_DATA);

% Find the shortest path
UNWRAPPING_DATA = complex_3D_bg(UNWRAPPING_DATA);
% Convert to points
UNWRAPPING_DATA = shortest_as_points(UNWRAPPING_DATA);
% Get the full curve
[UNWRAPPING_DATA.as_points.full_path,~,~] = interparc(32,UNWRAPPING_DATA.as_points.shortest_path(:,1),UNWRAPPING_DATA.as_points.shortest_path(:,2),UNWRAPPING_DATA.as_points.shortest_path(:,3));
% Generate triangles on surface
%UNWRAPPING_DATA = surface_triangles(UNWRAPPING_DATA);

% There is where the magic happens!
UNWRAPPING_DATA = ray_trace(UNWRAPPING_DATA);

% Flatten
UNWRAPPING_DATA = flatten_dsm(UNWRAPPING_DATA);

% A nice new plot!
UNWRAPPING_DATA = better_plotting(flipud(UNWRAPPING_DATA));