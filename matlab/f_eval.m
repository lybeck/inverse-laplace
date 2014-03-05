function y = f_eval(x)

y = zeros(size(x));
for ii=1:length(x)
    y(ii) = 1*(x(ii) >= 0 && x(ii) <=1);
end

end