%% Van der Pol System

% Parameters
m = 0;

% Reduced order Van Der Pol equations
xp = @(x,y) y;
yp = @(x,y) m*(1-(x^2))*y - x;

% Initial condition
ic = [1; 1];

% Change these to change the resolution and
% amount of trajectory plotted
dt = 0.001;
pathlength = 25;

traj = zeros(2, floor(pathlength/dt));
traj(:,1) = ic;

for i = 2:length(traj)
        
    x = traj(1,i-1);
    y = traj(2,i-1);
    
    % Forward Euler
%     x = x + xp(x,y)*dt;
%     y = y + yp(x,y)*dt;
    
    % RK4    
    xb = x + (1/2)*dt*xp(x,y);
    yb = y + (1/2)*dt*yp(x,y);
    
    xc = x + (1/2)*dt*xp(xb,yb);
    yc = y + (1/2)*dt*yp(xb,yb);
    
    xd = x + dt*xp(xc,yc);
    yd = y + dt*yp(xc,yc);
    
    x = x + (dt/6)*(xp(x,y)+2*xp(xb,yb)+2*xp(xc,yc)+xp(xd,yd));
    y = y + (dt/6)*(yp(x,y)+2*yp(xb,yb)+2*yp(xc,yc)+yp(xd,yd));
    
    traj(1,i) = x;
    traj(2,i) = y;
    
end


xs = traj(1,:);
ys = traj(2,:);

plot(xs,ys);
xlabel('x');
ylabel('y');
title('Van der Pol System');