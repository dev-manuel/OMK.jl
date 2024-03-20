model Satellite
    parameter Real G=6.67430e-11;
    parameter Real M=5.972e24;
    parameter Real R=6.371e6;
    parameter Real pi=3.14;
    parameter Real initialRocketMass= 200000; 
    parameter Real burnRate=250;
    parameter Real thrust=3400*10^3;
    parameter Real burnTime=500;
    Real mass(start=initialRocketMass, fixed=true);
    Real altitude(start=0);
    Real s(start=0);
    Real rocketVelocity(start=0);
    Real orbitalVelocity(start=0); 
    Real orbitalPeriod(start=0);

    context
        orbit on time >= 500;
    end context;

    equation on initial
        der(altitude) = rocketVelocity;
        der(s) = rocketVelocity;
        der(mass) = (-burnRate);
        der(rocketVelocity) = ((thrust / mass) - ((G * M) / ((R + altitude) ^ 2)));

    equation on orbit
        orbitalVelocity = sqrt(((G * M) / (R + altitude)));
        orbitalPeriod = (2 * pi * (R + altitude)) / orbitalVelocity;
        der(s) = orbitalVelocity;
        der(altitude) = 0;
        der(mass) = 0;
        der(rocketVelocity) = 0;
    
    equation
        when time >= 500.1 then
          reinit(mass, pre(mass) - 500);
        end when;
end Satellite;
