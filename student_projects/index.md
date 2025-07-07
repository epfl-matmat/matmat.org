@def title = "Student projects"

# Student projects
Below are examples of projects our group can offer as Bachelor or Master
**semester projects** or **Master thesis projects** (PdM).
This list is not exhaustive and other topics related to [our research](/research)
are equally possible.
If you are interested in a project or Master thesis with us,
please make yourself familiar with
our **[general guidelines](/student_projects/guidelines)**
about student projects.

Finally, if you are a student outside EPFL,
please take a look at the *summer research opportunities*
listed on our [Job Openings website](/jobs).

Overview of projects:

\toc

----

## Quantifying the discretisation error in material structure computations
Density-functional theory simulations allow computing key material properties.
In this work we will investigate how reducing the size
of the discretisation basis employed for the simulations
impacts the quality of the obtained properties (see below).
We will employ recent perturbative
error estimates[^CDKL2022] in order to quantify the expected error in the obtained
properties versus a fully converged discretisation.
For this work we will employ the
[density-functional toolkit (DFTK)](https://dftk.org),
a first-principle materials simulation code based on density-functional theory
in which the aforementioned error estimates are implemented and readily available.

The properties that we want to focus on are:
- **Geometry - Atom positions**: A key step when simulating the properties of a material is structure optimisation.
  In this process an approximate arrangement of atoms in a crystal is optimised
  to obtain the most stable configuration, based on the computed **interatomic forces**.
- **Geometry - Stresses**: Another key step is the computation of the optimal crystal cell parameters,
  based on the computed **stresses**.
- **Equations of state**, which relate the volume change of a material to its total energy.
  The equation of state of a material can be used to extract important properties such as the bulk modulus,
  as well as a precision benchmark across many DFT codes [^VerificationStudy2023].
- **Band structures**, which are often a first step in the computation of more advanced properties such as electrical resistivity and optical absorption.


**Requirements:**
Strong programming skills, ideally Julia or python;
Basic knowledge of numerical methods for partial differential equations;
Experience in numerical analysis of PDEs is a bonus;
Experience in running DFT calculations is a bonus;

[^CDKL2022]: E. Cancès, G. Dusson, G. Kemlin and A. Levitt. SIAM J. Sci. Comp. **44** (2022). ArXiv [2111.01470](https://arxiv.org/abs/2111.01470v2)
[^VerificationStudy2023]: Bosoni, E., Beal, L., Bercx, M. et al. *How to verify the precision of density-functional-theory implementations via reproducible and universal workflows.* [Nat Rev Phys 6, 45–58 (2024).](https://doi.org/10.1038/s42254-023-00655-3)

<!--
α-Manangese structures (see noteworthy systems)
(if stress) MOF structures

Use Hessian from foundational model
Use GP Hessian trained on geoopt trajectory (energy + forces), perhaps with foundational model as prior

-->

----

## Error-aware acceleration methods for density-functional theory simulations

Density-functional theory (DFT) simulations are a central ingredient in modern
materials modelling and such simulations are run in the millions every day
across the world's supercomputers. The typical fixed-point problem underlying
DFT is solved iteratively using a variant of standard fixed-point iterations
termed *self-consistent field (SCF) iterations*. In particular for challenging
materials system the SCF can converge very slowly. Convergence acceleration
techniques (such as [Anderson acceleration](https://en.wikipedia.org/wiki/Anderson_acceleration))
are thus regularly employed and amount to speed up convergence.
In a nutshell these methods build adapted linear combinations by solving
a linear regression problem. However, typically the error in the regressed
iterates (i.e. the fact that these are polluted with numerical noise)
is completely ignored. In this project we want to develop a suitable adaptation
of Anderson acceleration by combining this method with ideas from statistical
learning in order to take numerical errors into account.

**Requirements:**
Strong programming skills, ideally Julia or python;
Background in numerical methods, in particular for
solving non-linear problems and eigenvalue problems;
Interest or experience with statistical regression, in particular Bayesian methods;
Experience in solid-state physics and materials modelling is a bonus;

<!--
Antoine:
One thing I wanted to explore was to annotate each residual
vector with an error bar, coming additively both from the approximate
eigensolve (which we can try to estimate from the eigenvalue residuals)
and from some estimate of the nonlinear effects (which we maybe try to
model as an isotropic quadratic), and take that into account in the least
squares. I never got around to it, but do ping me if you're interested in
exploring this kind of things further.
-->

----

## Advanced Krylov subspace methods for materials property simulations

A central goal of modern materials modelling is to predict the chemical
and physical properties of a material. Such properties colloquially describe
how the material behaves under a change of external conditions such as
a change of electromagnetic field, some external pressure.
In the context of density-functional theory (DFT) simulations computing
such properties requires the solution of a nested set of linear systems,
that is one outer linear system, where each application of the linear
operator itself requires solving hundreds of inner linear systems.
Our recent research [^Schur] [^InexactKrylov] has proposed a framework
based on inexact Krylov subspace methods to solve this problem efficiently.
In this project we will investigate the adaptation of block Krylov
techniques and Krylov subspace recycling techniques (such as [^Morgan2002])
to this challenging application setting.

**Requirements:**
Strong programming skills, ideally Julia or python;
Background in numerical methods, in particular for solving non-linear problems
and eigenvalue problems; Interest or experience in Krylov subspace methods,
such as GMRES or Arnoldi; Experience in solid-state physics and materials
modelling is a bonus;

[^Schur]: E. Cancès, M. F. Herbst, G. Kemlin, A. Levitt, B. Stamm. *Numerical stability and efficiency of response property calculations in density functional theory.* Lett. Math. Phys. **113**, 21 (2023). DOI [10.1007/s11005-023-01645-3](https://doi.org/10.1007/s11005-023-01645-3)
[^InexactKrylov]: M. F. Herbst and B. Sun. *Efficient Krylov methods for linear response in plane-wave electronic structure calculations.* ArXiv [2505.02319](http://arxiv.org/abs/2505.02319)
[^Morgan2002]: R. B. Morgan. *GMRES with Deflated Restarting* SIAM J. Sci. Comp. **24**, 20 (2002).

<!--
Main points to work on is:
  - Block methods
  - Implement a baseline method based on Anderson+Richardson (what other codes do)

Goal: "Make response calculations fast" (follow-up work from Bonan)
  * Project with Daniel Kressner ?
  * Use preconditioning consistently
  * Using single precision for storing GMRES Krylov vectors towards the end
  * Block CG / GMRES methods (?)
  * Switch to single precision in later CG steps (?)
-->

----

## Data-driven materials modelling with uncertainty-informed Gaussian processes

Data-driven materials modeling plays a crucial role in modern materials
discovery. Statistical models trained on large datasets of first-principles
simulations provide efficient and accurate predictions of material properties,
reducing the need for costly computations. However, datasets generated from
density-functional theory (DFT) calculations, which underlie many data-driven
approaches, face two key challenges:

- Non-uniform computational cost: The cost of DFT calculations varies
  significantly across materials due to differences in numerical parameters,
  such as discretization basis, k-point sampling, tolerances, required to
  achieve a target accuracy.

- Data heterogeneity: Training data often come from diverse sources with
  varying levels of uncertainty, which affects the reliability of predictive
  models. 

Active learning is a promising approach for improving the efficiency of
data-driven materials modeling by adaptively selecting the most informative
data points for further computations.
Currently, a common approach is to compute the entire dataset with a fixed
discretization (e.g., plane-wave cutoff) chosen a priori (e.g. [^vanderOord]
and [^Merchant2023]), which may not optimally balance computational cost and
accuracy across diverse materials. 

The goal of this project is to investigate directions that overcome these
challenges by integrating active learning with uncertainty-aware models. This
involves formulating an active learning approach that adaptively selects both
material structures and numerical parameters to optimize computational
resources, while employing Gaussian process regression [^RasmussenWilliams06]
to effectively propagate and manage uncertainties in heterogeneous datasets. By
combining these techniques, the project aims to improve the accuracy,
efficiency, and reliability of data-driven materials modeling.

**Requirements:**
Strong programming skills, ideally Julia or Python; 
Experience with probabilistic machine learning methods, Gaussian processes, Bayesian optimization; 
Experience in running DFT calculations is a bonus;
Basic knowledge of numerical methods for partial differential equations is a bonus.

[^vanderOord]: C. van der Oord, M. Sachs, D. P. Kovács, C. Ortner and G. Csányi . *Hyperactive learning for data-driven interatomic potentials*. npj Comput Mater 9, 168 (2023). DOI [10.1038/s41524-023-01104-6](https://doi.org/10.1038/s41524-023-01104-6)

[^Merchant2023]: A. Merchant, S. Batzner, S. S. Schoenholz, M. Aykol, G. Cheon and E. D. Cubuk. *Scaling deep learning for materials discovery*. Nature 624, 80–85 (2023). DOI [10.1038/s41586-023-06735-9](https://doi.org/10.1038/s41586-023-06735-9)

[^RasmussenWilliams06]: C. E. Rasmussen & C. K. I. Williams, Gaussian Processes for Machine Learning, the MIT Press, 2006. DOI [3206.001.0001](https://doi.org/10.7551/mitpress/3206.001.0001)


-----

## Symmetry-Aware Automatic Differentiation in DFT Calculations

This project is to extend DFTK's symmetry handling capabilities to work with automatic differentiation. Symmetry handling becomes even more important in the case of partially symmetry-breaking perturbations, for materials properties such as phonons and elastic constants. The project involves deriving methods that combine crystallographic symmetry analysis[^Togo2024] with derivative computations, helping to optimize density-functional theory calculations [^DFTKsymmetrydocs]. This would be a fruitful contribution to the open-source DFTK framework.

**Requirements:**
Solid numerical programming skills, ideally in Julia or python; Basic understanding of group theory; Bonus: Prior knowledge about DFT.

[^Togo2024]: Togo, A., Shinohara, K., & Tanaka, I. (2024). Spglib: a software library for crystal symmetry search. Science and Technology of Advanced Materials: Methods, 4(1). https://doi.org/10.1080/27660400.2024.2384822

[^DFTKsymmetrydocs]: https://docs.dftk.org/stable/developer/symmetries/

