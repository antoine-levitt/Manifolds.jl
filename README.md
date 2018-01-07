# Manifolds

Define an interface for working on manifolds, as well as a set of predefined manifolds. The target use is optimization of differential equation integration that stay on a specific manifold at each step of the algorithm.

## Example
```
using Manifolds
M = Sphere()
x = randn(3)
@assert norm(retract(M, x)) ≈ 1
```

## Interface
The following functions are supported:
* `retract!(M::Manifold, x)`: retract x, i.e. find a point close to x that belongs to the specified manifold
* `project_tangent!(M::Manifold, g, x)`: project g onto the tangent space at x
as well as out-of-place versions `retract(M,x)` and `project_tangent(M, g, x)`.

## Supported manifolds
The following manifolds are currently supported:
* Flat: Euclidean space, default. The operations are no-ops.
* Sphere: spherical constraint `||x|| = 1`.
* Stiefel: Stiefel manifold of N by n matrices with orthogonal columns, i.e. `X'*X = I`. The default algorithm for retractions on the manifold is to use a SVD, but a faster (although less stable) algorithm is available by calling `Stiefel(:CholQR)`.

The following meta-manifolds construct manifolds out of pre-existing ones:
* PowerManifold: identical copies of a specified manifold
* ProductManifold: product of two (potentially different) manifolds

Implementing new manifolds is as simple as adding methods `project_tangent!(M::YourManifold,g,x)` and `retract!(M::YourManifold,x)`. If you implement another manifold, please contribute a PR!

## References
The Geometry of Algorithms with Orthogonality Constraints, Alan Edelman, Tomás A. Arias, Steven T. Smith, SIAM. J. Matrix Anal. & Appl., 20(2), 303–353

Optimization Algorithms on Matrix Manifolds, P.-A. Absil, R. Mahony, R. Sepulchre, Princeton University Press, 2008
