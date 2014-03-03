function [A, f] = lap_mat(s, t)

k = length(t);
f = f_eval(t);

s = s(:);
A = zeros(length(s), k);

for ii = 1:k
    A(:,ii) = exp(-s * t(ii)) / k;
end
A(:,1) = A(:,1) / 2;
A(:,end) = A(:,end) / 2;

end
