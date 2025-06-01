from numpy import *
from pyproj import *

def project(proj_name,R_z, u, v, u0):
    # Create new projection
    my_proj =  Proj(proj=proj_name, R=R_z, lat_1=u0)

    # Project point calculation
    [X,Y] = my_proj(v,u)

    # Distortions
    dist = my_proj.get_factors(v, u)
    a = dist.tissot_semimajor
    b = dist.tissot_semiminor

    return X, Y, a, b
