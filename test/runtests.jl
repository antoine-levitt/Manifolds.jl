using Manifolds
using Base.Test

M = Sphere()
x = randn(3)
g = randn(3)
@test norm(retract!(M, x)) ≈ 1
@test abs(dot(project_tangent(M,g,x),x)) < 1e-14
