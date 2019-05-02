function [I] = Simpson(x,y)
% Simpson Integration
% I = Simpsosn (x,y)
%   Description: Uses Simpson's 1/3 Rules and Trapezoidal Rule to evaluate
%   the integral for a set of tabulated data.
% Input:
%   x - Vector x
%   y - Vector y
% Output:
%   I = Evaluatted Integral for the function of values y wit respect to x
% Created: 19 April 2019
% By: Roberto Ortega :D

% Error Checks
if length(x)~=length(y),error("Vector X and y must be the same length!"),end
Diff_X = round(abs(diff(x)),15); % Array of the interval differences
for i=1:length(x)-1 % Checks if first term is equal to all others
    if Diff_X(1,1)~=Diff_X(1,i)
        error("x vector must be equally spaced!")
    end
end

interval_num= length(diff(x)); % Number of intervals is stored
if rem(interval_num,2)== 0 % If Even intervals
    odd_even = 1; % Set var to 1
elseif rem(interval_num,2)==1 % If Odd intervals
    odd_even = 0; % Set var to 0
end

I_2=0; I_4=0; I=0; % Initial conditions
if odd_even == 1 % Even Intervals | No Trapezoidal Rule Used 
    for i=2:2:(length(y)-1)
        I_4 = I_4 + 4*(y(1,i)); % Individual sum of I4
    end
    for k=3:2:length(y)-1
        I_2 = I_2 + 2*(y(1,k)); % Individual sum of I2
    end
    h = (x(1,length(x)) - x(1,1)); % Finds the interval (a-b)
    I = ( h *(y(1,1) + I_4 + I_2 + y(1,length(y))) / (3*interval_num));
    % Final Integral using 1/3 Rule 
    
elseif odd_even == 0 % Odd Intervals | Trapezoidal Rule Used
    for i=2:2:(length(y)-1)
        I_4 = I_4 + 4*(y(1,i)); % Individual sum of I4
    end
    for k=3:2:length(y)-2
        I_2 = I_2 + 2*(y(1,k)); % Individual sum of I2
    end
    h = (x(1,length(x)-1)) - x(1,1); % Finds the interval (a-b)
    I = ( h *(y(1,1) + I_4 + I_2 + y(1,length(y)-1)) / (3*(interval_num-1)));
    Trap = (x(1,length(x)) - x(1,length(x)-1)) * (( ((y(1,length(x)-1)) + y(1,length(x))) / 2 ));
    % Single Iteration of Trapezoidal Rule
    I = Trap + I
    % Final Integral using 1/3 Rule 
    warning('Trapezoidal Rule was used on The Last Interval')
    
end
end
