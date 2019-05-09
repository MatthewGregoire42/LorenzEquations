%% Lorenz System

% Parameters
s = 10;
r = 24;
b = 8/3;

% Lorenz equations
xp = @(x,y,z) s*(y-x);
yp = @(x,y,z) x*(r-z)-y;
zp = @(x,y,z) x*y - b*z;

ic = [0; 2; 0];
% Slightly different initial condition
icp = [0; 2.001; 0]; %

% Change these to change the resolution and
% amount of trajectory plotted
dt = 0.005;
pathlength = 40;

traj = zeros(3, floor(pathlength/dt));
traj(:,1) = ic;

trajp = zeros(3, floor(pathlength/dt)); %
trajp(:,1) = icp;                       %

for i = 2:length(traj)
        
    x = traj(1,i-1);
    y = traj(2,i-1);
    z = traj(3,i-1);
    
    xa = trajp(1, i-1); %
    ya = trajp(2, i-1); %
    za = trajp(3, i-1); %
    
    % RK4    
    update = RK4(x,y,z,xp,yp,zp,dt); 
    
    updatep = RK4(xa,ya,za,xp,yp,zp,dt); %
    
    traj(1,i) = update(1);
    traj(2,i) = update(2);
    traj(3,i) = update(3);
    
    trajp(1,i) = updatep(1); %
    trajp(2,i) = updatep(2); %
    trajp(3,i) = updatep(3); %
    
end

ts = zeros(1, floor(pathlength/dt)); %
for i = 2:length(ts)                 %
    ts(i) = (i-1)*dt;                %
end                                  %

xs = traj(1,:);
ys = traj(2,:);
zs = traj(3,:);

xps = trajp(1,:); %
yps = trajp(2,:); %
zps = trajp(3,:); %

diffs = zeros(1,length(ts));
for i = 1:length(diffs)
    diffs(i) = abs(xs(i) - xps(i));
end

% Plot showing sensitive dependence on initial conditions
% hold on
% plot(ts, xs);
% plot(ts, xps);
% xlabel('t');
% ylabel('x');
% legend('IC = (0, 2, 0)', 'IC = (0, 2.001, 0)');
% title('x(t) for two nearby initial conditions');
% hold off

% semilogy(ts, diffs)

hold on
plot3(xs,ys,zs);
plot3(ic(1), ic(2), ic(3), 'p');
% plot(xs, zs);
xlabel('x');
ylabel('y');
zlabel('z');
% title('Lorenz System (s=10, r=20, b=8/3)');
hold off