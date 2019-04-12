% From xyzD point cloud to 3D volume
function UNWRAPPING_DATA = cloud_to_labelmap(UNWRAPPING_DATA)

% This is what we're going to work with
point_cloud = UNWRAPPING_DATA.as_points.point_cloud;

% Some values that we can change in this function
gridX = UNWRAPPING_DATA.voxelise_size_x; % Don't make this too big - will impact the curve fitting
gridY = UNWRAPPING_DATA.voxelise_size_y;
gridZ = UNWRAPPING_DATA.voxelise_size_z;
coeff = 1; % Should be 1.0

% To get same naming as example
% https://uk.mathworks.com/matlabcentral/answers/165624-how-to-color-trisurf-faces
X = point_cloud;
tri = triangulation(boundary(X, coeff), X);

% Get coords in correct format for VOXELISE function
meshX = zeros(3, size(tri.ConnectivityList,1));
meshY = zeros(3, size(tri.ConnectivityList,1));
meshZ = zeros(3, size(tri.ConnectivityList,1));
for i = 1:size(tri.ConnectivityList,1)
    meshX(:,i) = tri.Points(tri.ConnectivityList(i,:),1);
    meshY(:,i) = tri.Points(tri.ConnectivityList(i,:),2);
    meshZ(:,i) = tri.Points(tri.ConnectivityList(i,:),3);
end

% Create voxelisation from mesh data
% https://uk.mathworks.com/matlabcentral/fileexchange/27390-mesh-voxelisation
[OUTPUTgrid,gridCOx,gridCOy,gridCOz] = VOXELISE(gridX,gridY,gridZ,meshX,meshY,meshZ,'xyz');

% Save lots of information we might want to use later
UNWRAPPING_DATA.as_voxels.OUTPUTgrid = OUTPUTgrid;
UNWRAPPING_DATA.as_voxels.gridCOx = gridCOx;
UNWRAPPING_DATA.as_voxels.gridCOy = gridCOy;
UNWRAPPING_DATA.as_voxels.gridCOz = gridCOz;
UNWRAPPING_DATA.as_voxels.gridX = gridX;
UNWRAPPING_DATA.as_voxels.gridY = gridY;
UNWRAPPING_DATA.as_voxels.gridZ = gridZ;
UNWRAPPING_DATA.as_tri.meshX = meshX;
UNWRAPPING_DATA.as_tri.meshY = meshY;
UNWRAPPING_DATA.as_tri.meshZ = meshZ;
UNWRAPPING_DATA.as_tri.coeff = coeff;
UNWRAPPING_DATA.as_tri.tri = tri;

end
% Can do some plotting here if we're interested
% figure;
% subplot(1,3,1);
% imagesc(squeeze(sum(OUTPUTgrid,1)));
% colormap(gray(256));
% xlabel('Z-direction');
% ylabel('Y-direction');
% axis equal tight
%
% subplot(1,3,2);
% imagesc(squeeze(sum(OUTPUTgrid,2)));
% colormap(gray(256));
% xlabel('Z-direction');
% ylabel('X-direction');
% axis equal tight
%
% subplot(1,3,3);
% imagesc(squeeze(sum(OUTPUTgrid,3)));
% colormap(gray(256));
% xlabel('Y-direction');
% ylabel('X-direction');
% axis equal tight