matlab-intro
============
Quick MATLAB intro for [Aerial Robotics Course on Coursera](https://www.coursera.org/learn/robotics-flight).

Jump To
-------
+ [Variables](#variables)
+ [Creating Vectors](#creating-vectors)
+ [Functions](#functions)

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









