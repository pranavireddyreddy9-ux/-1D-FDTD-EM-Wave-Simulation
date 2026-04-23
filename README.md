1D Electromagnetic Wave Propagation — FDTD Simulation

> Numerical modeling of EM wave propagation from free space into a dielectric medium using the Finite-Difference Time-Domain (FDTD) method, implemented in MATLAB.

Project Overview

This project implements a **one-dimensional FDTD simulation** to model how electromagnetic waves propagate, reflect, and transmit when traveling from free space (εᵣ = 1) into a dielectric medium (εᵣ = 2).

The simulation is grounded in **Maxwell's equations** and validates numerical results against theoretical predictions — achieving a reflection coefficient accuracy of **99.6%** (Numerical: −0.1722 vs. Exact: −0.1716).

Key Concepts Applied

- Maxwell's curl equations → reduced to 1D wave equation
- Yee grid (staggered grid) for second-order accurate discretization
- Courant stability condition (Δt ≤ Δx / c) for numerical stability
- Mur's Absorbing Boundary Condition (ABC) to simulate open/infinite space
- Gaussian pulse excitation (soft source) to avoid numerical transients
- Wave behavior at material interface: reflection & transmission physics

Implementation Details

| Parameter | Value |
|---|---|
| Simulation Domain | 1 metre |
| Spatial Grid Points (NX) | 100 |
| Simulation Time | 4.5 ns |
| Medium 1 Permittivity (εᵣ₁) | 1 (Free Space) |
| Medium 2 Permittivity (εᵣ₂) | 2 (Dielectric) |
| Boundary Condition | Mur's ABC |
| Source Type | Gaussian Pulse (Soft Source) |
| Tool | MATLAB R2018a+ |

Results

| Metric | Value |
| Numerical Reflection Coefficient (R₁) | −0.1722 |
| Exact Reflection Coefficient (R₂) | −0.1716 |
| Accuracy | ~99.6% |

The simulation correctly demonstrates:
- EM wave propagation and field evolution over time
- Wave slowing down upon entering higher-permittivity medium
- Partial reflection and transmission at the material interface
- Phase reversal of the reflected wave (as expected by theory)

Project Structure

```
1D-FDTD-Simulation/
│
├── fdtd_1d_simulation.m      # Main MATLAB simulation script
├── README.md                 # Project documentation
└── results/
    ├── simulation_output.png # Wave propagation plot
    └── numerical_results.png # Reflection coefficient output
```

How to Run

1. Open MATLAB (R2018a or later)
2. Clone or download this repository
3. Open `fdtd_1d_simulation.m`
4. Run the script — a real-time animated plot of wave propagation will appear
5. Numerical and exact reflection coefficients are printed in the command window

```matlab
% Key output variables
R1 % Numerical reflection coefficient
R2 % Exact (theoretical) reflection coefficient
```

Update Equation (FDTD Core)

The electric field at each spatial point is updated using:

```
u(m, n+1) = a * [u(m+1, n) - 2u(m, n) + u(m-1, n)] + 2u(m, n) - u(m, n-1)
```

where `a = (c · Δt / Δx)²` — the grid parameter that changes at the material interface.

Academic Context

- Institution: Stanley College of Engineering and Technology for Women, Hyderabad (Osmania University)
- Degree: B.E. Electronics and Communication Engineering
- Semester: V Semester 
- Guide: Dr. K. N. Sahu, Head of Department, ECE

References

- K. S. Yee, *IEEE Trans. Antennas Propag., 1966 — foundational FDTD paper
- A. Taflove & S. C. Hagness, *Computational Electrodynamics*, Artech House, 2005
- D. M. Sullivan, *Electromagnetic Simulation Using the FDTD Method*, IEEE Press, 2000
- J. B. Schneider, *Understanding the FDTD Method* — [eecs.wsu.edu] https://www.eecs.wsu.edu/~schneidj/ufdtd/)

Author

**Reddyreddy Pranavi**  
B.E. Electronics and Communication Engineering | AI/ML Minor  
Stanley College of Engineering and Technology for Women, Hyderabad  

