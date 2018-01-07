using Manifolds
using Base.Test

M = Sphere()
x = randn(3)
g = randn(3)
@test dot(proj_tangent(M,g,x),x) ≈ 0
@test norm(retract(M, x)) ≈ 1
