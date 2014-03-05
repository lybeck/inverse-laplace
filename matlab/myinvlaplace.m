% Runs the inversion of the Laplace transform with different values of
% the regularization parameter alpha and plots the results.
%
% Author: Lasse Lybeck

if ~(exist('data/lap_data.mat', 'file'))
    error('No data found! Run file laplace_data.m first!')
end
load data/lap_data.mat s t A f m

% initialize the regularization parameters
ex = -1:-1:-16;
ex = ex(:);
alpha_vec = [10.^ex ; 0];
alpha_n = length(alpha_vec);

% number of singular values
sings = min(size(A));

% initialize vector for recording of errors
errs = zeros(alpha_n,1);

for ii = 1:alpha_n
    
    % get reconstruction with the truncated svd
    alph = alpha_vec(ii);
    [rec, sing_n] = tr_svd_solve(A, m, alph);
    
    % record the relative error
    relerr = norm(rec(:)-f(:))/norm(f(:))*100;
    errs(ii) = relerr;
    
    % print the result
    fprintf('Alpha = %e\n', alph)
    fprintf('Using %d of %d singular values. Relative error: %g %%\n', sing_n, sings, relerr)
    
    % plot the result
    figure(1)
    clf
    plot(t, f, 'b-', t, rec, 'r-+')
    plot_text = text(1.3, 1.5, ...
        sprintf(['Singular values:       %d\n' ...
                 'Least singular value:  %e\n' ...
                 'Relative error:        %.3g %%'], ii, sng, relerr), ...
        'FontSize', 12);
    axis([0 maxt -1 2])
    pause
    
end

close(1)
