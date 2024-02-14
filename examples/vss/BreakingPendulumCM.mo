model BreakingPendulum

    parameter Real x0 = 10;
    parameter Real y0 = 10;
    parameter Real g = 9.81;
    parameter Real vx0 = 0.0;
    parameter Real L = sqrt(x0^2 + y0^2);
    Real x (start = x0);
    Real y (start = y0);
    Real vx;
    Real vy;
    Real phi (start = 1.0, fixed = true);
    Real phid;
    
    context
        freeFallMode on time - 5.0 <= 0;
    end context;

    equation on initial
        der(x) = vx;
        der(y) = vy;
        x = L * sin(phi);
        y = -L * cos(phi);
        der(phid) = -g / L * sin(phi);
        der(phi) = phid;

    equation on freeFallMode
        der(x) = vx;
        der(y) = vy;
        der(vx) = vx0;
        der(vy) = -g;
        
end BreakingPendulum;