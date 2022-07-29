function [A,V] = NR_Hessenberg(A)
% function [A,V] = NR_Hessenberg(A)
% Pre and post-multiply an nxn matrix A by a sequence of Householder reflections to reduce
% it to upper NR_Hessenberg form T_0, thus computing the unitary similarity transformation
% A=V T_0 V^H.  Uses ReflectCompute.m and Reflect.m from section 1.2.9 of NR.
% Numerical Renaissance Codebase 1.0, Chapter 4; see text for copyleft info.

[m,n]=size(A);  if nargout>1, V=eye(n,n); end 
for i=1:n-2
   [sig,w] = ReflectCompute(A(i+1:n,i));  A=Reflect(A,sig,w,i+1,n,1,n,'B');
   if nargout>1, V=Reflect(V,sig,w,i+1,n,1,n,'R'); end
end
end % function NR_Hessenberg
