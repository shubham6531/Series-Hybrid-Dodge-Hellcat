# Series-Hybrid-Dodge-Hellcat
The project performs a feasibility analysis of a series-hybrid powertrain for a conventional muscle car like the Dodge Challenger Hellcat. The hybrid powertrain is designed to match the performance characteristics of the conventional ICE powered Hellcat and is analysed for possible efficiency benefits. 

Targeted Performance Characteristics:
1. 0-60 mph acceleration time
2. Top speed
3. Torque (Maximum and curve)

Comparison Metric: Fuel Efficiency (Fuel consumption over a fixed drive cycle)

Components Modeled:
1. Supervisory Control: Dictates engine operation point
2. ICE Engine: Calculates fuel consumption based on operating point
3. Electric Motor: Simulates motor torque and power demands based on input throttle, while respecting traction limits and powertrain inefficiencies (motor & transmission)
4. Battery: Computes State-of-Charge & Cell Temperature while respecting battery inefficiencies.
5. Longitudinal Vehicle Dynamics: Introduces road load into the simulation and computes vehicle speed based on generated torque.

Furthermore, the project explores a *State-of-Charge based control strategy* for the IC Engine with the intent of reducing depth of discharge and thereby increasing overall battery life.
