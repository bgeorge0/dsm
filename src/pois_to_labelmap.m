function UNWRAPPING_DATA = pois_to_labelmap(UNWRAPPING_DATA)

% Conver the start pois
SpoiX = UNWRAPPING_DATA.as_points.START_POIs(:,1);
SpoiY = UNWRAPPING_DATA.as_points.START_POIs(:,2);
SpoiZ = UNWRAPPING_DATA.as_points.START_POIs(:,3);

SclosestIndexX = zeros(size(SpoiX));
SclosestIndexY = zeros(size(SpoiY));
SclosestIndexZ = zeros(size(SpoiZ));
for i = 1:size(UNWRAPPING_DATA.as_points.START_POIs,1)
    [~, SclosestIndexX(i)] = min(abs(bsxfun(@minus,SpoiX(i), UNWRAPPING_DATA.as_voxels.gridCOx')));
    [~, SclosestIndexY(i)] = min(abs(bsxfun(@minus,SpoiY(i), UNWRAPPING_DATA.as_voxels.gridCOy')));
    [~, SclosestIndexZ(i)] = min(abs(bsxfun(@minus,SpoiZ(i), UNWRAPPING_DATA.as_voxels.gridCOz')));
end
%[~,SclosestIndexX] = min(abs(bsxfun(@minus,SpoiX, UNWRAPPING_DATA.as_voxels.gridCOx')));
%[~,SclosestIndexY] = min(abs(bsxfun(@minus,SpoiY, UNWRAPPING_DATA.as_voxels.gridCOy')));
%[~,SclosestIndexZ] = min(abs(bsxfun(@minus,SpoiZ, UNWRAPPING_DATA.as_voxels.gridCOz')));

Slabelmap = zeros(size(UNWRAPPING_DATA.as_voxels.OUTPUTgrid));
Slabelmap(SclosestIndexX, SclosestIndexY, SclosestIndexZ) = 1;

UNWRAPPING_DATA.as_voxels.START = Slabelmap;

% Convert the finish pois
FpoiX = UNWRAPPING_DATA.as_points.FINISH_POIs(:,1);
FpoiY = UNWRAPPING_DATA.as_points.FINISH_POIs(:,2);
FpoiZ = UNWRAPPING_DATA.as_points.FINISH_POIs(:,3);

FclosestIndexX = zeros(size(FpoiX));
FclosestIndexY = zeros(size(FpoiY));
FclosestIndexZ = zeros(size(FpoiZ));
for i = 1:size(UNWRAPPING_DATA.as_points.FINISH_POIs,1)
    [~, FclosestIndexX(i)] = min(abs(bsxfun(@minus,FpoiX(i), UNWRAPPING_DATA.as_voxels.gridCOx')));
    [~, FclosestIndexY(i)] = min(abs(bsxfun(@minus,FpoiY(i), UNWRAPPING_DATA.as_voxels.gridCOy')));
    [~, FclosestIndexZ(i)] = min(abs(bsxfun(@minus,FpoiZ(i), UNWRAPPING_DATA.as_voxels.gridCOz')));
end
%[~,FclosestIndexX] = min(abs(bsxfun(@minus,FpoiX, UNWRAPPING_DATA.as_voxels.gridCOx')));
%[~,FclosestIndexY] = min(abs(bsxfun(@minus,FpoiY, UNWRAPPING_DATA.as_voxels.gridCOy')));
%[~,FclosestIndexZ] = min(abs(bsxfun(@minus,FpoiZ, UNWRAPPING_DATA.as_voxels.gridCOz')));

Flabelmap = zeros(size(UNWRAPPING_DATA.as_voxels.OUTPUTgrid));
Flabelmap(FclosestIndexX, FclosestIndexY, FclosestIndexZ) = 1;

UNWRAPPING_DATA.as_voxels.FINISH = Flabelmap;

end