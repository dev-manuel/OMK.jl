model SinkingObject
    parameter Real m = 1000; 
    parameter Real k = 0.05; 
    parameter Real g = 9.81; 
    parameter Real alpha = (20 * 3.14 / 180); 
    parameter Real v = 3;
    parameter Real waterDensity = 1000;

    Real s; 
    Real ds; 
    Real x;
    Real y(start=20.0);
    Real R; 
    Real vx (start = 5.0); 
    Real vy;

    context
        initial on time < 6.4;
        sinking on 6.5 < time and time < 8.4;
        stopped on time > 8.5;
    end context;

    equation on initial
        der(x) = vx;
        der(y) = vy;
        der(s)= ds; 
        R = -k * m * g * cos(alpha); 
        der(ds) * m = R + m * g * sin(alpha); 
        x = s * cos(alpha);
        y = -s * sin(alpha);

    equation on sinking
        der(x) = 0;
        der(y) = (((m * g) - ((waterDensity * g) * v)) / m);
        der(s) = 0;
        der(ds) = 0;

    equation on stopped
        der(y) = 0;
        der(x) = 0;
        der(s) = 0;
        der(ds) = 0;
end SinkingObject;
