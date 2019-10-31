function [X, b, y] = create_ls(m, n, consis)
% This function creates different linear system settings
%
% Input:
%	m - number of rows
%	n - number of columns
%	consis - boolean indicating whether the system is inconsistent 
%		1 = consistent system
%		0 = inconsistent system
% Output:
%	X: 	mxn random gaussian matrix
%	b: 	nx1 random gaussian matrix
%	y: 	y = Xb for underconstrained and overconstrained consistent systems
%		y = Xb + r for overconstrained inconsistent systems where r \in null(X)
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

	X = randn(m,n);
	b = randn(n,1);

	% underconstrained system or consistent system
	if(m < n || consis)
		y = X*b;
	end

	% overconstrained inconsistent
	if(m >n && ~consis)
		A = null(X');
		r = A(:,1);
		y = X*b+r;
	end

end