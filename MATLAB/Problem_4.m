clc;

a = 1;
b = 5;
n = 9;
h = (b-a)/n;

f = @(x) sqrt(1 + (x^2));                   % Given function
f2 = @(x) 1/((f(x))^3);                     % Second derivative of given function
f4 = @(x) (-3)*(1 - (4*(x^2)))/((f(x))^7);  % Fourth derivative of given function

T = zeros(1,n+1);    % Array to store errors in Trapezoidal rule
S = zeros(1,n+1);    % Array to store errors in Simpson's rule

X = zeros(1,n+1);

It = 0;
x = a;

% Trapeziodal Rule
for i = 1:n
    It = It + (f(x) + f(x+h))*(h/2);
    T(i) = f2(x)*((b-a)^3)/(12*(n^2));
    X(i) = x;
    x = x + h;
end
T(n+1) = f2(x)*((b-a)^3)/(12*(n^2));
X(n+1) = x;

x = a;
h = (b-a)/(2*n);
Is = 0;

% Simpson's rule
for i = 1:n
    Is = Is + (h/3)*(f(x) + 4*f(x + h) + f(x+2*h));
    S(i) = f4(x)*((b-a)^5)/(180*(n^4));
    x = x + (2*h);
end

S(n+1) = f4(x)*((b-a)^5)/(180*(n^4));
clf;
plot(X,T);
hold on;
plot(X,S);
legend('Trapezodal Rule', 'Simpsons Rule');

disp(strcat('Value of given integration using Trapezoidal rule = ',num2str(It)));

disp(strcat('Value of given integration using Simpsons rule = ',num2str(Is)));







