import numpy as np
Y = np.array([3.22, 4.87, 0.12, 2.31, 4.25, 2.24, 2.81, 
3.71, 3.11, 0.9, 4.39, 4.36, 1.26, 3.13, 4.05, 2.28, 3.6, 5.39, 
4.12, 3.16, 4.4, 1.18, 2.54, 4.89])
X = np.array([3.74, 
3.66, 0.78, 2.4, 2.18, 1.96, 0.2, 2.5, 3.5, 1.35, 2.36, 3.13, 
1.22, 1, 1.29, 0.95, 1.05, 2.92, 1.76, 0.51, 2.17, 1.99, 1.53, 
2.6])
# Least squares (standard)
X1 = np.column_stack([np.ones(24), X])
np.dot(np.dot(np.linalg.inv(np.dot(np.transpose(X1), X1)), np.transpose(X1)), Y) # lm(df$Y ~ df$X)
# Least squares (horizontal)
Y1 = np.column_stack([np.ones(24), Y])
np.dot(np.dot(np.linalg.inv(np.dot(np.transpose(Y1), Y1)), np.transpose(Y1)), X) # lm(df$X ~ df$Y) # x= 0.8203 + 0.3547y #then solve for y ;y= −2.31 + 2.82x
# Least squares (orthogonal) # https://stats.stackexchange.com/questions/584869/total-least-squares-estimator
xc = X - np.mean(X)
yc = Y - np.mean(Y)
A = np.column_stack([np.ones(24), xc])
u, s, vh = np.linalg.svd(np.column_stack([A, yc]))
sigma2 = (s[-1:])**2
b1 = np.dot(np.dot(np.linalg.inv(np.dot(np.transpose(A),A) - sigma2 * np.eye(2)), np.transpose(A)), yc)
b0 = np.mean(Y) - b1[1]*np.mean(X)
slope = b1[1] 
intercept = b0
slope #[1] 1.873954
intercept #[1] -0.4715572
