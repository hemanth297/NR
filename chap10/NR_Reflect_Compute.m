function [sig,w] = NR_Reflect_Compute(x)
% function [sig,w] = NR_Reflect_Compute(x)
% Compute the parameters {sig,w} of a Householder reflection matrix designed to reflect
% the (possibly complex) vector x to the direction (*;0;0;...;0).
% INPUT:  x      =vector to be rotated
% OUTPUT: {sig,w}=parameters of the relection matrix sought
% NOTE:   This code uses the Householder reflections formulation that works for both real and complex x.
%         It does NOT reduce to the "simple and logical" case, with sig=2, in the real case.
% See also NR_Reflect. Verify with NR_Reflect_Test.
% Numerical Renaissance codebase, Chapter 1, https://github.com/tbewley/NR
% Copyright 2021 by Thomas Bewley, distributed under BSD 3-Clause License. 

if real(x(1))<0, s=-1; else, s=1; end, nu=s*norm(x);   % (1.8b)
if nu==0, sig=0; w=0;  else, sig=(x(1)+nu)/nu; w=[x(1)+nu; x(2:end)]/(x(1)+nu); end
end % function NR_Reflect_Compute
