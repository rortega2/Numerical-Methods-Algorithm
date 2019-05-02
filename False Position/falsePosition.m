function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxiter)
% False Position
% [root,fx,ea,iter] = falsePostion(func,xl,xu,es,maxiter)
%   Description: Uses False Position method to find the root of a
%                function given a bracket.
% Input:
%   func - Name of function
%   xl,xu - Lower and upper guesses
%   es - Desired relative error (default = .0001%)
%   maxiter - Number of desired iterations (default = 200)
% Output:
%   root - Estimated root location
%   fx - function evalated at root location
%   ea - approximate relative error
%   iter - iterations performed
% 
% Created: 28 February 2019
% By: Roberto Ortega :D

format long
root_present=0
if nargin<3, error('At least 3 input arguments needed'),end
root_present = (func(xl)*func(xu));
% Error check to see if root is bounded|Should output a negative number
if root_present>0, error('no sign change'),end
if nargin<4 || isempty(es), es = 0.0001;end
if nargin<5 || isempty(maxiter), maxiter = 200; end
ea = 100; iter = 0; xr = xl;

while (1)
    xr_prev = xr; % setting a xr previous
    xr = (xu-((func(xu)*(xl-xu))/(func(xl)-func(xu))));
    %Calculating the xr per iteration
    iter = iter + 1; % Iteration counter
    
    if xr ~= 0, ea = abs((xr-xr_prev)/xr)*100;end
    % If the root isn't xr, calculate the approx. relative error
    if func(xl)>func(xu)&& sign(func(xr))>0% f'<0 (xl is greater than xu)
        xl = xr;    % Replace the lower bound with xr
    elseif func(xl)>func(xu) && sign(func(xr))<0
        xu = xr;
    elseif func(xl)<func(xu) && sign(func(xr))>0 % f'>0 (xu is greater than xl)
        xu = xr;    % Replace the upper bound with xr
    elseif func(xl)<func(xu) && sign(func(xr))<0 % f'>0 (xu is greater than xl)
        xl = xr;    % Replace the upper bound with xr
    else
        error('An error occurred! Change Roots')
    end
    if ea <= es || iter >= maxiter, break, end % Stopping criterion
    % When relative error<=desired error OR iterations>maxiter|Stop Loop
end
root = xr; fx = func(root);


fprintf('The estimated root is %f \n', root);
fprintf('The root has a function value of %f \n',fx);
fprintf('The approximate relative error is %f \n', ea);
fprintf('Iterations performed: %0.0f \n', iter);

end
