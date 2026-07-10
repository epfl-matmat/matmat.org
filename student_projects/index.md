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
To see how this works in practice, see this [Research Demo](https://showcases.matmat.org/2025/error_estimate_properties.html).

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

Error propagation for Anderson: Assume to use Anderson to accelerate F(x) = 0. Assume
$F$ is noisy with known noise level (e.g. assume the noise decreases over time in a
quantifyable way). Can way say something about the uncertainty on the Anderson
coefficients? When shall not trust a snapshot any more and better discard it?
see also `Error propagation for Anderson (linear problem first, then SCF)` in
DFT_Plane_Waves/00_Ideas project.

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

## Analysing pseudopotential model mismatch
In almost all plane-wave density-functional theory (DFT)
simulations one employs a pseudopotential to model
the interactions between atoms and electrons.
While this represents an additional approximation
(on top of the DFT model and the discretisation basis),
this trick contributes considerably to making the numerics feasible in practice.
Common pseudopotential models feature a multitude of parameters,
which are determined following an involved fitting procedure.
In practice the pseudopotential choice and the choice of DFT model
are tightly coupled.
However, since targeted pseudopotentials are not known for all DFT models,
practitioners frequently perform DFT calculations with a mismatching pseudopotential.

The goal of this project is to understand the discrepancy introduced
by a mismatch between pseudopotential and DFT functional.
This will involve both an analytical component,
studying the variation under a change of pseudopotential
using perturbation theory
as well as a numerical component featuring systematic numerical experiments
on standard DFT test problems.

**Requirements:**
Strong programming skills, ideally Julia or python;
Basic knowledge of numerical methods for partial differential equations;
Experience in numerical analysis of PDEs is a bonus;
Experience in running DFT calculations is a bonus;

<!--
  Perturbative ansatz when electron count is conserved
  Re-perform verification study with mismatching pseudopotential.
  Perturbative ansatz when electron count is changing

Pseudopotential finetuning:
  Niklas: Pseudopotential by gradients could be a nice project
  now, to do the experiment from the paper with Niklas but better. A deeper look at
  smoothness preservation and how much norm conservation is violated. Next step
  is to include norm conservation in the loss function as a regularization term
  directly in the bulk (skipping atomic calculations). Another bonus step is to
  include a Gaussian NLCC for GTH (as Willand 2013) and optimize those params as well.
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

Automatic differentiation (AD) is a technique to reinterpret the implementation
of an algorithm in order to compute not only the output quantities of the map,
but *also* its Jacobian, that is all derivatives of all outputs versus all inputs.
As derivatives play an essential role in physics, it is worthwhile developing
such capabilities further. For a showcase example how AD can be used
in density-functional theory and materials modelling see this
[Research Demo](https://showcases.matmat.org/2025/autodiff_dftk.html).

This project is to extend DFTK's symmetry handling capabilities to work with
automatic differentiation. Symmetry handling becomes even more important in the
case of partially symmetry-breaking perturbations, for materials properties
such as phonons and elastic constants. The project involves deriving methods
that combine crystallographic symmetry analysis[^Togo2024] with derivative
computations, helping to optimize density-functional theory calculations
[^DFTKsymmetrydocs]. This would be a fruitful contribution to the open-source
DFTK framework.

**Requirements:**
Solid numerical programming skills, ideally in Julia or python;
Practical knowledge of group theory and representation theory;
Bonus: Prior knowledge about DFT.

[^Togo2024]: Togo, A., Shinohara, K., & Tanaka, I. (2024). *Spglib: a software library for crystal symmetry search*. Science and Technology of Advanced Materials: Methods, 4(1). https://doi.org/10.1080/27660400.2024.2384822

[^DFTKsymmetrydocs]: https://docs.dftk.org/stable/developer/symmetries/

-----

## Differentiable Learning of Pseudopotentials

Pseudopotentials are an essential component of modern plane-wave
density-functional theory (DFT) computations for materials.
Their construction represents a fundamental trade-off between smoothness (or "softness"),
which dictates the computational cost, and transferability across diverse chemical environments.

Standard generation involves a two-phase approach: fitting parameters to isolated atoms,
followed by validation in bulk systems (e.g. [^pseudodojo]). In practice, this process is
frequently repeated in an iterative trial-and-error fashion to semi-automatically navigate this trade-off.

In this project, we aim at a more targeted optimization using gradient information.
We will explore the learning of pseudopotentials directly in bulk materials,
utilizing recent algorithmic differentiation (AD) tools for plane-wave DFT [^addfpt].
The goal is to minimize errors against high-precision all-electron references automatically,
yielding potentials that are both efficient and highly accurate for specific applications.

**Requirements:** 
Strong numerical programming skills, ideally Julia or Python;
Understanding of gradient-based optimization methods; Bonus: Prior knowledge about DFT.

[^pseudodojo]: M.J. van Setten, M. Giantomassi, E. Bousquet, M.J. Verstraete, D.R. Hamann, X. Gonze, & G.-M. Rignanese (2018). *The PseudoDojo: Training and grading a 85 element optimized norm-conserving pseudopotential table*. Computer Physics Communications, 226, 39-54. DOI [10.1016/j.cpc.2018.01.012](https://doi.org/10.1016/j.cpc.2018.01.012)

[^addfpt]: N. F. Schmitz, B. Ploumhans, M. F. Herbst. (2025) *Algorithmic differentiation for plane-wave DFT: materials design, error control and learning model parameters*. npj Computational Materials (*in press*). DOI [10.1038/S41524-025-01880-3](https://doi.org/10.1038/S41524-025-01880-3) (Preprint: https://arxiv.org/abs/2509.07785)

-----

## Environment-aware uncertainty quantification by clustering of surrogate models

Surrogate models of the potential energy surface (PES) approach the accuracy of DFT at a much lower computational cost, and are becoming popular in large-scale material science applications, notably for machine-learning interaction potentials (MLIPs) in molecular dynamics simulations.

Informative and affordable uncertainty quantification (UQ) methods is crucial here, both to put error bars on predictions in the interpolative regime, and also to detect the boundary of the extrapolative regime where surrogate models break down, enabling active learning strategies.

Parametric surrogate models are fitted using a dataset of a high-fidelity method (e.g. from DFT computations), where observation noise is typically negligible. The dominant source of the prediction error is by far the *incompleteness* or of the model: no choice of the model parameters can explain all the data. In this misspecified regime, we can describe the predictive uncertainty is by defining a probability distribution over model parameters or *posterior ensemble*, as in Bayesian regression.

The POPS[^pops] algorithm, recently proposed in[^ps24], has proven to be a scalable method for materials applications[^psms25], but relies on a crude error model. In particular, the error model is independent of the position on the PES. As a result, we expect the standard POPS posterior to overestimate the uncertainty in well-fitted regions of the PES.

The goal of this project is to extend the POPS algorithm with clustering methods in the space of model parameters, allowing the construction of more complex posteriors. By training a classifier to assign configurations to parameter clusters, we will create a refined, configuration-dependent model of the mispecification error, and hopefully obtain better-calibrated uncertainties. This clustered POPS approach is closely related to *mixture-of-experts* strategies explored in the recent MLIP literature (e.g. [^ns24]).

A first target application is the estimation of defect migration barriers in imperfect crystals, using high-dimensional linear models. If succesful, the approach could be extended to more sophisticated MLIPs, and released within the [POPSRegression.jl](https://github.com/POPS-UQ/POPSRegression.jl) package.

**Requirements:** 
Strong programming skills, ideally Julia (or Python and a willingless to learn Julia); 
Working knowledge of Bayesian statistics/probabilistic regression;
Experience in implementing machine learning models;
Experience in running DFT calculations is a plus;


[^ps24]: T.D. Swinburne & D. Perez (2024). *Parameter uncertainties for imperfect surrogate models in the low-noise regime*. Machine Learning: Science and Technology, 6(1). DOI [10.1088/2632-2153/ad9fce](https://doi.org/10.1088/2632-2153/ad9fce)
(Preprint: https://arxiv.org/abs/2402.01810)

[^psms25]: D. Perez, A.P.A. Subramanyam, I. Maliyov, T.D. Swinburne (2025). *Uncertainty quantification for misspecified machine learned interatomic potentials*. npj Computational Materials, 11(1). DOI [10.1038/s41524-025-01758-4](https://doi.org/10.1038/s41524-025-01758-4) (Preprint: https://arxiv.org/abs/2502.07104)

[^ns24]: N.C. Nguyen & D. Sema (2024). *Environment-adaptive machine learning potentials*. Physical Review B, 110(6). DOI [10.1103/PhysRevB.110.064101](https://doi.org/10.1103/PhysRevB.110.064101) (Preprint: https://arxiv.org/abs/2405.00306)
[^pops]: pointwise optimal parameter sets

-----

## Resolving High-Frequency Features in Kohn–Sham Inversion

Density-functional theory (DFT) is one of the most widely used methods for simulations in 
chemistry and materials science. In a standard Kohn-Sham DFT calculation, the electron 
density is computed for a given effective potential. Kohn-Sham inversion asks the inverse 
question: Given an electron density, can we reconstruct the effective potential that produces 
it? Such inversions can provide insight into exact Kohn–Sham potentials and are useful for 
developing and benchmarking density-functional approximations.[^herbstKohnShamInversionMathematical2025][^bakkestuenMoreauYosidabasedKohnShamInversion2026] 

This inverse problem is mathematically and numerically challenging. In exact DFT, the 
universal density functional is in general not differentiable, such that the corresponding 
potential cannot always be obtained as a functional derivative. Moreau–Yosida regularization 
gives a differentiable formulation and thereby a well-defined regularized density–potential 
relation.[^penzPerspectiveMoreauYosidaRegularization2025]

In this project we will investigate how well high-frequency and strongly localized features 
of a potential can be reconstructed. We will study how the inversion depends on the numerical 
resolution, on the consistency of the wavefunction and density grids, and on how errors in 
the density and potential are measured. The aim is to understand how 
these choices influence the accuracy and stability of the reconstructed potential.

**Requirements:** Strong programming skills, ideally Julia; Background in numerical 
methods, optimisation, and Fourier-based discretisations; Basic 
knowledge of quantum mechanics and experience in density-functional theory are a bonus.

[^herbstKohnShamInversionMathematical2025]: M. F. Herbst, V. H. Bakkestuen, and A. Laestadius. *Kohn-Sham inversion with mathematical guarantees.* Phys. Rev. B **111**, 205143 (2025). DOI [10.1103/PhysRevB.111.205143](https://doi.org/10.1103/PhysRevB.111.205143)

[^bakkestuenMoreauYosidabasedKohnShamInversion2026]: V. H. Bakkestuen, M. F. Herbst, V. Falmår, M. Penz, and A. Laestadius. *Moreau-Yosida-based Kohn-Sham Inversion for Periodic Systems.* arXiv:[2606.19471](https://arxiv.org/abs/2606.19471) (2026).

[^penzPerspectiveMoreauYosidaRegularization2025]: M. Penz, M. F. Herbst, T. Helgaker, and A. Laestadius. *Perspective on Moreau-Yosida Regularization in Density-Functional Theory.* arXiv:[2511.06957](https://arxiv.org/abs/2511.06957) (2025).
