model PowerSource
    discrete Real clockTime;
    Real outputPower;
    Real remainingPower;

    Battery battery;
    SolarPanel solar;
    Consumer consumer;

    context
      initial on 17.9 < clockTime;
      day on clockTime < 18 and 5.9 < clockTime;
    end context;

    equation on initial
           consumer.inputPower = outputPower;
           outputPower = battery.U * (battery.U / battery.R);
           remainingPower = outputPower - consumer.consumption;

    equation on day
        consumer.inputPower = outputPower;
        outputPower = solar.P;
        remainingPower = outputPower - consumer.consumption;
        
    equation
        when sample(0.0, 1.0) then
          clockTime = mod(clockTime + 1, 24);
        end when;
        


end PowerSource;