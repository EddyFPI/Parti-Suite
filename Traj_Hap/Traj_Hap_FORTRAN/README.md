# Parti-Suite Trajectory Codes Descriptions  
### TRAJ-HAP, TRAJ-JET, and TRAJ-PAR

**Authors**  
William P. Johnson  
Eddy Pazmiño  

**Emails**  
- william.johnson@utah.edu  
- eddy.pazmino@epn.edu.ec

## Abstract

Describes:  
a) Input parameters  
b) Output files for fluxes and trajectories  
c) Time step and other transport parameters

## Summary

Mechanistic pore scale Lagrangian trajectory simulations using full force and torque balance on particles in the respective flow fields and collector geometries are provided in Traj-Hap (Happel sphere-in-cell), Traj-Jet (impinging jet) and Traj-Par (parallel plate).

Detailed descriptions of the force and torque balance are provided in a free book at the Groundwater Project by Johnson & Pazmino 2023 [Colloid (Nano- and Micro-Particle) Transport and Surface Interaction in Groundwater](https://gw-project.org/books/colloid-nano-and-micro-particle-transport-and-surface-interaction-in-groundwater/)
. This book provides a comprehensive overview of colloid and nanoparticle transport in groundwater systems. It covers fundamental concepts of colloid filtration theory (CFT), surface interactions (DLVO and extended DLVO), the role of nanoscale heterogeneity, and upscaling approaches for predicting breakthrough and retention in porous media.

This work is also described in W.P. Johnson Research Group publications (http://www.wpjohnsongroup.utah.edu/; or https://scholar.google.com/citations?user=C9gB_GgAAAAJ&hl=en&authuser=1), see in particular Pazmino et al. (2014), Trauscht et al., (2014), Ron et al., (2019), Rasmuson et al., (2019), and VanNess et al. (2019), and references therein.

The pore-scale Lagrangian trajectory simulations were originally written in Fortran, from which the codes were parallelized to allow simulation of simultaneous trajectories, since any given trajectory may require upwards of hundreds of trillions of time steps.

The software is herein provided as ported MatLab executables for clear visualization of trajectory simulations of colloid populations numbering in the tens to hundreds depending on simulation parameters (which define computational intensity). At a minimum the Matlab codes provide visualization and teaching opportunities. Once the user has understood the Matlab executables, we encourage use of the Fortran executables, which allow simulation of populations of hundreds to thousands (depending on simulation conditions).

To facilitate parallelized simulation of larger particle populations (thousands to tens of thousands) we intend to provide Python-based easily parallelized software in the near future (hopefully early 2020), but we are also willing to collaborate on Fortran-based parallel simulations on our platform for interested users. For simulations not reasonably attainable via the Matlab or Fortran executables, please feel free to contact us with requests for parallelized simulations.

The codes can be run in “contact” versus “perfect sink” modes:

- **Perfect sink:** particle is arrested when separation distance < 1 nm
- **Contact mode:** torque balance determines arrest when resisting torque exceeds driving torque within contact distances

Contact (where contact mechanics applies) is defined as separation distances within which the combined near surface forces (absolute values of steric, Lewis acid-base, and Born) exceed 0.01% of their values at equilibrium separation distance in vacuum (~0.0158 nm). Contact distances range from <1 to several nm depending on steric and Lewis acid-base forces. Diffusion is not considered in the force and torque balance when contact mechanics applies. Perfect sink mode arrests the colloid once separation distance falls below the defined contact threshold.

The code provides graphical progress during the simulation, as shown for Traj-Hap, below for two trajectories during transport in the near-surface (top) and contact (bottom):
