xp = @(x,y,z) y - 1;
yp = @(x,y,z) x^2 - y;
zp = @(x,y,z) 0;

ic = [-10; -10; 0];

% Change these to change the resolution and
% amount of trajectory plotted
dt = 0.005;
pathlength = 20;
numPaths = 40;
tolerance = 10;
step = 0.5;

hold on
for x_iteration = 0:numPaths
    ic(1) = ic(1) + step;
    ic(2) = -10;
    for iteration = 0:numPaths

        ic(2) = ic(2) + step;
        traj = zeros(3, floor(pathlength/dt));
        traj(:,1) = ic;

        for i = 2:length(traj)

            x = traj(1,i-1);
            y = traj(2,i-1);
            z = traj(3,i-1);

            % RK4    
            update = RK4(x,y,z,xp,yp,zp,dt); 

            traj(1,i) = update(1);
            traj(2,i) = update(2);
            traj(3,i) = update(3);

            if or(abs(update(1)) > tolerance, or(abs(update(2)) > tolerance, abs(update(3)) > tolerance))
                traj = traj(:,1:i-1);
                break
            end

        end
        xs = traj(1,:);
        ys = traj(2,:);
        zs = traj(3,:);

        plot(xs,ys);
    end
end
hold off