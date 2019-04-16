import numpy as np
import math
import pprint as pp

# source: http://geomalgorithms.com/a06-_intersect-2.html

def ray_intersect_triangle(p0, p1, triangle):
    # Tests if a ray starting at point p0, in the direction
    # p1 - p0, will intersect with the triangle.
    #
    # arguments:
    # p0, p1: numpy.ndarray, both with shape (3,) for x, y, z.
    # triangle: numpy.ndarray, shaped (3,3), with each row
    #     representing a vertex and three columns for x, y, z.
    #
    # returns: 
    #    0.0 if ray does not intersect triangle, 
    #    1.0 if it will intersect the triangle,
    #    2.0 if starting point lies in the triangle
    v0, v1, v2 = triangle
    u = v1 - v0
    v = v2 - v0
    normal = np.cross(u, v)

    b = np.inner(normal, p1 - p0)
    a = np.inner(normal, v0 - p0)
    
    # Here is the main difference with the code in the link.
    # Instead of returning if the ray is in the plane of the 
    # triangle, we set rI, the parameter at which the ray 
    # intersects the plane of the triangle, to zero so that 
    # we can later check if the starting point of the ray
    # lies on the triangle. This is important for checking 
    # if a point is inside a polygon or not.
    
    if (b == 0.0):
        # ray is parallel to the plane
        if a != 0.0:
            # ray is outside but parallel to the plane
            return 0
        else:
            # ray is parallel and lies in the plane
            rI = 0.0
    else:
        rI = a / b

    if rI < 0.0:
        return 0

    w = p0 + rI * (p1 - p0) - v0

    denom = np.inner(u, v) * np.inner(u, v) - \
        np.inner(u, u) * np.inner(v, v)

    si = (np.inner(u, v) * np.inner(w, v) - \
        np.inner(v, v) * np.inner(w, u)) / denom
    
    if (si < 0.0) | (si > 1.0):
        return 0

    ti = (np.inner(u, v) * np.inner(w, u) - \
        np.inner(u, u) * np.inner(w, v)) / denom
    
    if (ti < 0.0) | (si + ti > 1.0):
        return 0

    if (rI == 0.0):
        # point 0 lies ON the triangle. If checking for 
        # point inside polygon, return 2 so that the loop 
        # over triangles can stop, because it is on the 
        # polygon, thus inside.
        return 2

    return 1

def LinePlaneCollision(p0, p1, triangle, epsilon=1e-6):
	rayPoint = p0
	rayDirection = p1 - rayPoint
	planePoint = triangle[0]
	planeNormal = np.cross(triangle[1]-triangle[0], triangle[2]-triangle[0])
	ndotu = planeNormal.dot(rayDirection)
	if abs(ndotu) < epsilon:
		raise RuntimeError("no intersection or line is within plane")
	
	w = rayPoint - planePoint
	si = -planeNormal.dot(w) / ndotu
	Psi = w + si * rayDirection + planePoint
	return Psi

# Create n equally spaced rays around the CAX point p0
# where p1 is the next point on the CAX
# and pu is the unwrapping centre
def rays_from_cax(p0, p1, pu, n):
	# Find the normal of the triangle p0, p1, pu
	planeNormal = np.cross(p1-p0, pu-p0)
	# Rotate this normal by 90 degrees around p0->p1 to point in the same plane as the triangle
	# p0 to p1 is along the CAX
	axis = p1 - p0
	first_ray = np.dot(rotation_matrix(axis, -1*math.pi/2), planeNormal)
	
	# Degrees between rays
	theta = (2*math.pi) / n
		
	rays = [p0 + np.dot(rotation_matrix(axis, theta*i), first_ray) for i in range(0,int(n))]

	return rays



def rotation_matrix(axis, theta):
    """
    Return the rotation matrix associated with counterclockwise rotation about
    the given axis by theta radians.
    """
    axis = np.asarray(axis)
    axis = axis / math.sqrt(np.dot(axis, axis))
    a = math.cos(theta / 2.0)
    b, c, d = -axis * math.sin(theta / 2.0)
    aa, bb, cc, dd = a * a, b * b, c * c, d * d
    bc, ad, ac, ab, bd, cd = b * c, a * d, a * c, a * b, b * d, c * d
    return np.array([[aa + bb - cc - dd, 2 * (bc + ad), 2 * (bd - ac)],
                     [2 * (bc - ad), aa + cc - bb - dd, 2 * (cd + ab)],
                     [2 * (bd + ac), 2 * (cd - ab), aa + dd - bb - cc]])

def main(meshX, meshY, meshZ, full_path, unwrap_centre,rays_to_cast):
	return_array = np.zeros((full_path.shape[0]-2,int(rays_to_cast),3),dtype=np.double)
	
	# Call it all in here!
	def triangles_in_surf():
		for tri_ind in range(0,meshX.shape[1]):
			xs = meshX[:,tri_ind]
			ys = meshY[:,tri_ind]
			zs = meshZ[:,tri_ind]
			tri = np.array([xs, ys, zs]).T
			yield tri
	
	for j, cax_index in (enumerate(range(1, full_path.shape[0]-1))):
		pb = full_path[cax_index-1,:]	# Previous point in path
		p0 = full_path[cax_index,:]	# This point in the path
		pa = full_path[cax_index+1,:]	# Next point in the path
		p_ray = p0 + (pa - pb)		# Want to unwrap perpendicular to orientaton pb -> pa
		for i, ray in enumerate(rays_from_cax(p0, p_ray, unwrap_centre, rays_to_cast)):
			candidate = None
			for tri in triangles_in_surf():
				if ray_intersect_triangle(p0, ray, tri):
					this_intersection = LinePlaneCollision(p0, ray, tri)
					if candidate is None:
						candidate = this_intersection
					elif np.linalg.norm(p0 - this_intersection) < np.linalg.norm(p0 - candidate):
						candidate = this_intersection
			return_array[j,i] = candidate
	# Switch the sides around so that column 1 is in the middle
	# Therefore, it will be aligned with the hot spot in the centre of the DSM
	tmp = return_array.copy()
	mid = return_array.shape[1]/2
	if return_array.shape[1]%2 == 0:
		extra = 0
	else:
		extra = 1
	return_array[:,int(mid):,:] = tmp[:,0:int(mid+extra),:]
	return_array[:,0:int(mid),:] = tmp[:,int(mid+extra):,:]
	return return_array