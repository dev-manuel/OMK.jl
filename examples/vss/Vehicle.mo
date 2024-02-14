model Vehicle
    parameter Real m = 1000; 
    parameter Real k = 0.05; 
    parameter Real g = 9.81; 
    parameter Real v0 = 10;
    parameter Real alpha = (20 * 3.14 / 180); 
    
    Real s; 
    Real ds; 
    Real x;
    Real y(start=20.0);
    Real R; 
    Real vx (start = 5.0); 
    Real vy;

    context
        downhill on time >= 0.5;
    end context;

    equation on initial
        der(x) = vx;
        der(y) = 0;
        der(vx) = v0;
        vy = 0;
        ds = vx;
        der(s) = ds;
        R = 0;

    equation on downhill
        der(x) = vx;
        der(y) = vy;
        der(s) = ds;
        R = (-(((k  * m) * g) * cos(alpha)));
        (der(ds) * m) = (R + ((m * g) * sin(alpha)));
        x = (s * cos(alpha));
        y = (-(s * sin(alpha)));
end Vehicle;
