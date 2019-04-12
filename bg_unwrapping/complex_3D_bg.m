% Simple 3D example
% Showing the effect of the different types of regularization
% Note the following:
% 1. Strong length regularization gives shortest possible curve.
% 2. Strong curvature regularization gives a straight curve.
% 3. Strong torsion regularization gives a curve contained in a plane.

function UNWRAPPING_DATA = complex_3D_bg(UNWRAPPING_DATA)

ROImap = inf(size(UNWRAPPING_DATA.as_voxels.OUTPUTgrid)); % Set ot inf everywhere
STARTmap = UNWRAPPING_DATA.as_voxels.START;
FINISHmap = UNWRAPPING_DATA.as_voxels.FINISH;
length_penalty = 1;
curvature_penalty = 10;
torsion_penalty = 0;

ROImap(UNWRAPPING_DATA.as_voxels.OUTPUTgrid(:)) = 1; % Lower weight in regions where we can go

% Set disallowed
% Currently not used (i.e. disallowed = false for all pts)
disallowed = false(size(ROImap));

% FIT CURVE HERE
% Fit_Curve(data, start_set, end_set, disallowed, length, curveature, torsion)
c = Fit_Curve(double(ROImap), logical(STARTmap), logical(FINISHmap), disallowed, length_penalty, curvature_penalty, torsion_penalty);

UNWRAPPING_DATA.shortest_path.disallowed = disallowed;
UNWRAPPING_DATA.shortest_path.c = c;
UNWRAPPING_DATA.shortest_path.length_penalty = length_penalty;
UNWRAPPING_DATA.shortest_path.curvature_penalty = curvature_penalty;
UNWRAPPING_DATA.shortest_path.torsion_penalty = torsion_penalty;

UNWRAPPING_DATA.as_voxels.SHORTEST_PATH = UNWRAPPING_DATA.shortest_path.c{1}.shortest_path;

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

