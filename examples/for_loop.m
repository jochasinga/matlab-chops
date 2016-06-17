% For loop in MatLab %
y(1) = 1;

for n = 1:6
    y(n+1) = y(n)-0.1*y(n)
end

y