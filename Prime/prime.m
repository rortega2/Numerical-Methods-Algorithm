function pr = prime(m,n)
% Prime Function determines all of the Prime numbers between m and n 
%   Inputs:
%        m - Starting Integer
%        n - Integer where n>m
%   Outputs:
%       pr - A vector containing prime number elements
%
% Created on: 16 November 2018 
% By: Roberto Ortega :D 
if n<0 || m<0 || not(floor(m)==m) || not(floor(n)==n)
    % Makes sure the m and n values are intergers and positive
    error("The input argument must be a positive integer.")
elseif m >= n % Makes sure the m is greater or equal to n
    error('The vaue of n must be larger than the value of m.')
else
     w = 1; % Creates index variable
    for j = n-1:-1:m+1 % Loops the numbers in between n and m
        x = 1; 
        for k = 2:1:j-1 % Sets the loop for the divisors
            remainders(1,x) = rem(j,k); 
            % The quotient (output) is placed into the matrix, remainders
            x=x+1; % Counts up for the matrix
        end
            if min(remainders()) ~= 0
                % Considers if the min for a specific j is not 0, meaning
                % it is a prime
                pr(1,w) = j; % If prime, places the prime j into array, pr 
                w=w+1; % Counter 
            end
        if m>1    
            remainders(end) = [];
            % Eliminates the last index in remainders after each j occurrs.
        end
    end
pr = sort(pr);       
end            

