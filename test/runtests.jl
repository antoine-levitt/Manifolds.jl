using Manifolds
using Base.Test

M = Sphere()
x = randn(3)
@test norm(retract(M, x)) ≈ 1
