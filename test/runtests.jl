using CoordinateSystems
using Base.Test
using ImmutableArrays

# write your own tests here
@test CoordinateSystems.normalize(Vector3(2.0,0.0,0.0)) == Vector3(1.0,0.0,0.0)

v0 = Vector3(0.0,0.0,0.0)
vx = Vector3(1.0,0.0,0.0)
vy = Vector3(0.0,1.0,0.0)
vz = Vector3(0.0,0.0,1.0)
vn = Vector3(1.0,2.0,3.0)

normal_cs = CoordinateSystem(v0,vz,vx)
@test to_global(normal_cs,vn) == vn
@test from_global(normal_cs,vn) == vn

flipxy_cs = CoordinateSystem(v0,vz,vy)
@test to_global(flipxy_cs,vn) == Vector3(-2.0,1.0,3.0)
@test from_global(flipxy_cs,vn) == Vector3(2.0,-1.0,3.0)

offsetx_cs = CoordinateSystem(vx,vx+vz,vx+vx)
@test to_global(offsetx_cs,vn) == Vector3(2.0,2.0,3.0)
@test from_global(offsetx_cs,vn) == Vector3(0.0,2.0,3.0)
