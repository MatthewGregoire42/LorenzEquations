%% Forward Euler

y0  = 1;
x0  = 0;
N   = 50;
yp  = @(t) -3*t; % y prime
min = 0;
max = 5;
h   = (max-min)/N;

realy = @(x) exp(-3*x);

x    = min:h:(max-h);
y    = zeros(1, N);
y(1) = y0;

for i = 2:N
    y(i) = yp(y(i-1))*h + y(i-1);
end

hold on
plot(x,y);
plot(x,realy(x));
legend('FE', 'Actual');
hold off

%% Backward Euler

y0  = 1;
x0  = 0;
N   = 50;
yp  = @(t) -3*t;
min = 0;
max = 5;
h   = (max-min)/N;

realy = @(x) exp(-3*x);

x    = min:h:(max-h);
y    = zeros(1, N);
y(1) = y0;

for i = 2:N
    % Use F.E. to calculate y(i), then use that in calculation of y(i).
    y(i) = yp(yp(y(i-1))*h + y(i-1))*h + y(i-1);
end

hold on
plot(x,y);
plot(x,realy(x));
legend('BE', 'Actual');
hold off

%% RK2

y0  = 1;
x0  = 0;
N   = 50;
yp  = @(y) -3*y;
min = 0;
max = 5;
h   = (max-min)/N;

realy = @(x) exp(-3*x);

x    = min:h:(max-h);
y    = zeros(1, N);
y(1) = y0;

for i = 2:N
    a = y(i-1) + (1/2)*h*yp(y(i-1));
    y(i) = y(i-1) + h*yp(a);
end

hold on
plot(x,y);
plot(x,realy(x));
legend('RK2', 'Actual');
hold off


%% RK4

y0  = 1;
x0  = 0;
N   = 50;
yp  = @(y) -3*y;
min = 0;
max = 5;
h   = (max-min)/N;

realy = @(x) exp(-3*x);

x    = min:h:(max-h);
y    = zeros(1, N);
y(1) = y0;

for i = 2:N
    a = y(i-1);
    b = y(i-1) + (1/2)*h*yp(a);
    c = y(i-1) + (1/2)*h*yp(b);
    d = y(i-1) + h*yp(c);
    y(i) = y(i-1) + (h/6)*(yp(a)+2*yp(b)+2*yp(c)+yp(d));
end

hold on
plot(x,y);
plot(x,realy(x));
legend('RK4', 'Actual');
hold off


%% AB2

y0  = 1;
x0  = 0;
N   = 50;
yp  = @(y) -3*y;
min = 0;
max = 5;
h   = (max-min)/N;

realy = @(x) exp(-3*x);

x    = min:h:(max-h);
y    = zeros(1, N);
y(1) = y0;

y(2) = y(1) + h*yp(y(1));

for i = 3:N
    y(i) = y(i-1) + (h/2)*(-yp(y(i-2)) + 3*yp(y(i-1)));
end

hold on
plot(x,y);
plot(x,realy(x));
legend('AB2', 'Actual');
hold off