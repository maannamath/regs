function [b, error, cpu_time] = RGS(X,y)
% Randomized Gauss Siedel - solve linear system Xb = y for b
%
% Input: X, y
% Output: b
%
% Most recent change - 3/26/2015
%
% References:
% "Randomized extended kaczmarz for solving least squares." 
% Zouzias, Anastasios, and Nikolaos M. Freris. 
% SIAM Journal on Matrix Analysis and Applications 34.2 (2013): 773-793.
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

[~,n] = size(X);
maxiter = 10000;

cnorm = sum(X.^2);
fnorm = norm(X, 'fro')^2;

b = zeros(n,1);
error = zeros(maxiter,1);
cpu_time = zeros(maxiter,1);
bls = pinv(X'*X)*X'*y;

t = cputime;
for iter=1:maxiter
    j = randsample(1:n, 1, 'true', cnorm/fnorm);
    
    ej= zeros(n,1);
    ej(j)=1;
    
    db = (X(:,j)'*(y-X*b)/cnorm(j))*ej;
    b = b + db;
       
    error(iter) = norm(b-bls)^2;
    cpu_time(iter) = cputime-t;
    if(error(iter)<10^-6)
        display('Stopping criteria reached -- RGS')
        return
    end
    
end


end