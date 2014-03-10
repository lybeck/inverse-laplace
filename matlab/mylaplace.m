% MYLAPLACE Returns the Laplace transform of the function defined in the
% home exam
%
%   y = MYLAPLACE(s) Returns the Laplace transform evaluated at the points
%   of the vector s. Elements of s should be strictly positive.
%
% Author: Lasse Lybeck
function y = mylaplace(s)

y = (1 - exp(-s)) ./ s;

end