%% Lorenz System

% Parameters
s = 10;
r = 0;
b = 8/3;

% Lorenz equations
xp = @(x,y,z) s*(y-x);
yp = @(x,y,z) x*(r-z)-y;
zp = @(x,y,z) x*y - b*z;

% Change these to change the resolution and
% amount of trajectory plotted
dt = 0.005;
pathlength = 200;

ic = [0; 2; 0];

figure;
hold on
for j=1:2500
    
    r = r + 0.1;
    yp = @(x,y,z) x*(r-z)-y;
    
    traj = zeros(3, floor(pathlength/dt));
    traj(:,1) = ic;

    for i = 2:length(traj)
        x = traj(1,i-1);
        y = traj(2,i-1);
        z = traj(3,i-1);
        % RK4    
        update = RK4(x,y,z,xp,yp,zp,dt); 
        traj(:,i) = update;
    end
    
    xs = traj(1,39501:40000);
    rs = ones(1,500)*r;
    
    plot(rs,xs,'.','MarkerSize',2,'Color',[0.2,0.2,0.2]);
    drawnow
    
end
hold off