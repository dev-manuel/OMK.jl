model BrakeSystem
 
    parameter Real mass = 1000;
    parameter Real radius = 0.3;
    parameter Real padArea = 0.005;
    parameter Real frictionCoeff = 0.4;
    parameter Real nominalHydraulicPressure = 1000000;
    parameter Real initialSpeed = 20;

    Real torque;
    Real brakingForce;
    Real vehicleSpeed(start = initialSpeed);
    Real x(start = 0);
    Real hydraulicPressure(start = 0);

    context
        engaged on time > 2.0;
    end context;
    
    equation on initial
        hydraulicPressure = 0;
        brakingForce = hydraulicPressure * padArea * frictionCoeff;
        torque = brakingForce * radius;
        der(x) = vehicleSpeed;
        der(vehicleSpeed) = -torque / (mass * radius);

    equation on engaged
        hydraulicPressure = nominalHydraulicPressure;
        brakingForce = hydraulicPressure * padArea * frictionCoeff;
        torque = brakingForce * radius;      
        der(x) = vehicleSpeed;
        
        if vehicleSpeed < 0 then
            der(vehicleSpeed)= 0;
        else
            der(vehicleSpeed) = -torque / (mass * radius);
        end if;  
        
end BrakeSystem;
