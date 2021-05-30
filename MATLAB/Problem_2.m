% Runge–Kutta method of fourth order
clc;

f = @(x,y) sin(2*x) - y*tan(x);   % Given differential equation

x0 = 0;
y0 = 1;        % Initial values       % Number of steps

y = zeros(1,n+1);       % Initialized array to store values of y
y(1) = y0;
xi = x0;

h = 0.2;
n = 5; 

for i = 1:n
    k1 = h*f(xi,y(i));
    k2 = h*f(xi + h/2, y(i) + k1/2);
    k3 = h*f(xi + h/2, y(i) + k2/2);
    k4 = h*f(xi + h, y(i) + k3);
    y(i+1) = y(i) + (k1 + 2*k2 + 2*k3 + k4)/6; % Found the average slope and calculated the next y
    xi = xi + h;
end

disp(strcat('With h = 0.1, y(1) = ',num2str(y(n+1))));

h = 0.1;
xi = x0;
n = 10; 


for i = 1:n
    k1 = h*f(xi,y(i));
    k2 = h*f(xi + h/2, y(i) + k1/2);
    k3 = h*f(xi + h/2, y(i) + k2/2);
    k4 = h*f(xi + h, y(i) + k3);
    y(i+1) = y(i) + (k1 + 2*k2 + 2*k3 + k4)/6;
    xi = xi + h;
end

disp(strcat('With h = 0.2, y(1) = ',num2str(y(n+1))));