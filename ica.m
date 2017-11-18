function[source] = ica(M)
%1. Set the mean of M to 0
M = M -  mean(M, 2);

%2. Find the eigen decomposition of M * transpose(M)
[E,S, Et] = eig((M * transpose(M)));
C = S^(-0.5)* Et; % C is rhe whitening matrix
X = C * M; % X is the whitened matrix

% to free up fourth moments on X
% - Create a matrix of fourth moment terms that would be
%   diagonal if it's rows were independent 
% - diagonalize it
z = repmat (sqrt (sum (X.^2)), size(M,1), 1);
[E1, D1] = eig (cov (z'));

source = E1' * X;