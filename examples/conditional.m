% Conditional data selection % 

v = [0.001; 0.5; 6.4; 10.5; 0.002; 7.1; -4.8]
I = v<0.005

% Logical vector 
r = v(I)
r

% Modify vector in place
v(I) = 0
v
    