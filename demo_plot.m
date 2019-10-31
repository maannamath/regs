% this function is used to plot for demos
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

X1 = median(cpu_rk');
[~, numIters1] = max(X1);
X2 = median(cpu_rgs');
[~, numIters2] = max(X2);
X3 = median(cpu_rek');
[~, numIters3] = max(X3);
X4 = median(cpu_regs');
[~, numIters4] = max(X4);

Y1 = median(error_rk');
Y2 = median(error_rgs');
Y3 = median(error_rek');
Y4 = median(error_regs');


% plotting cpu vs error
figure
subplot(1,2,2, 'YScale', 'log')
%axes('YScale', 'log')
set(gca,'FontSize', 14, 'FontWeight', 'bold')
axes('TickLabelInterpreter', 'latex')
hold on
if(error_rk(maxIter,1) == 0)
    plot(X1(1:numIters1), Y1(1:numIters1), 'r', 'LineWidth', 2, 'DisplayName', 'RK')
end
if(error_rgs(maxIter,1) == 0)
    plot(X2(1:numIters2), Y2(1:numIters2), 'g', 'LineWidth', 2, 'DisplayName', 'RGS')
end
if(error_rek(maxIter,1) == 0)
    plot(X3(1:numIters3), Y3(1:numIters3), 'b','LineWidth', 2, 'DisplayName', 'REK')
end    
if(error_regs(maxIter,1) == 0)
    plot(X4(1:numIters4), Y4(1:numIters4), 'm','LineWidth', 2, 'DisplayName', 'REGS')
end
title(strcat('Overdetermined, Consistent X: ', int2str(m), 'x', int2str(n)), 'FontSize', 16)
legend(gca, 'show')
ylabel('Distance to least norm solution', 'FontSize', 15)
xlabel('CPU Time', 'FontSize', 15)


% plotting iter vs error
subplot(1,2,1, 'YScale', 'log')
%axes('YScale', 'log', 'YScale', 'log')
set(gca,'FontSize', 14, 'FontWeight', 'bold')
hold on
if(error_rk(maxIter,1) == 0)
    plot(1:numIters1, Y1(1:numIters1), 'r', 'LineWidth', 2, 'DisplayName', 'RK')
end
if(error_rgs(maxIter,1) == 0)
    plot(1:numIters2, Y2(1:numIters2), 'g', 'LineWidth', 2, 'DisplayName', 'RGS')
end
if(error_rek(maxIter,1) == 0)
    plot(1:numIters3, Y3(1:numIters3), 'b','LineWidth', 2, 'DisplayName', 'REK')
end    
if(error_regs(maxIter,1) == 0)
    plot(1:numIters4, Y4(1:numIters4), 'm','LineWidth', 2, 'DisplayName', 'REGS')
end
title(strcat('Overdetermined, Consistent X: ', int2str(m), 'x', int2str(n)), 'FontSize', 16)
legend(gca, 'show')
ylabel('Distance to least norm solution', 'FontSize', 15)
xlabel('Iteration', 'FontSize', 15)
