function UNWRAPPING_DATA = shortest_as_points(UNWRAPPING_DATA)

xx = UNWRAPPING_DATA.as_voxels.gridCOx(UNWRAPPING_DATA.as_voxels.SHORTEST_PATH(:,1));
yy = UNWRAPPING_DATA.as_voxels.gridCOy(UNWRAPPING_DATA.as_voxels.SHORTEST_PATH(:,2));
zz = UNWRAPPING_DATA.as_voxels.gridCOz(UNWRAPPING_DATA.as_voxels.SHORTEST_PATH(:,3));

UNWRAPPING_DATA.as_points.shortest_path = [xx' yy' zz'];

end