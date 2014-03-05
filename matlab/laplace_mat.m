% LAPLACE_MAT Returns the Laplace transform matrix and the values of the
% evaluated function.
%
%   [A, f] = LAPLACE_MAT(s, t) Calculates the Laplace transform matrix for
%   the predefined function in the home exam at the points s with the
%   trapezoidal rule discretization points t. The values of t must be equally
%   spaced. The returned vector f contains the function values evaluated at
%   the points t.
%
% Author: Lasse Lybeck
function [A, f] = laplace_mat(s, t)

k = length(t);
f = f_eval(t);

s = s(:);
A = zeros(length(s), k);

maxt = t(k);

for ii = 1:k
    A(:,ii) = maxt * exp(-s * t(ii)) / k;
end
A(:,1) = A(:,1) / 2;
A(:,end) = A(:,end) / 2;

end
