Y = c(3.22, 4.87, 0.12, 2.31, 4.25, 2.24, 2.81, 
3.71, 3.11, 0.9, 4.39, 4.36, 1.26, 3.13, 4.05, 2.28, 3.6, 5.39, 
4.12, 3.16, 4.4, 1.18, 2.54, 4.89) 
X = c(3.74, 
3.66, 0.78, 2.4, 2.18, 1.96, 0.2, 2.5, 3.5, 1.35, 2.36, 3.13, 
1.22, 1, 1.29, 0.95, 1.05, 2.92, 1.76, 0.51, 2.17, 1.99, 1.53, 
2.6)
X1 <- cbind(1, X)
X <- X
# Least squares (standard)
solve(t(X1) %*% X1) %*% t(X1) %*% Y # lm(df$Y ~ df$X)
# Least squares (horizontal)
Y1 <- cbind(1, Y)
solve(t(Y1) %*% Y1) %*% t(Y1) %*% X # lm(df$X ~ df$Y) # x= 0.8203 + 0.3547y #then solve for y ;y= −2.31 + 2.82x
# Least squares (orthogonal) # https://stats.stackexchange.com/questions/584869/total-least-squares-estimator
xc <- X - mean(X)
yc <- Y - mean(Y)
A <- model.matrix(~ xc)
SVD <- svd(cbind(A, yc))
sigma2 <- tail(SVD$d, 1)^2
b1 <- solve(crossprod(A) - sigma2 * diag(2)) %*% t(A) %*% yc
b0 <- mean(Y) - b1[2]*mean(X)
slope <- b1[2] 
intercept <- b0
slope #[1] 1.873954
intercept #[1] -0.4715572
