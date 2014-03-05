% MYLAPLACE Returns the Laplace transform of the function defined in the
% home exam
%
%   y = MYLAPLACE(s) Returns the Laplace transform evaluated at the points
%   of the vector s.
%
% Author: Lasse Lybeck
function y = mylaplace(s)

y = zeros(size(s));
for ii = 1:length(s)
   y(ii) = quad(@(t) exp(-s(ii)*t), 0, 1);
end

end