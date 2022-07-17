function X=RDE(X,F,S,Q,n,steps)
% function X=RDE(X,F,S,Q,n,steps)
% March the RDE X_{k-1} = F' X_k (I+ S X_k)^{-1} F + Q a given number of steps.
% Numerical Renaissance Codebase 1.0, Chapter 4; see text for copyleft info.

for iter=1:steps; X=F'*X*GaussPP(eye(n)+S*X,F,n)+Q; end
end % function DRE
