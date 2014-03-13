% Creates and saves the data used in the inversion of the Laplace
% transform. The data is saved in the file data/lap_data.mat
%
% Author: Lasse Lybeck

% number of points and max value of s
n = 300;
maxs = 100;

% number of points and max value of t
k = 1000;
maxt = 3;

% noise level
noise_lvl = 1e-4;

% data
s = linspace(0, maxs, n + 1)';
t = linspace(0, maxt, k)';

% discard s = 0
s = s(2:end);

% Laplace transform matrix and function values
[A, f] = laplace_mat(s, t);

% measurement data with noise
m = mylaplace(s) + noise_lvl * randn(n, 1);

if ~exist('data', 'dir')
    mkdir data
end

save data/lap_data.mat s t A f m
