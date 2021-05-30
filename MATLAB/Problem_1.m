% Euler's method
clc;


f = @(x,y) y - y^2;     % Given differential equation

x0 = 0;
y0 = 0.2;               % Initial values

h = 0.1;                % Increment
n = 10;                 % Number of steps

y = zeros(1,n+1);       % Initialized array to store values of y
y(1) = y0;
xi = x0;

for i = 1:10
    y(i+1) = y(i) + h*f(xi, y(i));
    xi = xi + h;
end
disp(strcat('Required value using Eulers method y(1) =', num2str(y(n+1))));

% Improved Euler's method
y = zeros(1,n+1);
y(1) = y0;
xi = x0;

for i = 1:10
    fi = f(xi, y(i));
    xi = xi + h;
    y(i+1) = y(i) + 0.5*h*(fi + f(xi, y(i) + h*fi));
end

disp(strcat('Required value using improved Eulers method y(1) =', num2str(y(n+1))));
