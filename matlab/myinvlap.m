
% number of points
n = 300;
k = 1000;

% maximum value of s
maxs = 100;

% maximum value of t
maxt = 3;

%noise level
noise_lvl = 1e-4;

% data
s = sort(maxs * rand(n,1));

% points for integration
t = linspace(0, maxt, k)';

[A, f] = lap_mat(s, t);

% measurement data with noise
m = mylaplace(s) + noise_lvl * randn(n, 1);

[U, D, V] = svd(A);

trD = zeros(size(D));
% number of singular values
sings = min(size(D));

errs = zeros(sings, 1);

for ii = 1:sings
    
    trD(ii,ii) = D(ii, ii);
    sng = trD(ii, ii);
    trpinvA = V * pinv(trD) * U';
    
    rec = trpinvA * m;
    relerr = norm(rec(:)-f(:))/norm(f(:))*100;
    errs(ii) = relerr;
    
    fprintf('Using %d singular values. Relative error: %g %%\n', ii, relerr)
    plot(t, f, 'b-', t, rec, 'r-+')
    plot_text = text(1.3, 1.5, ...
        sprintf(['Singular values:       %d\n' ...
                 'Least singular value:  %e\n' ...
                 'Relative error:        %.3g %%'], ii, sng, relerr), ...
        'FontSize', 12);
    axis([0 maxt -1 2])
    pause
    
end
