function x = tr_svd_solve(A, b, alpha)

[U, D, V] = svd(A);
trD = zeros(size(D));

for ii = 1:min(size(D))
    if D(ii) < alpha
        break
    end
    trD = D(ii);
end

x = V * pinv(trD) * U' * b;

end
