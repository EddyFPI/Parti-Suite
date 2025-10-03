# Parti Suite

**Parti Suite** is an open-source toolkit for **Colloid Filtration Theory (CFT)**.  
It provides forward and inverse modeling, force simulations, and multiscale upscaling of colloid–collector interactions, with applications in both research and teaching.

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

## Dependencies

Parti Suite requires common scientific Python libraries:

- Python ≥ 3.9 (recommended: 3.10–3.12)  
- `numpy`  
- `scipy`  
- `matplotlib`  
- `customtkinter` (for the GUIs)  
- *(Optional)* `pandas` for data export  
- *(Optional)* `numba` or `multiprocessing` for heavy simulations

Install with:

    pip install numpy scipy matplotlib customtkinter pandas



## Usage

Parti Suite modules are provided as independent Python scripts, each with its own **Graphical User Interface (GUI)**.  
There is no installation package — simply clone or download the repository and run the module you need in your preferred Python IDE (Spyder, VS Code, PyCharm) or directly from the command line.

```bash
python CorrelationEquations.py
# or
python xDLVO.py
python TrajHap.py
python AFM_ForceVolume.py
python UpscaleContinuum.py
```

## Documentation

- **Wiki:** https://github.com/EddyFPI/Parti-Suite/wiki  
- **Issues:** https://github.com/EddyFPI/Parti-Suite/issues

---

## Related Reading

A key open-access reference that complements Parti Suite is available through the [Groundwater Project](https://gw-project.org/):

- **[Colloid, Nano, and Micro-Particle Transport and Surface Interaction in Groundwater](https://gw-project.org/books/colloid-nano-and-micro-particle-transport-and-surface-interaction-in-groundwater/)**  
  This book provides a comprehensive overview of colloid and nanoparticle transport in groundwater systems.  
  It covers fundamental concepts of colloid filtration theory (CFT), surface interactions (DLVO and extended DLVO),  
  the role of nanoscale heterogeneity, and upscaling approaches for predicting breakthrough and retention in porous media.  
  The text bridges theoretical foundations with experimental findings, making it a valuable resource for both  
  researchers and students in hydrogeology, environmental engineering, and contaminant transport modeling.



## Tutorials

📺 We have a YouTube playlist with step-by-step tutorials:  
[Parti Suite Tutorials on YouTube](https://www.youtube.com/playlist?list=XXXXXXXX)

---

## Authors

- **William P. Johnson** – *Department of Geology & Geophysics, University of Utah, USA*  
  *(Main author; theoretical framework and models)*

- **Eddy Pazmiño** – *Department of Extractive Metallurgy, Escuela Politécnica Nacional (EPN), Quito, Ecuador*  
  *(Lead developer and maintainer)*

With contributions from students and collaborators across **colloid science, hydrogeology, environmental engineering, geoscience, and computational transport modeling** (e.g., **Meiping Tong**, **Xiqing Li**, **Timothy D. Scheibe**, **I. L. Molnar**, **J. I. Gerhard**, and others).

---

## License

Parti Suite is distributed under the terms of the **GNU General Public License v3.0**.  
See [LICENSE](LICENSE) for full text.

---

## Citation

If you use Parti Suite in your research or teaching, please cite:

```bibtex
@software{parti_suite,
  title   = {Parti Suite: Colloid Filtration Theory Toolkit},
  author  = {Johnson, William P. and Pazmiño, Eddy and contributors},
  year    = {2025},
  url     = {https://github.com/EddyFPI/Parti-Suite}
}
