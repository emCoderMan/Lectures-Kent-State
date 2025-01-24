% Example 4.15
% It's usually a good idea to start a MATLAB program with closing all previous open figures (close all),
% clearing all previous variables (clear all),
% and clearing the MATLAB command window (clc).

close all; clear all; clc;
num= [4.7 41.9 130]; % define the numerator vector: 4.7S^2 + 41.9s+ 130
den= [1 4 69 130];  % define the denominator vector: s^3+ 4s^2 + 69s+ 130
den_roots=roots(den) % find the roots of the denominator or poles of the system
num_new = 200.*num; % the new numerator after multiplying the transfer function with the input, whcih is the step function 200/s
den_new = conv([1 0],den); % the new denominator after multiplying the transfer function with the input, whcih is 200/s
Y=(poly2sym(num_new))./(poly2sym(den_new)) % "poly2sym" converts the polynomial expression to the symbolic experssion
y=ilaplace(Y); % "ilalplace" finds the inverse Laplace transform of the symbolic expression Y
ans=simplify (y); % simplify the laplace transform
pretty(ans)  % make the Laplace transform nicer
fplot(ans, [0 10]); % plot the gas temperature with respect to time (t) for the first 10 minutes
xlabel('Time (min)'); ylabel (' Gas Temperature (\circC)'); % adds label to x and y axis
