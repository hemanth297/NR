function [c,s] = NR_Rotate_Compute(f,g)
% function [c,s] = NR_Rotate_Compute(f,g)
% Compute the parameters {c,s} of a Givens rotation matrix designed to rotate
% the (possibly complex) vector (f;g) to (*;0).
% INPUT:  (f;g) =vector to be rotated
% OUTPUT: (c,s) =parameters of the rotation matrix sought
% NOTE:   This code works for both real and complex (f,g).
%         In the real case, c and s work out to be the cosine and sine of some angle.
%         For computational efficiency, however, this code avoids the computation of
%         trigonometric functions altogether.
% See also NR_Rotate. Verify with NR_Rotate_Test.
% Numerical Renaissance codebase, Chapter 1, https://github.com/tbewley/NR
% Copyright 2021 by Thomas Bewley, distributed under BSD 3-Clause License. 

gs=real(g)^2+imag(g)^2;
if gs==0, c=1; s=0; else, fs=real(f)^2+imag(f)^2;
  if fs>=gs, c=1/sqrt(1+gs/fs); s=-c*g/f;
  else,      s=1/sqrt(1+fs/gs); c=-s*f/g;  end
end
end % function NR_Rotate_Compute
