function UNWRAPPING_DATA = bg_unwrapping(UNWRAPPING_DATA)

% Check that python is working and numpy is avaliable
tic
disp('Checking for python + numpy')
try
    py.numpy.array(0);
catch
    fprintf('Something wrong with python + numpy installation\n')
    return
end
toc

% bg_unwrapping
% Make sure we've got the files loaded
addpath(genpath(pwd));

if ~exist('UNWRAPPING_DATA','var') || isempty(UNWRAPPING_DATA)
    % Load some data
    data_select = 'data1';
    UNWRAPPING_DATA = struct;
    UNWRAPPING_DATA.as_points.START_POIs = test_startPOI(data_select);
    UNWRAPPING_DATA.as_points.FINISH_POIs = test_endPOI(data_select);
    UNWRAPPING_DATA.as_points.point_cloudD = test_structXYZD(data_select);
    UNWRAPPING_DATA.as_points.point_cloud = UNWRAPPING_DATA.as_points.point_cloudD(:,1:3);
    UNWRAPPING_DATA.as_points.unwrap_centre = (max(UNWRAPPING_DATA.as_points.point_cloud) + min(UNWRAPPING_DATA.as_points.point_cloud))/2;
  
    % Set some options
    UNWRAPPING_DATA.options.SLICES      = 30;
    UNWRAPPING_DATA.options.RAYS        = 30;
    UNWRAPPING_DATA.voxelise_size_x     = 100;
    UNWRAPPING_DATA.voxelise_size_y     = 100;
    UNWRAPPING_DATA.voxelise_size_z     = 100;
else
    % Assume that UNWRAPPING_DATA is initialised
end

% Do some data conversion to a voxelised labelmap
% This is necessary for the shortest path algorithm
tic
disp('Data conversion')
UNWRAPPING_DATA = cloud_to_labelmap(UNWRAPPING_DATA);
UNWRAPPING_DATA = pois_to_labelmap(UNWRAPPING_DATA);
toc

% Find the shortest path
% Uses 'curve extraction' module
tic
disp('Finding shortest path')
UNWRAPPING_DATA = complex_3D_bg(UNWRAPPING_DATA);
% Convert the voxel indices to points in 3D space
UNWRAPPING_DATA = shortest_as_points(UNWRAPPING_DATA);
toc

% The the correct sized curve
% NB: Always need an extra point at hte start and the end
%     Might think about ignoring the first and last 'n' points to avoid
%     issues at the edge
[UNWRAPPING_DATA.as_points.full_path,~,~] = interparc(UNWRAPPING_DATA.options.SLICES+2,UNWRAPPING_DATA.as_points.shortest_path(:,1),UNWRAPPING_DATA.as_points.shortest_path(:,2),UNWRAPPING_DATA.as_points.shortest_path(:,3));

% There is where the magic happens!
% Do the ray_tracing algorithm to find the intersection from each central
% point to the surface
% This also deals with finding the rays from each point
tic
disp('Ray tracing')
UNWRAPPING_DATA = ray_trace(UNWRAPPING_DATA);
toc

% Find the dose at each surface point and form into flattened DSM
disp('Create DSM')
tic
UNWRAPPING_DATA = create_dsm(UNWRAPPING_DATA);
toc

% A nice new plot!
disp('Plotting')
figure
UNWRAPPING_DATA = better_plotting(flipud(UNWRAPPING_DATA));
end