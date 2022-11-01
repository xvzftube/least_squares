using Statistics 
using LinearAlgebra 
Y = [3.22, 4.87, 0.12, 2.31, 4.25, 2.24, 2.81, 
3.71, 3.11, 0.9, 4.39, 4.36, 1.26, 3.13, 4.05, 2.28, 3.6, 5.39, 
4.12, 3.16, 4.4, 1.18, 2.54, 4.89]
X = [3.74, 
3.66, 0.78, 2.4, 2.18, 1.96, 0.2, 2.5, 3.5, 1.35, 2.36, 3.13, 
1.22, 1, 1.29, 0.95, 1.05, 2.92, 1.76, 0.51, 2.17, 1.99, 1.53, 
2.6]
# Least squares (standard)
X1 = hcat(ones(24,1), X)
(inv((X1)' * X1) * (X1)') * Y # <- love this compact notation XD
# Least squares (horizontal)
Y1 = hcat(ones(24,1), Y)
(inv((Y1)' * Y1) * (Y1)') * X # x= 0.8203 + 0.3547y #then solve for y; y= −2.31 + 2.82x
# Orthogonal
xc = X .- mean(X)
yc = Y .- mean(Y)
A = hcat(ones(24,1), xc)
SVD = svd(hcat(A, yc))
sigma2 = (svdvals(SVD)[end])^2
b1 = inv((A)'*A .- sigma2 * Matrix{Float64}(I, 2, 2)) * (A)' * yc
b0 = mean(Y) - b1[end] * mean(X)
slope = b1[end] 
intercept = b0
println("slope: ", slope) #[1] 1.873954
println("intercept: ", intercept) #[1] -0.4715572
