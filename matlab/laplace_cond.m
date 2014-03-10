% Creates plots information about the condition of the Laplace transform
% matrix.
%
% Author: Lasse Lybeck

% number of points and max value of s
n = 300;
maxs = 100;

% number of points and max value of t
k = 1000;
maxt = 3;

% data
s = linspace(0, maxs, n)';
t = linspace(0, maxt, k)';

% Laplace transform matrix and function values
[A, ~] = laplace_mat(s, t);

% font size for plot
fontsz = 14;

% the singular values and condition number of A
d = svd(A);
cnd = cond(A);

% plot the singular values
figure(1)
clf
semilogy(d, 'k-')
grid on
title('Singular values of the Laplace transform matrix', 'fontsize', fontsz)
xlabel('Index of singular value', 'fontsize', fontsz)
ylabel('Singular value', 'fontsize', fontsz)
text(103, 2e-5, sprintf('Condition number: %e', cnd), 'fontsize', fontsz)


k = 1:500;
cnd = zeros(length(k), 1);
for ii = 1:length(k)
    s = linspace(0, maxs, k(ii))';
    t = linspace(0, maxt, k(ii))';
    [A, ~] = laplace_mat(s,t);
    cnd(ii) = cond(A);
end

figure(2)
clf
semilogy(k, cnd, 'k.', 'markersize', 10);
axis([k(1), k(length(k)), 1e18, 1e22])
title('Condition numbers of the Laplace transform matrix', 'fontsize', fontsz)
xlabel('Number of rows and columns', 'fontsize', fontsz)
ylabel('Condition number', 'fontsize', fontsz)

