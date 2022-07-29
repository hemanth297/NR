function X=NR_DARE(F,S,Q)                               % Numerical Renaissance Codebase 1.0
% Finds the X that satisfies X = F' X (I+ S X)^{-1} F + Q, with Q>=0, S>=0, and |F|<>0. 
% Defining S=G R^{-1} G', we also assume (F,G) is stabilizable and (F,Q) is detectable.
n=size(F,1); FiH=(inv(F))'; [U,T]=NR_Schur([F+S*FiH*Q -S*FiH; -FiH*Q FiH]);
[U,T]=NR_ReorderSchur(U,T,'unitdisk');  X=U(n+1:2*n,1:n) / U(1:n,1:n);
end % function NR_DARE.m