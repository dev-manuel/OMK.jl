model Boiler
    parameter Real volume = 0.05;
    parameter Real density = 1000;
    parameter Real heatingPower = 4000;
    parameter Real heatCapacity = 4186;
    parameter Real desiredT = 313.15;
    parameter Real initialT = 293.15;

    Real temperature(start = initialT, fixed = true);
    Real mass;

    context 
        heatingoff on temperature >= 313.15;
    end context;

    equation on initial
        mass = density * volume;
        der(temperature) = heatingPower / (mass * heatCapacity);

    equation on heatingoff
        mass = density * volume;
        der(temperature) = 0;

end Boiler;
