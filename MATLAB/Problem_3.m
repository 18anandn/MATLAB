clc;

f = @(x,y) x + y;

x0 = 0;
y0 = 0;
h = 0.1;
n = 20;
y = zeros(1,n+1);
x = zeros(1,n+1);
x(1) = x0;
y(1) = y0;

% Adams–Bashforth Prediction method
for i = 1:3                                  % Some of the initial values are found using Runge–Kutta method of fourth order
    k1 = h*f(x(i), y(i));
    k2 = h*f(x(i) + h/2, y(i) + k1/2);
    k3 = h*f(x(i) + h/2, y(i) + k2/2);
    k4 = h*f(x(i) + h, y(i) + k3);
    y(i+1) = y(i) + (k1 + 2*k2 + 2*k3 + k4)/6;
    x(i+1) = x(i) + h;
end

for i = 4:n                        % Started calculating further y values using Adams–Bashforth Prediction formula
    f4 = f(x(i), y(i));
    f3 = f(x(i-1), y(i-1));
    f2 = f(x(i-2), y(i-2));
    f1 = f(x(i-3), y(i-3));
    y(i+1) = y(i) + (h/24)*((55*f4) - (59*f3) + (37*f2) - (9*f1));
    x(i+1) = x(i) + h;
end

% Adams–Moulton Correction method
yc = zeros(1,n+1);
yc(1) = y(1);      % Defined a separate array for storing corrected values
yc(2) = y(2);      % Here the initial values are the same as previous method
yc(3) = y(3);
yc(4) = y(4);

for i = 3:n-1
    f4 = f(x(i+1), yc(i+1));
    f3 = f(x(i), yc(i));
    f2 = f(x(i-1), yc(i-1));
    f1 = f(x(i-2), yc(i-2));
    yc(i+1) = y(i) + (h/24)*((9*f4) + (19*f3) - (5*f2) + f1);
    
    f4 = f(x(i+1), yc(i+1));   % The more accurate next predicted value is calculated using Adams–Bashforth Prediction formula
    f3 = f(x(i), yc(i));       
    f2 = f(x(i-1), yc(i-1));
    f1 = f(x(i-2), yc(i-2));
    yc(i+2) = yc(i+1) + (h/24)*((55*f4) - (59*f3) + (37*f2) - (9*f1)); % This value of y is used in the next step in correction formula
end

f4 = f(x(n+1), yc(n+1));
f3 = f(x(n), yc(n));
f2 = f(x(n-1), yc(n-1));
f1 = f(x(n-2), yc(n-2));
yc(n+1) = y(n) + (h/24)*((9*f4) + (19*f3) - (5*f2) + f1);

disp(strcat('The predicted value using Adams–Bashforth Prediction method is y(2) = ',num2str(y(n+1))));

disp(strcat('The predicted value using Adams–Moulton Correction method is y(2) = ',num2str(yc(n+1))));




