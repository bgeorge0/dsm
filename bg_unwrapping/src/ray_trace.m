function UNWRAPPING_DATA = ray_trace(UNWRAPPING_DATA)

% This is the complex one...
meshX_np = to_np(UNWRAPPING_DATA.as_tri.meshX);
meshY_np = to_np(UNWRAPPING_DATA.as_tri.meshY);
meshZ_np = to_np(UNWRAPPING_DATA.as_tri.meshZ);
full_path_np = to_np(UNWRAPPING_DATA.as_points.full_path);
unwrap_centre_np = to_np(UNWRAPPING_DATA.as_points.unwrap_centre);

% Load python module
mod = import_python_module();
py.importlib.reload(mod);

% Call the 'main' method with all the data
UNWRAPPING_DATA.as_points.surface_points_np = mod.main(meshX_np, meshY_np, meshZ_np, full_path_np, unwrap_centre_np, to_np(UNWRAPPING_DATA.options.RAYS));
UNWRAPPING_DATA.as_points.surface_points = from_np(UNWRAPPING_DATA.as_points.surface_points_np);

end

function mod = import_python_module()

% Import python module
if count(py.sys.path,'') == 0
    insert(py.sys.path,int32(0),'');
end
FunPath = strsplit(mfilename('fullpath'),filesep);
ModPath = strjoin(FunPath(1:end-1),filesep);

P = py.sys.path;
if count(P, ModPath) == 0
    insert(P, int32(0), ModPath);
end
mod = py.importlib.import_module('ray_tracing');
            py.importlib.reload(mod);
end