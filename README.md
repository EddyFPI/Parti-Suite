# Parti Suite

**Parti Suite** is an open-source toolkit for **Colloid Filtration Theory (CFT)**.  
It provides forward and inverse modeling, force simulations, and multiscale upscaling of colloid–collector interactions, with applications in teaching and research.

---

## Modules

- **Correlation Equations**  
  Calculates single collector efficiency under favorable deposition conditions.

- **xDLVO**  
  Computes extended DLVO interactions between colloids and collectors.  
  Includes discrete surface charge heterogeneity and coated collector systems.

- **TrajHap**  
  Particle force and torque balance simulator for colloids in a Happel sphere flow field.  
  Supports discrete surface charge heterogeneity.

- **AFM Force Volume Simulator**  
  Simulates colloidal probe interactions in an AFM system,  
  including discrete surface charge heterogeneity.

- **Upscale Continuum (Direct & Inverse)**  
  Scales particle-level simulations to a colloid population using residence-time analysis.  
  Generates breakthrough curves and retention profiles, estimates kinetic rate constants,  
  and fits experimental column data to obtain best-fit parameters.

---

## Usage
Parti Suite modules are provided as independent Python scripts, each with its own **Graphical User Interface (GUI)**.  
No installation is required — simply clone/download the repository and run the module of interest in a Python IDE (Spyder, VS Code, PyCharm) or from the command line.

### Running a Module
For example, to launch the Correlation Equations GUI:
```bash
python CorrelationEquations.py
