clc;
clf;

% Newtons method
f = @(x) exp(x) - x^2;
g = @(x) exp(x) - 2*x;
tol = 10^-5;
y = 2;
x = 0;
A = (y);
while abs(f(y)) > tol
    x = y;
    y = y - f(y)/g(y);
    A = [A y];
end

% Secant method
a = -1;
b = 0;
c = 0;
while abs(f(c)) > tol
    c = b - f(b)*(b - a)/(f(b) - f(a));
    a = b;
    b = c;
end

%{
Both method yeild the same answer
But in Newton's method, we require an extra function
Whereas in Secants method we use only eqution of line to find the next
point in iteration.

Newtons method converges faster that secants method.
%}