A = 8*eye(8) + (2*(tril(ones(8), -1) - tril(ones(8), -2))) + (2*(tril(ones(8), 1) - tril(ones(8), 0)))