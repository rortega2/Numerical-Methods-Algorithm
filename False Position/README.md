# False Position 
Uses False Position to evaluate the root at a given function
### Input:
* func - Name of function
* xl,xu - Lower and upper guesses
* es - Desired relative error (default = .0001%)
* maxiter - Number of desired iterations (default = 200)
### Output:
* root - Estimated root location
* fx - function evalated at root location
* ea - approximate relative error
* iter - iterations performed
