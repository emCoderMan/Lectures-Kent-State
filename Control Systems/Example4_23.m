% Lecture 5, Example 4_20
clc; clear all; close all;

num=1; % numerator of transfer function
den=[1 3 91 505]; % denominator of Transfer function
roots(den) % finds the roots of denominator (poles) of the system
CL_TF= tf(num,den) % "tf" creates transfer function from the numerator and denominator
figure (1);
pzmap(CL_TF) % "pzmap" plots the poles and zeros of a transfer function
axis ([-7 2 -15 15]); % changing the range of axes to better see the poles and zeros in the pz-map
den_new=[den 0] % the new denominator after multiplying the transfer function with the unit step input, 1/s
Y_step=poly2sym(num)./poly2sym(den_new); % "poly2sym" converts the polynomial expression to the symbolic experssion
y_step=ilaplace(Y_step) % "ilalplace" finds the inverse Laplace transform of the symbolic expression Y_step
ans=simplify (y_step); % simplifies the answer
pretty(ans)  % makes the answer nicer
figure (2);
fplot(ans, [0 60]); % plots a  symbolic function
t=xlabel('Time (s)'); ylabel ('step response y(t)'); % adds label to x and y axis

