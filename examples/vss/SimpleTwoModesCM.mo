model SimpleTwoModes
    parameter Real a = 1.0;
    Real x (start = 1.0);
    
    context
        hybridSingle on time >= 0.7;
    end context;
    
    equation on initial
        der(x) = 2 * x + a;
        
    equation on hybridSingle
        der(x) = x - a;

end SimpleTwoModes;
