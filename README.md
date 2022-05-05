# Series-Hybrid-Dodge-Hellcat
The project performs a feasibility analysis of a series-hybrid powertrain for a conventional muscle car like the Dodge Challenger Hellcat. The hybrid powertrain is designed to match the performance characteristics of the conventional ICE powered Hellcat and is analysed for possible efficiency benefits. 

Targeted Performance Characteristics:
  0-60 mph acceleration time
  Top speed
  Torque (Maximum and curve)

Comparison Metric: Fuel Efficiency (Fuel consumption over a fixed drive cycle)

Components Modeled:
Supervisory Control: Dictates engine operation point
  ICE Engine: Calculates fuel consumption based on operating point
  Electric Motor: Simulates motor torque and power demands based on input throttle, while respecting traction limits and powertrain inefficiencies (motor & transmission)
  Battery: Computes State-of-Charge & Cell Temperature while respecting battery inefficiencies.

Furthermore, the project explores a State-of-Charge based control strategy for the IC Engine with the intent of reducing depth of discharge and thereby increasing overall battery life.
