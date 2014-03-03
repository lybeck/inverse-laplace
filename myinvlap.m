
% number of points
n = 100;
k = 300;

% maximum value of s
maxs = 100;

% maximum value of t
maxt = 3;

%noise level
noise_lvl = 1e-8;

% data
s = sort(maxs * rand(n,1));

% points for integration
t = linspace(0, maxt, k)';

[A, f] = lap_mat(s, t);

% measurement data with noise
m = A * f + noise_lvl * randn(n, 1);

[U, D, V] = svd(A);

trD = zeros(size(D));
% number of singular values
sings = min(size(D));

for ii = 1:sings
    
    trD(ii,ii) = D(ii, ii);
    trpinvA = V * pinv(trD) * U';
    
    rec = trpinvA * m;
    
    fprintf('Using %d singular values.\n', ii)
    plot(t, f, 'b-', t, rec, 'r-+')
    axis([0 maxt -1 2])
    pause
    
end
