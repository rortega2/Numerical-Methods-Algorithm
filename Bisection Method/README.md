# Bisection Method 
Uses Bisection Method to evaluate the root at a given function
### input:
* func = name of function 
* xl, xu = lower and upper guesses
* es = desired relative error (default = 0.0001%)
* maxit = maximum allowable iterations (default = 50)
* p1,p2,… = additional parameters used by func
### output:
* root = real root
* fx = function value at root
* ea = approximate relative error (%)
* iter = number of iterations
