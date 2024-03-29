model SimpleTwoModes
  model Single
    parameter Real a = 1.0;
    Real x (start = 1.0);
  equation
    der(x) = 2 * x + a;
  end Single;
  model HybridSingle
    parameter Real a = 1.0;
    Real x (start = 0.0);
  equation
    der(x) = x  - a;
  end HybridSingle;
structuralmode Single firstMode;
structuralmode HybridSingle secondMode;
equation
  initialStructuralState(firstMode);
  structuralTransition(firstMode, secondMode, time  >=  0.7);
end SimpleTwoModes;
