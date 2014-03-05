function [A, f] = lap_mat_simp(s, t)

k = length(t);
f = f_eval(t);

s = s(:);
A = zeros(length(s), k);

maxt = t(k);

for ii = 1:k
    A(:,ii) = maxt * exp(-s * t(ii)) / (3*k);
end
A(:,2:2:end-1) = A(:,2:2:end-1) * 4;
A(:,3:2:end-1) = A(:,3:2:end-1) * 2;

end
