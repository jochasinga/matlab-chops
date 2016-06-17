matlab-intro
============
Quick MATLAB intro for [Aerial Robotics Course on Coursera](https://www.coursera.org/learn/robotics-flight).

Jump To
-------
+ [Variables](#variables)
+ [Vectors](#creating-vectors)
+ [Functions](#functions)
+ [Vector Calculations](#vector-calculations)
+ [Matrices](#creating-matrices)

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















