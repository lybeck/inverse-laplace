function y = mylaplace(s)

load constant.mat k

t = linspace(0,1,k);

y = zeros(size(s));
for ii = 1:length(s)
   x = s(ii);
   y(ii) = (.5 * exp(-x*t(1)) + sum(exp(-x*t(2:end-1))) + .5 * exp(-x*t(end))) / k;
end

end