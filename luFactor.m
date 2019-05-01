function [L,U,P] = luFactor(A)
% LU Factorization
% [L,U,P] = luFactor(A)
%   Description: Uses the LU factorization method on a square matrix and
%                outputs the lower, upper, and pivot matrix.
% Input:
%   A - Square Coefficient Matrix
% Output:
%   L - Lower Triangular Matrix
%   U - Upper Triangular Matrix
%   P - Pivot Matrix
%
% Love you Dr. B <3
% Created: 1 April 2019
% By: Roberto Ortega :D

% Error Checks on Matrix A
if nargin>1 || nargin==0, error("Input a square coefficient matrix as 'A' "),end
[m,n] = size(A);
if m~=n, error('"A" MUST be a square matrix '),end

U=A; P = eye(n); L = zeros(n); % Starting Inputs

% Pivot the matrix row by row
for k=1:(n-1)
    [~,loc] = max(abs(U(:,k))); % Finds the location of the row of max
    if loc>k
        U([k loc],:) = U([loc k],:);
        L([k loc],:) = L([loc k],:); % Pivots L,U,P if not above
        P([k loc],:) = P([loc k],:);
        
        for i = k:m
            L(i,k) = U(i,k)/U(k,k); % Stores divisor in L
            subRow = L(i,k) * U(k,:);
            currentRow = U(i,:);
            if L(i,k) ~= 1
                U(i,:) = minus(currentRow, subRow);
                % Naive Gauss Elimination
            end
        end
    else
        for i = k:m
            % Occurs when two values are equal or max is already above
            L(i,k) = U(i,k)/U(k,k);
            subRow = L(i,k) * U(k,:);
            currentRow = U(i,:);
            if L(i,k) ~= 1 || ( i~=k && U(i,k)== U(k,k))
                % if dividend and divisor are equal in magnitude
                U(i,:) = minus(currentRow, subRow);
            end
        end
    end
end
for q =1:m
    L(q,q) = 1; % Completes L matrix with diagnoal 1's
end

end
