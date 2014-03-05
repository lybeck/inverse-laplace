% F_EVAL Evaluates the function f defined in the home exam.
%
%   y = F_EVAL(x) Evaluates the value of the function at the points of the
%   vector x and returns the function values in the vector y.
%
% Author: Lasse Lybeck
function y = f_eval(x)

y = zeros(size(x));
for ii=1:length(x)
    y(ii) = 1*(x(ii) >= 0 && x(ii) <=1);
end

end