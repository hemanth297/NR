% script <a href="matlab:TaylorTableTest">NR_TaylorTableTest</a>
% Test <a href="matlab:help TaylorTable">NR_TaylorTable</a> by constructing various differentiation formulae.
% Numerical Renaissance codebase, Chapter 8, https://github.com/tbewley/NR
% Copyright 2022 by Thomas Bewley, distributed under BSD 3-Clause License. 

disp('Now computing the BDF formulae (Table 10.3)'), w=1; format short
x=[0 -1];                [c]=NR_TaylorTable(x,w)'; d=-c(2:end)/c(1),     f=1/c(1)
x=[0 -1 -2];             [c]=NR_TaylorTable(x,w)'; d=-c(2:end)/c(1)*3,   f=1/c(1)*3
x=[0 -1 -2 -3];          [c]=NR_TaylorTable(x,w)'; d=-c(2:end)/c(1)*11,  f=1/c(1)*11
x=[0 -1 -2 -3 -4];       [c]=NR_TaylorTable(x,w)'; d=-c(2:end)/c(1)*25,  f=1/c(1)*25
x=[0 -1 -2 -3 -4 -5];    [c]=NR_TaylorTable(x,w)'; d=-c(2:end)/c(1)*137, f=1/c(1)*137
x=[0 -1 -2 -3 -4 -5 -6]; [c]=NR_TaylorTable(x,w)'; d=-c(2:end)/c(1)*147, f=1/c(1)*147

disp('Now computing the eBDF formulae (Table 10.4)'), w=1;
x=[1 0];                 [c]=NR_TaylorTable(x,w)'; d=-c(2:end)/c(1),     f=1/c(1)
x=[1 0 -1];              [c]=NR_TaylorTable(x,w)'; d=-c(2:end)/c(1),     f=1/c(1)
x=[1 0 -1 -2];           [c]=NR_TaylorTable(x,w)'; d=-c(2:end)/c(1),     f=1/c(1)
x=[1 0 -1 -2 -3];        [c]=NR_TaylorTable(x,w)'; d=-c(2:end)/c(1),     f=1/c(1)
x=[1 0 -1 -2 -3 -4];     [c]=NR_TaylorTable(x,w)'; d=-c(2:end)/c(1),     f=1/c(1)
x=[1 0 -1 -2 -3 -4 -5];  [c]=NR_TaylorTable(x,w)'; d=-c(2:end)/c(1),     f=1/c(1)

disp('Now computing the 2nd-order BDF formula for the 1st derivative using a stretched grid,')
disp('with (t_{k+1}-t_{k})=h1 and (t_k-t_{k-1})=h2'), w=1;
syms h1 h2 real
x=[0 -h1 -h1-h2];        [c]=NR_TaylorTable(x,w)';  d=-c(2:end)/c(1)*3,   f=1/c(1)*3

% end script NR_TaylorTableTest
