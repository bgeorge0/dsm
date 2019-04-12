function UNWRAPPING_DATA = surface_triangles(UNWRAPPING_DATA)

xyzD = UNWRAPPING_DATA.as_points.point_cloudD;

xyzD(:,5) = 1:length(xyzD); % Because we have random 'D' in this example

% To get same naming as example
% https://uk.mathworks.com/matlabcentral/answers/165624-how-to-color-trisurf-faces
X = xyzD(:,1:3);
coeff = 1;
tri = triangulation(boundary(X, coeff), X);

UNWRAPPING_DATA.as_tri.coeff = coeff;
UNWRAPPING_DATA.as_tri.tri = tri;

end