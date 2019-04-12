function UNWRAPPING_DATA = ray_trace(UNWRAPPING_DATA)

% This is the complex one...
meshX_np = to_np(UNWRAPPING_DATA.as_tri.meshX);
meshY_np = to_np(UNWRAPPING_DATA.as_tri.meshY);
meshZ_np = to_np(UNWRAPPING_DATA.as_tri.meshZ);
full_path_np = to_np(UNWRAPPING_DATA.as_points.full_path);
unwrap_centre_np = to_np(UNWRAPPING_DATA.as_points.unwrap_centre);

% Load python module
mod = py.importlib.import_module('ray_tracing');
py.importlib.reload(mod);

% Call the 'main' method with all the data
UNWRAPPING_DATA.as_points.surface_points_np = mod.main(meshX_np, meshY_np, meshZ_np, full_path_np, unwrap_centre_np, to_np(UNWRAPPING_DATA.options.RAYS));
UNWRAPPING_DATA.as_points.surface_points = from_np(UNWRAPPING_DATA.as_points.surface_points_np);

end