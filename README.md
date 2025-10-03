# Parti Suite

![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)
![Python 3.10+](https://img.shields.io/badge/python-3.10%2B-blue)
[![Issues](https://img.shields.io/github/issues/EddyFPI/Parti-Suite)](https://github.com/EddyFPI/Parti-Suite/issues)

**Parti Suite** is an open-source toolkit for **Colloid Filtration Theory (CFT)**.  
It provides forward and inverse modeling, force simulations, and multiscale upscaling of colloid–collector interactions.  
Applications include groundwater transport, nanoparticle retention, AFM simulations, and teaching of colloid transport phenomena.

---

## Available GUIs

Each module is a **standalone Python script with its own GUI**.  
Launch any module from your IDE (Spyder, VS Code, PyCharm) or from the terminal.

| Module (script)            | Purpose (GUI)                                                                 | Key Capabilities                                                                                 | Typical Outputs                                    |
|-----------------------------|-------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------|---------------------------------------------------|
| `CorrelationEquations.py`  | Single collector efficiency (favorable conditions)                            | Computes η (collector efficiency) using correlation equations                                     | Numerical tables, PNG plots                        |
| `xDLVO.py`                 | Extended DLVO interactions (colloid–collector)                                | EDL + van der Waals + acid–base; **discrete charge heterogeneity**; **coated surfaces**          | Energy-distance curves, CSV/PNG                    |
| `TrajHap.py`               | Trajectory / force–torque balance in **Happel sphere**                        | Hydrodynamics + colloidal forces; **discrete surface charge heterogeneity**                      | Trajectories, contact stats, CSV/PNG               |
| `AFM_ForceVolume.py`       | AFM colloidal probe **force-volume** simulator                                 | Approach–retract curves; heterogeneity; parameter sweeps                                          | Force curves, heatmaps, CSV/PNG                    |
| `UpscaleContinuum.py`      | **Direct & Inverse** upscaling to population behavior                         | Residence-time analysis → BTCs/retention; fits **kinetic rate constants** from column data       | BTC/retention plots, fitted params JSON/CSV/PNG    |

---

## Usage

No installation package is required. **Clone or download** this repository and run the module you need.  

### Example: Launch the Correlation Equations GUI
```bash
git clone https://github.com/EddyFPI/Parti-Suite.git
cd Parti-Suite
python CorrelationEquations.py
