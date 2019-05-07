%% Quadratic Solver
% Description: Program allows user to solve the roots of function f(x),
% given a, b, c in ax^2+bx+c, with Quadratic Equation 
%
% Created on: 5 November 2018
% By: Roberto Ortega :D

clear
clc
disp('For ax^2+bx+c')
varA = input('Enter a: ');
varB = input('Enter b: ');
varC = input('Enter c: ');
%Promts the user for the coefficients of their trinomial
fprintf('\n')

Disc = (varB^2-(4*varA*varC));
%Evaluates the discriminant as less than, greater than, or equal to 0
if Disc > 0 
   % If there are 2 roots (discriminant>0)
   fprintf('The equation has 2 Real Roots')
   Root1 = (-varB + sqrt((varB^2-(4*varA*varC))))/(2*varA);
   Root2 = (-varB - sqrt((varB^2-(4*varA*varC))))/(2*varA);
   % Calculation of both roots using quadratic equation 
   fprintf('\n x= %.3f, %3f \n',Root1, Root2)
   % Print roots to user

elseif Disc == 0 
    % If the there is only 1 root (Discriminant=0)
    fprintf('The Equation has 1 Real Root')
    quadEqu = (-varB/(2*varA));
    % Simplified quadratic equation b/c discriminant=0
    fprintf('\n x= %.3f, \n',quadEqu)
    % Prints roots to user
    
else
    % If the discriminant is less than 0(no real roots )
    disp ("No real Roots") 
end
   
