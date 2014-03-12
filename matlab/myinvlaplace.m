% Runs the inversion of the Laplace transform with different values of
% the regularization parameter alpha and plots the best results in the
% sense of the relative error.
%
% Author: Lasse Lybeck

if ~(exist('data/lap_data.mat', 'file'))
    error('No data found! Run file laplace_data.m first!')
end
load data/lap_data.mat s t A f m

% font size for plot
fontsz = 14;

% maximum value of t
maxt = t(length(t));

% initialize the regularization parameters
alpha_vec = logspace(-1, -10, 10)';
alpha_vec = [alpha_vec ; 0];
alpha_n = length(alpha_vec);

% initialize vector for recording of errors
errs = zeros(alpha_n,1);

fprintf('\n%-10s %-20s %-10s\n', 'Alpha', 'Singular values', 'Error')
for ii = 1:alpha_n
    
    % get reconstruction with the truncated svd
    alph = alpha_vec(ii);
    [rec, sing_n] = tr_svd_solve(A, m, alph);
    
    % record the relative error
    relerr = norm(rec(:)-f(:))/norm(f(:))*100;
    errs(ii) = relerr;
    
    % print the result
    fprintf('%-10.0e %-20d %-10g\n', alph, sing_n, relerr)
    
end
fprintf('\n')

% find minimum error
[minerr, ind] = min(errs);

% recalculate best reconstruction
alph = alpha_vec(ind);
[rec, sing_n] = tr_svd_solve(A, m, alph);

% plot the best reconstruction
figure(1)
clf
plot(t, f, 'b-', t, rec, 'k--', 'linewidth', 2)
axis([0 maxt -1 2])
grid on
title('Reconstruction with the inverse Laplace transform', 'fontsize', fontsz)
legend('Function', 'Reconstruction')
