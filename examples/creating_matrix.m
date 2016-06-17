% Creating a matrix
% Use a mixture of row and column vector tricks
% M = [
%    1  2  3
%    4  5  6
%    7  8  9
%]
M = [1, 2, 3; 4, 5, 6; 7, 8, 9]

% Matrix multiplication
% What happens here is scalar 2 is expanded
% into a matrix of the same size -->
% [2, 2, 2; 2, 2, 2; 2, 2, 2]
m = M * 2

% A matrix's width should equals to another
% matrix's height in order to calculate.
% This one gives an error: Inner matrix
% dimensions must agree.
% M * [1, 2; 3, 3]

% This one is ok because it's 3 x 2
% while M is 3 x 3.
% https://www.youtube.com/watch?v=ooGBmqU6TVg&feature=youtu.be
M * [1, 1; 2, 3; 0, 0]
