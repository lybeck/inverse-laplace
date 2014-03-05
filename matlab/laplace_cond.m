% Creates plots about the condition of the Laplace transform matrix.
%
% Author: Lasse Lybeck

if ~(exist('data/lap_data.mat', 'file'))
    error('No data found! Run file laplace_data.m first!')
end
load data/lap_data.mat s t A f m

% font size for plot
fontsz = 14;

% the singular values of A
d = svd(A);

% plot the singular values
figure(1)
clf
semilogy(d, 'k-')
grid on
title('Singular values of the Laplace transform matrix', 'fontsize', fontsz)
xlabel('Index of singular value', 'fontsize', fontsz)
ylabel('Singular value', 'fontsize', fontsz)
