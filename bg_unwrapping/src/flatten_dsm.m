function UNWRAPPING_DATA = flatten_dsm(UNWRAPPING_DATA)

dsm = NaN(size(UNWRAPPING_DATA.as_points.surface_points(:,:,1)));

X = UNWRAPPING_DATA.as_points.point_cloud;

for i = 1:size(UNWRAPPING_DATA.as_points.surface_points,1)
    for j = 1:size(UNWRAPPING_DATA.as_points.surface_points,2)
        Y = squeeze(UNWRAPPING_DATA.as_points.surface_points(i,j,:))';
        idx = knnsearch(X,Y);
        dsm(i,j) = UNWRAPPING_DATA.as_points.point_cloudD(idx,4);
    end
end

UNWRAPPING_DATA.dsm = dsm;

end