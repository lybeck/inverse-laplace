% Creates a plot of the Laplace transform of the function f defined in the
% home exam
% 
% Author: Lasse Lybeck

maxs = 20;
n = 200;
s = linspace(0, maxs, n);

fontsz = 14;

F = @(s) mylaplace(s);

figure(1)
clf
subplot(1, 2, 1)
plot(s, F(s), 'k-', 'linewidth', 2)
grid on
xlabel('s', 'fontsize', fontsz)
ylabel('F(s)', 'fontsize', fontsz)
title('Laplace transform of the function f = \chi_{[0,1]}', 'fontsize', fontsz)

if ~(exist('data/lap_data.mat', 'file'))
    error('No data found! Run file laplace_data.m first!')
end
dataS = s;
load data/lap_data.mat s t A f m

% indeces of s, where s is not too large
ind = (s <= maxs);

subplot(1,2,2)
plot(dataS, F(dataS), 'k-', s(ind), m(ind), 'r.', 'linewidth', 1, 'markersize', 15)
grid on
xlabel('s', 'fontsize', fontsz)
ylabel('F(s)', 'fontsize', fontsz)
title('Example of synthetic data', 'fontsize', fontsz)
leg = legend('Laplace transform', 'data');
set(leg, 'fontsize', fontsz)
