clc;

a = 1;
b = 5;
n = 4;
h = (b-a)/n;

f = @(x) (x^3) + 5*(x^2) + 1;     % Given functio
f2 = @(x) 6*x + 10;               % Second derivative of given function

T1 = zeros(1,n+1);        % Array to store errors in Trapezoidal rule
X1 = zeros(1,n+1);
x = a;
It1 = 0;
for i = 1:n
    It1 = It1 + (f(x) + f(x+h))*(h/2);
    T1(i) = f2(x)*((b-a)^3)/(12*(n^2));  % Error calculation
    X1(i) = x;
    x = x + h;
end



X1(n+1) = x;
T1(n+1) = f2(x)*((b-a)^3)/(12*(n^2));

n = 8;
h = (b-a)/n;

T2 = zeros(1,n+1);
X2 = zeros(1,n+1);
x = a;
It2 = 0;
for i = 1:n
    It2 = It2 + (f(x) + f(x+h))*(h/2);
    T2(i) = f2(x)*((b-a)^3)/(12*(n^2));
    X2(i) = x;
    x = x + h;
end

X2(n+1) = x;
T2(n+1) = f2(x)*((b-a)^3)/(12*(n^2));
clf;
plot(X1,T1);
hold on;
plot(X2,T2);
legend('4 sub-intervals','8 sub-intervals');

disp(strcat('Value of given integration with 4 subintervals = ',num2str(It1)));

disp(strcat('Value of given integration with 8 subintervals = ',num2str(It2)));