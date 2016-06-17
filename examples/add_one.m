%{ 
A function is written and called 
as a file. Several functions can
co-exist only if a main function
calls the others.
%}

function result = add_one(n)
result = add_anything(n, 1);

% This function gets called internally
function added = add_anything(a, b)
added = a + b;









