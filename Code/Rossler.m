%% Rossler System

% Parameters
a = 0.25;
b = 1;
c = 6;

% Lorenz equations
xp = @(x,y,z) -y-z;
yp = @(x,y,z) x + a*y;
zp = @(x,y,z) b + z*(x-c);

ic = [1; 1; 1];

% Change these to change the resolution and
% amount of trajectory plotted
dt = 0.005;
pathlength = 1000;

traj = zeros(3, floor(pathlength/dt));
traj(:,1) = ic;

for i = 2:length(traj)
        
    x = traj(1,i-1);
    y = traj(2,i-1);
    z = traj(3,i-1);
    
    % Forward Euler
%     x = x + xp(x,y,z)*dt;
%     y = y + yp(x,y,z)*dt;
%     z = z + zp(x,y,z)*dt;
    
    % RK4    
    xb = x + (1/2)*dt*xp(x,y,z);
    yb = y + (1/2)*dt*yp(x,y,z);
    zb = z + (1/2)*dt*zp(x,y,z);
    
    xc = x + (1/2)*dt*xp(xb,yb,zb);
    yc = y + (1/2)*dt*yp(xb,yb,zb);
    zc = z + (1/2)*dt*zp(xb,yb,zb);
    
    xd = x + dt*xp(xc,yc,zc);
    yd = y + dt*yp(xc,yc,zc);
    zd = z + dt*yp(xc,yc,zc);
    
    x = x + (dt/6)*(xp(x,y,z)+2*xp(xb,yb,zb)+2*xp(xc,yc,zc)+xp(xd,yd,zd));
    y = y + (dt/6)*(yp(x,y,z)+2*yp(xb,yb,zb)+2*yp(xc,yc,zc)+yp(xd,yd,zd));
    z = z + (dt/6)*(zp(x,y,z)+2*zp(xb,yb,zb)+2*zp(xc,yc,zc)+zp(xd,yd,zd));    
    
    traj(1,i) = x;
    traj(2,i) = y;
    traj(3,i) = z;
    
end


xs = traj(1,:);
ys = traj(2,:);
zs = traj(3,:);

plot3(xs,ys,zs);
xlabel('x');
ylabel('y');
zlabel('z');
title('Rossler System');