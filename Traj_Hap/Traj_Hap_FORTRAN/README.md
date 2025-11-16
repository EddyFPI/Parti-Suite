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

Detailed descriptions of the force and torque balance are provided in a free book at the Groundwater Project by Johnson & Pazmino (2023) [Colloid (Nano- and Micro-Particle) Transport and Surface Interaction in Groundwater](https://gw-project.org/books/colloid-nano-and-micro-particle-transport-and-surface-interaction-in-groundwater/)
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


The current versions of the trajectory codes place nanoscale heterogeneity on the collector rather than colloid surfaces, for reasons described in our publications. We anticipate distributing versions that allow placement of nanoscale heterogeneity on colloids (Summer 2019).

An important consideration is that colloids may attach at the rear flow stagnation point (RFSP). When heterogeneity is generated, the model generates a heterodomain at the RFSP in order to allow fast resolution of RFSP colloids as attached (ATTACHK=2). However, because all flowlines converge at the RFSP, the ZOI and heterodomain are guaranteed to completely overlap at the RFSP. Hence, RFSP colloids are not considered truly attached, but rather may expel to bulk fluid or to the near surface of a downgradient grain, as parameterized in UpscaleContinuum. For this reason, RFSP colloids should be subtracted from the attached population for the purpose of calculating collector efficiency, as also parameterized in UpscaleContinuum.

Detachment simulations can also be run in the trajectory codes by specifying perturbation mode in the GUI. The software will prompt the user for the trajectory flux attached and remaining files to be read in to the simulation. All parameters used in the trajectory simulations will be loaded from the flux attached file. However the user has the option to reset some parameters in the GUI to drive perturbation (e.g., by altered ionic strength, ζ-potential, fluid velocity, etc.).

Note that the trajectory codes allow numerical efficiency to be improved by recognizing the practical arrest of very slow moving colloids in contact with the collector surface (using DFACTC and DFACTNS). This may produce functionally arrested colloids designated with ATTACHK=4 in the summary flux files for “remaining” colloids (HAPHETFLUXREM). The user may opt to include these colloids in the perturbation simulation by toggling the corresponding GUI button when specifying the trajectory flux file to be read into the software.

Traj-Hap, Traj-Jet, and Traj-Par each produce ASCII files that can be further processed by users, and are typically more useful than the GUI outputs. These files are found in the program directory with specific path differing with user environment. For example: C:\Program Files\W.P. Johnson Research Group\Jet_Trajectory_GUI0.11\application\JetWorkdir001


wherein the path above “W.P. Johnson Research Group” will differ with user environment.

ASCII files output by Traj-Hap, Traj-Jet, and Traj-Par include:

- Summary flux files for the population of particle trajectories  
- Selected trajectory files for individual particles

We suggest that you initiate your simulations with larger colloids (> 1 μm) and higher fluid velocities (> 10 m/day) and favorable conditions, that will allow rapid simulation for familiarization, and then lower these values as desired. As you decrease fluid velocities and colloid sizes, you will also want to increase the time step multipliers, within numerical limits. Note that time step multipliers should always be > 1 for the near surface and bulk fluid domains in order to preserve random motion representative of diffusion.

We would like to emphasize that the contact, steric, roughness and heterodomain parameters were developed across a variety of conditions described in Ron et al. (2019), Rasmuson et al. (2019), and VanNess et al. (2019), and references therein. The current parameterization is fully substantiated in experimental observations.

Conditions not currently addressed include:

a) roughness of magnitude that generates new impinging surfaces in the flow field  
b) dual porosity domain impacts on attachment  
c) heterogeneity on colloids  
d) non-spherical colloids  

However, each of these unaddressed conditions are points of potential improvement, and we welcome suggestions and collaborative efforts to address them.

Information is provided below regarding:  
a) input parameters  
b) output files, and  
c) input parameter detailed information for run-time and output parameters not described in supporting information of publications.

## References Cited

Johnson, W. P., & Pazmiño, E. F., 2023. *Colloid (nano- and micro-particle) transport and surface interaction in groundwater.* The Groundwater Project. https://doi.org/10.21083/978-1-77470-070-9

Pazmino E., Jacob Trauscht, and Johnson W. P., 2014, *Release of Colloids from Primary Minimum Contact Under Unfavorable Conditions by Perturbations in Ionic Strength and Flow Rate*, Environ. Sci. Technol., 48(16), 9227–9235, DOI: http://dx.doi.org/10.1021/es502503y.

Pazmino E., Jacob Trauscht, Brittany Dame, and Johnson W. P., 2014, *Power-law size-distributed heterogeneity explains colloid retention on soda-lime glass in the presence of energy barriers*, Langmuir, 30(19), 5412–5421, http://dx.doi.org/10.1021/la501006p.

Rasmuson Anna, Kurt VanNess, Cesar A. Ron, William P. Johnson, 2019, *Hydrodynamic versus surface interaction impacts of roughness in closing the gap between favorable and unfavorable colloid transport conditions*, Environ. Sci. Technol., 53 (5) 2450-2459, 10.1021/acs.est.8b06162

Ron Cesar, Kurt VanNess, Anna Rasmuson, William P. Johnson, 2019, *How Nanoscale Surface Heterogeneity Impacts Transport of Nano- to Micro-Particles on Surfaces under Unfavorable Attachment Conditions*, Environmental Science: Nano, 6, 1921 - 1931, 10.1039/C9EN00306A.

Trauscht J., E. Pazmino, and W. P. Johnson, 2015, *Prediction of Nanoparticle and Colloid Attachment on Unfavorable Mineral Surfaces Using Representative Discrete Heterogeneity*, Langmuir, 31 (34), 9366–9378, DOI: http://dx.doi.org/10.1021/acs.langmuir.5b02369.

VanNess Kurt, Anna Rasmuson, Cesar A. Ron, William P. Johnson, 2019, *A Unified Theory for Colloid Transport: Predicting Attachment and Mobilization under Favorable and Unfavorable Conditions*, Langmuir, 35 (27), 9061-9070, 10.1021/acs.langmuir.9b00911.


## Trajectory Codes (TRAJ-HAP, TRAJ-JET, TRAJ-PAR) Input Parameters

### NPART
Number of colloids simulated.

### ATTMODE
- **0** — Perfect sink  
- **1** — Torque balance  

Perfect sink mode considers the particle as attached when separation distance < 1 nm.  
Torque balance mode considers whether the resisting torque exceeds the driving torque (arrest) in contact (separation distances less than that of barrier maximum, ca. 1 nm).

### VSUP (m/s)
Fluid superficial velocity.

- **Traj-Hap:** VSUP = θv = Q/A  
- **Traj-Jet:** VSUP = Q/A of jet  

### RLIM (m)
Injection radius.

RLIM should be slightly larger than the radius over which colloids have zero probability of intercepting the surface, but **must not be smaller** or collector efficiency will be underestimated.

### REXIT (m)
Radius beyond which colloids exit the observation area (Traj-Jet).

### POROSITY (-)
Porosity of porous media used to scale Happel fluid envelope.  
Equal to volumetric water content in saturated systems.

### AG (m)
Happel Collector Radius.

### AP (m)
Colloid radius.

### RHOP (kg/m³)
Colloid density.

### RHOW (kg/m³)
Fluid density.

### VISC (kg/m/s)
Fluid viscosity.

### ER (-)
Relative permittivity of fluid.

### T (K)
Temperature.

### IS (mol/m³)
Ionic strength.

### ZI (-)
Valence of electrolyte.

### ZETAP (V)
Colloid zeta potential.

### ZETACST (V)
Collector zeta potential.

### ZETAHET (V)
Heterodomain zeta potential.

---

## Heterogeneity Parameters

### HETMODE
Sum of numbers of small and large heterodomains in each patch.

Examples:  
- **HETMODE = 5** → 1 large heterodomain + 4 equally spaced small heterodomains  
- **HETMODE = 1** → uniform heterodomains

### RHET0 (m)
Radius of large heterodomain.

### RHET1 (m)
Radius of small heterodomains.

### SCOV (–)
Fractional surface coverage occupied by heterodomains.  
Set **0** to eliminate heterogeneity.

---

## van der Waals Parameters

### A132 (J)
Combined Hamaker constant (applies only for **VDWMODE = 1**).

### LAMBDAVDW (m)
vdW decay length.

### VDWMODE
Determines layered / non-layered system behavior:

1. Non-layered surfaces  
2. Layered colloid + layered collector  
3. Non-layered colloid + layered collector  
4. Layered colloid + non-layered collector

### A11 (J)
Colloid Hamaker constant (set 0 if VDWMODE = 1).

### AC1C1 (J)
Colloid coating Hamaker constant (set 0 if VDWMODE = 1).

### A22 (J)
Collector Hamaker constant (set 0 if VDWMODE = 1).

### AC2C2 (J)
Collector coating Hamaker constant (set 0 if VDWMODE = 1).

### A33 (J)
Fluid Hamaker constant (set 0 if VDWMODE = 1).

### T1 (m)
Colloid coating thickness (0 if VDWMODE = 1).

### T2 (m)
Collector coating thickness (0 if VDWMODE = 1).

---

## Acid–Base (Lewis) & Steric Parameters

### GAMMA0AB (J/m²)
Acid–base energy at minimum separation.

### LAMBDAAB (m)
Acid–base decay length.

### GAMMA0STE (J/m²)
Steric energy at zero separation.

### LAMBDASTE (m)
Steric decay length.

---

## Roughness Parameters

### B (m)
Slip length for hydrodynamic influence of roughness  
(typically equal to maximum asperity height).

### RMODE
- 0 = smooth surfaces (RMS roughness < 5 nm)  
- 1 = rough colloid  
- 2 = rough collector  
- 3 = both rough  

### ASP (m)
Asperity height for DLVO calculations (typically 5–20 nm).

### ASP2 (m)
Maximum asperity height controlling torque lever-arm enhancement.

### KINT (N/m²)
Combined elastic modulus of colloid + collector.

### W132 (J/m²)
Work of adhesion.

### BETA
Expected fraction of maximum contact radius prior to arrest.  
- **1.0** = detachment  
- **<1** = attachment

---

## Diffusion, Gravity, Time-Steps

### DIFFSCALE (-)
Diffusion scaling factor to correct diffusion force to Stokes–Einstein displacement.  
**Typical value: 1.35**

### GRAVFACT (-)
- **–1** = flow concurrent with gravity  
- **+1** = flow against gravity  
- **0** = no gravity

---

## Time-Step Multipliers

Used relative to momentum relaxation time.

### MULTB  
Time-step multiplier in **bulk fluid**.

### MULTNS  
Time-step multiplier in **near surface** domain.  
**Must be > 1** to preserve diffusion.

### MULTC  
Time-step multiplier in **contact** domain.  
May be < 1 (diffusion disabled here).

---

## Slow-Motion Parameters (Numerical Optimization)

These allow the simulation to stop tracking particles whose motion becomes negligibly small.

### DFACTNS  
Near-surface displacement factor.  
Typical: **1 × 10⁻⁵**

### DFACTC  
Contact displacement factor.  
Typical: **1 × 10⁻¹**

*Values must be << 1 because hydrodynamic retardation reduces translation dramatically near surfaces.*

---

## Output Control Parameters

### NOUT  
Interval of saved trajectory points.  
Smaller → higher resolution but larger files.

### PRINTMAX  
Maximum allowable size for trajectory output arrays.  
If exceeded, older rows are overwritten.

## Description of Summary Flux Files for the Population of Particle Trajectories  
(from TRAJ-HAP, TRAJ-JET, or TRAJ-PAR)

Flux files output from both Traj-Hap and Traj-Jet are titled as:

- **HAPHETFLUXATT** — attached particles  
- **HAPHETFLUXREM** — functionally attached or retained without attachment  
- **HAPHETFLUXEX** — exited particles

These flux files contain population-level results for each simulated particle.

### The following parameters are provided for each particle:

#### PARTICLE #
Injection order.

#### HINIT (m), XINIT (m), YINIT (m), ZINIT (m), RINJ (m)
Initial separation distance from surface, and initial x, y, z and radial positions in the injection plane.

#### HOUT (m), XOUT (m), YOUT (m), ZOUT (m)
Final separation distance from surface, and final spatial coordinates.

#### PTIMEIN (s), PTIMEOUT (s)
Time of injection and time of exit / attachment / remaining classification.

#### ETIME (s), TBULK (s), TNEAR (s), TFRIC (s)
- **ETIME** — elapsed time in collector before exit/attachment/remaining  
- **TBULK** — elapsed time in bulk fluid  
- **TNEAR** — elapsed time in near-surface fluid  
- **TFRIC** — elapsed time in contact (friction) domain  

#### NSVISIT
Number of visits to the near-surface domain.

#### FRICVISIT
Number of visits to the contact (friction) domain.

---

## ATTACHK (Retention Mode Classification)

ATTACHK is a key indicator describing the outcome of each particle:

| Code | Meaning |
|------|---------|
| **1** | EXIT — particle exited the system |
| **2** | ATTACHED — by perfect sink or torque balance (true attachment) |
| **3** | REMAINING IN BULK FLUID — unresolved when simulation ended |
| **4** | TORQUE WITH SLOW MOTION — designated attached via DFACTC |
| **5** | IN NEAR-SURFACE WITH SLOW MOTION — designated attached via DFACTNS |
| **6** | CRASHED — negative separation distance occurred (numerical error) |

### Notes:

- Only **ATTACHK = 2** is considered *true attachment*.  
- **ATTACHK 3, 4, 5** are non-terminal or slow-motion classifications.
- **ATTACHK 6** indicates excessive time-step size (reduce MULT parameters).

---

## Heterogeneity Fields

#### AFRACT
Fraction of colloid–surface ZOI (Zone of Influence) occupied by a heterodomain.

#### HETTYPE
Identifier for heterodomain size.

---

## Near-Surface Metrics

#### NSVEL (m/s)
Near-surface colloid velocity (derived from <200 nm residence periods).

#### HAVE (m)
Average separation distance while in near-surface domain.

---

