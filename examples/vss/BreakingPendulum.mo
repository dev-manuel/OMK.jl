model FreeFall
    Real x;
    Real y;
    Real vx;
    Real vy;
    parameter Real g = 9.81;
    parameter Real vx0 = 0.0;
    
    equation
        der(x) = vx;
        der(y) = vy;
        der(vx) = vx0;
        der(vy) = -g;
end FreeFall;

model Pendulum
    parameter Real x0 = 10;
    parameter Real y0 = 10;
    parameter Real g = 9.81;
    parameter Real L = sqrt(x0^2 + y0^2);

    Real x(start = x0);
    Real y(start = y0);
    Real vx;
    Real vy;
    Real phi(start = 1.0, fixed = true);
    Real phid;
    
    equation
        der(phi) = phid;
        der(x) = vx;
        der(y) = vy;
        x = L * sin(phi);
        y = -L * cos(phi);
        der(phid) = -g / L * sin(phi);
end Pendulum;

model BreakingPendulum
    structuralmode Pendulum pendulum;
    structuralmode FreeFall freeFall;
    
    equation
        initialStructuralState(pendulum);
        structuralTransition(pendulum, freeFall, time - 5.0 <= 0);
end BreakingPendulum;
