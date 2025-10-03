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

## Documentation
- [Wiki](https://github.com/<your-org>/parti-suite/wiki) — tutorials, usage, and examples  
- [Issues](https://github.com/<your-org>/parti-suite/issues) — bug reports and feature requests  

---

## Authors
- **William P. Johnson** – *Department of Geology & Geophysics, University of Utah, USA*  
  *(main author, theoretical framework and models)*  

- **Eddy Pazmiño** – *Department of Extractive Metallurgy, Escuela Politécnica Nacional, Quito, Ecuador*  
  *(lead developer and maintainer)*  

- With contributions from students and collaborators across colloid science, hydrogeology, environmental engineering, geoscience, and computational modeling

---

## License
Parti Suite is distributed under the terms of the [GNU General Public License v3.0](LICENSE).

---

## Citation
If you use Parti Suite in your research or teaching, please cite:

```bibtex
@software{parti_suite,
  title   = {Parti Suite: Colloid Filtration Theory Toolkit},
  author  = {Johnson, William P. and Pazmiño, Eddy and contributors},
  year    = {2025},
  url     = {https://github.com/<your-org>/parti-suite}
}
