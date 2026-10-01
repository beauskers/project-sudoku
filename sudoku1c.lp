% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

{ sudoku(R, C, V) : V = 1..4 } = 1 :- R = 1..4, C = 1..4.
:- sudoku(R, C, V), sudoku(R, C', V), C != C'.
:- sudoku(R, C, V), sudoku(R', C, V), R != R'.

sudoku(R, C, V) :- initial(R, C, V).

subgrid(R, C, 1) :- R = 1..2, C = 1..2.
subgrid(R, C, 2) :- R = 1..2, C = 3..4.
subgrid(R, C, 3) :- R = 3..4, C = 1..2.
subgrid(R, C, 4) :- R = 3..4, C = 3..4.

:- sudoku(R, C, V), sudoku(R', C', V), subgrid(R, C, G), subgrid(R', C', G), R != R', C != C'.

#show sudoku/3.
