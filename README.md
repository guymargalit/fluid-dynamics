Compuational Fluid Dynamics
===========================

This repository contains three MATLAB functions used to plot Coefficient of Lift versus Angle of Attack and Coefficient of Drag versus Coefficient of Lift for the NACA 0012 and NACA 4412. ANSYS Fluent was used to generate data with the Reynolds Averaged Navier-Stokes model and then compared to Thin Airfoil Theory, Vortex Panel Method, and experimental data from NASA.

1.  Experimental data for the NACA 0012 can be found here: turb-models.larc.nasa.gov/naca0012_val.html

2.  Experimental data for the NACA 4412 can be found here: ntrs.nasa.gov/search.jsp?R=19930091638

Usage
-----
Run the main.m file to produce plots with comparisons between the Fluent RANS model and the other methods. NACA_Airfoil.m and Vortex_Panel.m are used for the Vortex Panel method to construct panels for the corresponding airfoil and determine the coefficient of lift.

In order to use NACA_Airfoil.m, input the maximum camber, location of maximum camber, thickness, chord length, and the number of panels. The output will give the x and y locations of the airfoil and can be plotted to see the geometry of the airfoil. An example of usage can be found in the main.m file as well.

Vortex_Panel.m requires the x and y locations of the airfoil, a freestream velocity, and an angle of attack to be inputted. The coefficient of pressure, sectional coefficient of lift and upper coefficient of lift will be outputted. An example of usage can also be found in the main.m file.
