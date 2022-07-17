function Response(A,B,C,D,type,g)
% function Response(A,B,C,D,type,g)
% Using the CN method, plot the P components of the response y_1,...,y_P (in each of the P
% rows of subplots) of a MIMO linear system to an input which is zero in all but the m'th
% component (for m=1,...,M, in each of the M columns of subplots), where the nonzero u_m
% takes the form of an impulse (type=0), step (type=1), or polynomial t^type (type>=2).
% The derived type g groups together various convenient plotting parameters: p.T is the
% interval over which the response is plotted, and g.linestyle is the linestyle used.
% See <a href="matlab:NRweb">Numerical Renaissance: simulation, optimization, & control</a>, Section 10.1.
% Part of <a href="matlab:help NRC">Numerical Renaissance Codebase 1.0</a>, <a href="matlab:help NRchap10">Chapter 10</a>; please read the <a href="matlab:help NRcopyleft">copyleft</a>.
% Depends on <a href="matlab:help Gauss">Gauss</a>, <a href="matlab:help GaussLU">GaussLU</a>.  Verify with: <a href="matlab:help ResponseTest">ResponseTest</a>.

N=length(A); M=size(B,2); P=size(C,1); x=zeros(N,1); km=1000; h=g.T/km; t=[0:km]*h;
switch type, case 0, u=[2/h, zeros(1,km)]; case 1, u=ones(1,km+1); otherwise, u=t.^w; end
for m=1:M
  Ap=eye(N)+A*h/2; Am=eye(N)-A*h/2; Bs=B(:,m)*h/2;
  [x(:,2),Amod]=Gauss(Am,Ap*x(:,1)+Bs*(u(2)+u(1)),N);
  for k=3:km+1, [x(:,k)]=GaussLU(Amod,Ap*x(:,k-1)+Bs*(u(k)+u(k-1)),N); end
  for p=1:P, subplot(P,M,m+p*P-P), plot(t,C(p,:)*x(:,[0:km]+1)+D(p,m)*u,g.linestyle), end
end
end % function Response
