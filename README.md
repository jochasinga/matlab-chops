matlab-chops
============
Quick MATLAB intro and examples for [Aerial Robotics Course on Coursera](https://www.coursera.org/learn/robotics-flight).

Contributions
-------------
Please, fork away and send pull requests. Help add more lessons, code samples, tips and tricks
to help fellow students.

Jump To
-------
+ [Basics](#variables)
    - [Variables](#variables)
    - [Vectors](#creating-vectors) 
	- [Functions](#functions)
    - [Vector calculations](#vector-calculations)
    - [Matrices](#creating-matrices)
    - [Matrix multiplication](#matrix-multiplication)
+ [Programming](#logical-operators)
    - [Logical Operators](#logical-operators)
	- [Conditional data selection](#conditional-data-selection)
	- [FOR loop](#for-loop)
	- [IF-ELSE Statement](#if-else-statement)
+ [Advanced Tools](#multiple-plots)
    - [Multiple Plots](#multiple-plots)
	- [Annotating Graphs](#annotating-graphs)
	- [Solving Linear Equations](#solving-linear-equations)
	- [Symbolic Calculations](#symbolic-calculations)
	- [Function Handles](#function=handles)

Variables
---------
+ Use `=` to assign a value to a variable name.
+ Use `;` to terminate a statement (or expression).
+ Without variable, a returned value of an expression will be
saved to a variable named `ans` by default.

```matlab

% This will print x out right away.
x = 1

% This won't print y out.
y = 2;

% This will store the result in `ans`
10 + 2;

```

Creating Vectors
----------------
Vectors are close to arrays or list in other dynamic languages. Except
that a vector index starts at 1 and can be both row and column.

```matlab

% Row vector
% x = [ 1  2  3  4 ]
x = [1, 2, 5, 4];

% Column vector
% y = [
%       1
%       2
%       6
%      10
% ]
y = [1; 2; 6; 10];

```

Vectors of incremental/decremental nature can be created by using range operator (`:`).
`x = from:to:step`

```matlab

% Create a vector from 1 to 10 with a step of 1.
x = 1:10:1; 

% Create a vector from 5 to 8 with a step of 0.5
y = 5:8:0.5;

% A range may not necessary reach the higher limit
% but will never exceed it. Consider this vector 
% will only goes as far as 4.9 for the step provided.
c = 1:0.3:5;

```

Functions
---------
A function can have zero or more inputs and outputs:

```matlab
x = sqrt(4)
y = sin(10)
z = cos(3)

% Some take multiple inputs
plot(x, y)

% Many functions can take a vector or matrix.
% This function returns the least value in a vector.
x = min([1, 0, -4, 8])

% Also, it returns a second value which is the position of that returned value.
% We should get [-4, 3] here.
[x, i] = min([1, 0, -4, 8])

```

To write your own function, create a seperate .m file to house it.

```matlab

% add_one.m
function result = add_one(num)
result = num + 1

```
You would simply call `add_one(any_num)`.

The name of the .m file should be the same as the name of the function
within it. Multiple functions can reside in a file if a main function
needs to call other "private" functions.

```matlab
% add_one.m
function result = add_one(num)
result = add_pair(num, 1)

func sum = add_pair(num1, num2)
sum = num1 + num2

```
This time `add_one` calls `add_pair` in its file.

Vector Calculations
-------------------
Often than not, in MATLAB, calculations are done on vectors and matrices.
For instance, multiplying a scalar value to every element in a vector or
substituting a variable in an equation with every element in a vector.

```matlab

% Provided this vector.
x = -2:0.1:2;

% Create a y vector to pair with x for graph plotting
y = 3*x.^2 + 2*x - 6;

```
The `.^` is called an **elementwise POWER**. In MATLAB, `*`, `/`, and `^` are
designed to used with matrices (hence MATrixLab).

Use **elementwise operators** like `.^`, `.*`, and `./` to make calculation 
between a scalar and each element of a vector in this case.

```matlab

% This raise every element to the power of 2.
([1, 0, 5, 3]).^2

```

However, if you try `/` and `*` in the above expression it will work since
MATLAB is more forgiving at that.

Creating Matrices
-----------------
A matrix is a multidimensional vectors. Creating a matrix borrows syntax from creating row and column vectors.

```matlab

% This create a 3 x 3 matrix
% M = [
%    1  2  3
%    4  5  6
%    7  8  9
% ]
M = [1, 2, 3; 4, 5, 6; 7, 8, 9]


```

Use `,` to seperate siblings on a row, and `;` to terminate a row and start another one. 

Matrix Multiplication
---------------------
A solid rule to multiply matrix A and B together is    

> Number of column of matrix A must be equal to number of row in matrix B.    

This is what happens:

1. Each element on every n row of matrix A will be multiplied to the corresponding
element of the corresponding n column of matrix B.
2. Each pair's product will be summed to a value
3. That value will become an n x n element of the new matrix.

```matlab

% 3 x 4 matrix
%
% [
%    4  2  0 -1
%    3  1 -4  0
%   -1  0  3  6
% ]
%
A = [4, 2, 0, -1; 3, 1, -4, 0; -1, 0, 3, 6]

% 4 x 2 matrix
%
% [
%   -1  0
%    2  3
%   -2  1
%    0 -1
% ]
B = [-1, 0; 2, 3; -2, 1; 0, -1]

% Get a 3 x 2 matrix
%
% [
%   0  7
%   7 -1
%  -5 -3
% ]
C = A * B

```

Logical Operators
-----------------
A Boolean in MATLAB boil down to 0 and 1.

```matlab

% 1
3 == 3 

% 0
3 > 10

% 1
10 >= 8

% 1
10 > 3 & 5 == 5

% 0
2 & 0

% 1
0 | 1

```

Conditional Data Selection
--------------------------
When you have a vector or a matrix, you can compare it against a scalar value 
using a logical operator (`<`, `>`, `==`, and etc.) to create a **logical array**
that can be used as a data filter.

```matlab

% I -> [ 0  0  1  1 ]
I = [1, 2, 3, 10] > 2

% I -> [
%   0  1  1
%   0  0  1
% ]
I = [1.0, 10.5, 8.01; 0.4, 0.08, 7.23] > 7

% We can now use logical array I to extract data resulting in an array
% containing only the data that satisfies the criteria.
v = [10, 22, 31, 0]
I = v < 30
result = v(I)

% result -> [ 10  22  0 ]

```

For-loop
--------
FOR loop is used for repetitive code. `for` is always terminated by `end`.

```matlab

y = [];

for n = 1:10
	y(n) = n;
end

```

If-else statement
-----------------
`if` and `else` and be used for conditionals.

```matlab

function result = myfunc(x)
if x > 0 && x < 10
	result = 3; 
else
	result = 10;
end

```

Multiple plots
--------------
Plotting multiple data on the same graph.

```matlab

month = 1:12;
avgTempLondon = [
	5.24, 5.20, 6.92, 9.31, 12.26, 14.80, 16.51, 16.93, 14.91, 12.27, 8.73, 5.91
];
avgTempRio = [
	25.73, 25.98, 25.68, 24.56, 22.59, 21.71, 21.41, 21.69, 22.35, 23.27, 23.77, 25.05
];

% This plot only the temperature-month in London
% The third input specify the style of the plot ('red dot')
plot(month, avgTempLondon, 'r:o')

% This command says that we're adding more plot.
hold on 

% This plot the temperatures in Rio
plot(month, avgTempRio, 'b-*')

```
You can try using `bar(month, avgTempLondon, 'yellow')` to create a bar chart.

Annotating Graphs
-----------------
You can add labels to a graph to make it more readable.

```matlab

x = -1:0.1:1;
y = x.^2;

% Plot a hyperbolic graph
plot(x, y)

% Add labels, title and legend
xlabel('time [s]')
ylabel('amplitude')
title('my plot')
legend('y(t)')

```

Solving Linear Equations
------------------------
Making linear equations into matrices solvable in MATLAB.

Given the following equations:

> 1.5*x*<sub>1</sub> + *x*<sub>2</sub> = 3
> *x*<sub>3</sub> = 4*x*<sub>2</sub>
> 4 - *x*<sub>1</sub> + *x*<sub>2</sub> = *x*<sub>3</sub>    

#### Do the following:

1. Switch the constants to the right hand side of the equal signs
2. Move the unknown variables to the left 
3. Make sure the variables appear in the same order as the original.
4. Add one or more variables that are not present in any equations and
use 0 as the coefficient.
5. Add 1 as the coefficient of any single variable.

> 1.5*x*<sub>1</sub> + 1*x*<sub>2</sub> + 0*x*<sub>3</sub> =  3
>  0*x*<sub>1</sub> + -4*x*<sub>2</sub> + 1*x*<sub>3</sub> =  0
>  -1*x*<sub>1</sub> + 1*x*<sub>2</sub> + 1*x*<sub>3</sub> = -4    

6. Form a column vector from the constants on the right.

```matlab

b = [3; 0; -4];

```

7. Form a matrix from the coefficients on the left..

```matlab

A = [1.5, 1, 0; 0, -4, 1; -1, 1, -1];

```

If this was a scalar equation `a*x = b`, all we have to do is divide both side by `a` to get `x = b/a`. However, matrix division is very complex and we can use a `\` (left division operator) to do a matrix division.

```matlab

x = A\b;

% x =
%     1.4286
%     0.8571
%     3.4286
%

```

Symbolic Calculations
---------------------
Sometime it's ideal not to assign a value to a variable, i.e. when
dealing with imaginary numbers. MATLAB has a `syms` variable type.

We can calculate the root of a quadratic equation easily when we 
know all the coefficients.

*y* = *ax*<sup>2</sup> + *bx* + *c* = 0

```matlab

roots([3, 2, -6])

% ans = 
      -1.7963
	   1.1196

```

But sometimes you get imaginery numbers.

```matlab

roots([1, 2, 2])

ans = 
    -1.0000 + 1.0000i
    -1.0000 - 1.0000i

```

This is how you create symbolic variables. Hence, we're instantiating
them without the need to assign numerical values to them.

```matlab

% Instantiating symbols
syms a b c x

% Assign to an equation
y = a*x^2 + b*x + c;

```

*y* has the the `syms` type too.

Function Handles
----------------
Many functions receive another function as an input. For instance:

```matlab

fminsearch(fun, x0)

```

Which finds the minimum value of the *f*(*x*) provided.

This can be done by creating a function handle, which is a variable
that holds a reference to a function.

```matlab

fHandle = @(arg1, ...) FunctionDefinition

```

The `@` is used to create an anonymous function, provided the definition
fits on a single line.

```matlab

handle1 = @(x) x.^2
handle2 = @(t, y) sin(t) + y
handle3 = @(z) myFunction(z)

```

Back to `fminsearch` function, let's say we want to find the minimum
value of `cos(x)`, we use a handle like this:

```matlab

fHandle = @(x) cos(x);
res = fminsearch(fHandle, 3)

```







































