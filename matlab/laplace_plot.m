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
plot(s, F(s), 'k-', 'linewidth', 2)
grid on
xlabel('s', 'fontsize', fontsz)
ylabel('F(s)', 'fontsize', fontsz)
title('Laplace transform of the function f = \chi_{[0,1]}', 'fontsize', fontsz)
