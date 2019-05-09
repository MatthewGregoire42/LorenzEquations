function X = RK4(x, y, z, xp, yp, zp, dt)
    % Calculates the next iteration in the Runge-Kutta 4 method
    % given an initial 3D point and the corresponding differential
    % equations and timestep. Returns a column vector of [x; y; z].
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
    
    X = [x y z];
end

