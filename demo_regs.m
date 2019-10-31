%% Demonstration of RK, REK, RGS, REGS for different types of systems
%
% Most recent change - 3/26/2015
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


%% Initalize
clear all; close all;
maxIter = 10000;
numTrials = 50;
m = 50;
n = 500;

error_rk = zeros(maxIter,50);
error_rgs = zeros(maxIter,50);
error_rek = zeros(maxIter,50);
error_regs = zeros(maxIter,50);

cpu_rk = zeros(maxIter,50);
cpu_rgs = zeros(maxIter,50);
cpu_rek = zeros(maxIter,50);
cpu_regs = zeros(maxIter,50);

% Set up system
[X,b,y] = create_ls(m,n);

% running trials
for trial=1:numTrials
    disp(['Beginning trial ' num2str(iter)])
    [~, error_rk(:,trial), cpu_rk(:,trial)] = RK(X,y);
    [~, error_rgs(:,trial), cpu_rgs(:,trial)] = RGS(X,y);
    [~, error_rek(:,trial), cpu_rek(:,trial)] = REK(X,y);
    [~, error_regs(:,trial), cpu_regs(:,trial)] = REGS(X,y);
end

% plotting
demo_plot











