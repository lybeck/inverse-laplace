% TR_SVD_SOLVE Calculates the reconstruction of the system Ax = b + eps
% with the truncated svd method.
%
%   [x, n] = TR_SVD_SOLVE(A, b, alpha) Returns the reconstruction x of the
%   system, and the number of singular values greater than alpha in the
%   variable n. Alpha is the regularization parameter.
%
% Author: Lasse Lybeck
function [x, n] = tr_svd_solve(A, b, alpha)

[U, D, V] = svd(A);
trD = zeros(size(D));

n = 0;
for ii = 1:min(size(D))
    if D(ii, ii) < alpha
        n = ii - 1;
        break
    end
    trD(ii, ii) = D(ii, ii);
end

x = V * pinv(trD) * U' * b;

end
