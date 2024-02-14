model Boiler
  parameter Real volume = 0.05;
  parameter Real density = 1000;
  parameter Real heatingPower = 4000;
  parameter Real heatCapacity = 4186;
  parameter Real desiredT = 313.15;
  parameter Real initialT = 293.15;

  Real temperature(start = initialT, fixed = true);
  Real mass;

equation
  mass = density * volume;

  if temperature >= desiredT then
    der(temperature) = 0;
  else
    der(temperature) = heatingPower / (mass * heatCapacity);
  end if;

end Boiler;
