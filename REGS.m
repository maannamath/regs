function [b, error, cpu_time] = REGS(X,y)
% Randomized Extended Gauss Seidel - solve linear system Xb = y for b
%
% Input: X, y
% Output: b
%
% Most recent change - 3/28/2015
%
% Copyright 2015, Anna Ma, Deanna Needell, Aaditya Ramdas
%
% This file is part of REGS Toolbox version 1.0.
%
%    REGS Toolbox is free software: you can redistribute it 
%    and/or modify it under the terms of the GNU General Public License as 
%    published by the Free Software Foundation, either version 3 of the 
%    License, or (at your option) any later version.
%
%    REGS Toolbox is distributed in the hope that it will be 
%    useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
%    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%    GNU General Public License for more details.
%
%    You should have received a copy of the GNU General Public License
%    along with REGS Toolbox. If not, 
%    see <http://www.gnu.org/licenses/>.
%

[m,n] = size(X);
maxiter = 10000;

cnorm = sum(X.^2);
rnorm = sum(X'.^2);
fnorm = norm(X, 'fro')^2;

b = zeros(n,1);
z = b;
error = zeros(maxiter,1);
cpu_time = zeros(maxiter,1);
bls = pinv(X'*X)*X'*y;

t = cputime;
for iter=1:maxiter
    i = randsample(1:n, 1, 'true', cnorm/fnorm);
    j = randsample(1:m, 1, 'true', rnorm/fnorm);
    
    ei = zeros(n,1);
    ei(i)=1;
    pk = (eye(n) - X(j,:)'*X(j,:)/rnorm(j));

    db = (X(:,i)'*(y - X*b)/cnorm(i))*ei;
    b = b + db;
    z = pk*(z+db);
    
    [norm(db) norm(b) norm(z) norm(b-z)]
    
    error(iter) = norm((b - z) - bls)^2;
    cpu_time(iter) = cputime-t;
    if(error(iter)<10^-6)
        display('Stopping criteria reached -- REGS')
        b = b - z;
        return
    end
    
end
    
    b = b - z;
end
