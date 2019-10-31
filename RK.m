function [b, error, cpu_time] = RK(X,y)
% Randomized Kaczmarz - solve linear system Xb = y for b
%
% Input: X, y
% Output: b
%
% Most recent change - 3/26/2015
%
%
% References:
% Strohmer, Thomas, and Roman Vershynin. 
% "A randomized Kaczmarz algorithm with exponential convergence." 
% Journal of Fourier Analysis and Applications 15.2 (2009): 262-278.
%
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

b = zeros(n,1);
error = zeros(maxiter,1);
cpu_time = zeros(maxiter,1);
bls = pinv(X'*X)*X'*y;

rnorm = sum(X'.^2);
fnorm = norm(X, 'fro')^2;

t = cputime;
for iter=1:maxiter
    
    i = randsample(1:m, 1, 'true', rnorm/fnorm);
    
    db = ((y(i)-X(i,:)*b)*X(i,:)/rnorm(i));
    b = b + db';
    
    error(iter) = norm(b-bls)^2;
    cpu_time(iter) = cputime-t;
    if(error(iter)<10^-6)
        display('Stopping criteria reached -- RK')
        return
    end
    
end


end