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

-----

## Environment-aware uncertainty quantification by clustering of surrogate models
**Keywords:** Statistical machine learning; uncertainty quantification

Surrogate models of the potential energy surface (PES) approach the accuracy of
DFT at a much lower computational cost, and are becoming popular in large-scale
material science applications, notably for machine-learning interaction
potentials (MLIPs) in molecular dynamics simulations.

Informative and affordable uncertainty quantification (UQ) methods is crucial
here, both to put error bars on predictions in the interpolative regime, and
also to detect the boundary of the extrapolative regime where surrogate models
break down, enabling active learning strategies.

Parametric surrogate models are fitted using a dataset of a high-fidelity
method (e.g. from DFT computations), where observation noise is typically
negligible. The dominant source of the prediction error is by far the
*incompleteness* or of the model: no choice of the model parameters can explain
all the data. In this misspecified regime, we can describe the predictive
uncertainty is by defining a probability distribution over model parameters or
*posterior ensemble*, as in Bayesian regression.

The POPS[^pops] algorithm, recently proposed in[^ps24], has proven to be a
scalable method for materials applications[^psms25], but relies on a crude
error model. In particular, the error model is independent of the position on
the PES. As a result, we expect the standard POPS posterior to overestimate the
uncertainty in well-fitted regions of the PES.

The goal of this project is to extend the POPS algorithm with clustering
methods in the space of model parameters, allowing the construction of more
complex posteriors. By training a classifier to assign configurations to
parameter clusters, we will create a refined, configuration-dependent model of
the mispecification error, and hopefully obtain better-calibrated
uncertainties. This clustered POPS approach is closely related to
*mixture-of-experts* strategies explored in the recent MLIP literature (e.g.
[^ns24]).

A first target application is the estimation of defect migration barriers in
imperfect crystals, using high-dimensional linear models. If succesful, the
approach could be extended to more sophisticated MLIPs, and released within the
[POPSRegression.jl](https://github.com/POPS-UQ/POPSRegression.jl) package.

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


----

## Data-driven materials modelling with uncertainty-informed Gaussian processes
**Keywords:** Statistical machine learning; Multitask Gaussian process regression;

Data-driven materials modeling plays a crucial role in modern materials
discovery. Statistical models trained on large datasets of first-principles
simulations provide efficient and accurate predictions of material properties,
reducing the need for costly computations. However, datasets generated from
density-functional theory (DFT) calculations, which underlie many data-driven
approaches, face two key challenges:

- Non-uniform computational cost: The cost of DFT calculations varies
  significantly across materials due to differences in numerical parameters,
  such as discretisation basis, k-point sampling, tolerances, required to
  achieve a target accuracy.

- Data heterogeneity: Training data often come from diverse sources with
  varying levels of uncertainty, which affects the reliability of predictive
  models. 

Active learning is a promising approach for improving the efficiency of
data-driven materials modeling by adaptively selecting the most informative
data points for further computations.
Currently, a common approach is to compute the entire dataset with a fixed
discretisation (e.g., plane-wave cutoff) chosen a priori (e.g. [^vanderOord]
and [^Merchant2023]), which may not optimally balance computational cost and
accuracy across diverse materials. 

By leveraging techniques to learn from data of heterogeneous quality [^Fisher2024]
the project aims to improve the accuracy, efficiency,
and reliability of data-driven materials modeling.

**Requirements:**
Strong programming skills, ideally Julia or Python; 
Experience with probabilistic machine learning methods, Gaussian processes, Bayesian optimisation; 
Experience in running DFT calculations is a bonus;
Basic knowledge of numerical methods for partial differential equations is a bonus.

[^vanderOord]: C. van der Oord, M. Sachs, D. P. Kovács, C. Ortner and G. Csányi . *Hyperactive learning for data-driven interatomic potentials*. npj Comput Mater 9, 168 (2023). DOI [10.1038/s41524-023-01104-6](https://doi.org/10.1038/s41524-023-01104-6)

[^Merchant2023]: A. Merchant, S. Batzner, S. S. Schoenholz, M. Aykol, G. Cheon and E. D. Cubuk. *Scaling deep learning for materials discovery*. Nature 624, 80-85 (2023). DOI [10.1038/s41586-023-06735-9](https://doi.org/10.1038/s41586-023-06735-9)

[^Fisher2024]: K. E. Fisher, M. F. Herbst and Y. M. Marzouk. *Multitask methods for predicting molecular properties from heterogeneous data.* Journal of Chemical Physics 161, 014114 (2024). DOI [10.1063/5.0201681](https://doi.org/10.1063/5.0201681)

----

## Reconstructing local features in Kohn-Sham Inversion
**Keywords:** Understanding errors in materials models

Density-functional theory (DFT) is one of the most widely used methods for simulations in 
chemistry and materials science. In a standard Kohn-Sham DFT calculation, the electron 
density is computed for a given effective potential. Kohn-Sham inversion asks the inverse 
question: Given an electron density, can we reconstruct the effective potential that produces 
it? Such inversions can provide insight into exact Kohn-Sham potentials and are useful for 
developing and benchmarking density-functional approximations. [^herbstKohnShamInversionMathematical2025][^bakkestuenMoreauYosidabasedKohnShamInversion2026] 

This inverse problem is mathematically and numerically challenging. In exact DFT, the 
universal density functional is in general not differentiable, such that the corresponding 
potential cannot always be obtained as a functional derivative. Moreau-Yosida regularisation 
gives a differentiable formulation and thereby a well-defined regularized density–potential 
relation.[^penzPerspectiveMoreauYosidaRegularisation2025]

In this project we will investigate how well high-frequency and strongly localized features 
of a potential can be reconstructed by Kohn-Sham inversion. We will study 
how the inversion depends on the numerical 
resolution, on the consistency of the wavefunction and density grids, and on how errors in 
the density and potential are measured. The aim is to understand how 
these choices influence the accuracy and stability of the reconstructed potential.
Depending on the interests of the student a more analytical (pen and paper) or numerical
(running test calculations) direction of the project is possible.

**Requirements:** Strong programming skills, ideally Julia; Background in numerical 
methods, optimisation, and Fourier-based discretisations; Basic 
knowledge of quantum mechanics and experience in density-functional theory are a bonus.

[^herbstKohnShamInversionMathematical2025]: M. F. Herbst, V. H. Bakkestuen, and A. Laestadius. *Kohn-Sham inversion with mathematical guarantees.* Phys. Rev. B **111**, 205143 (2025). DOI [10.1103/PhysRevB.111.205143](https://doi.org/10.1103/PhysRevB.111.205143)

[^bakkestuenMoreauYosidabasedKohnShamInversion2026]: V. H. Bakkestuen, M. F. Herbst, V. Falmår, M. Penz, and A. Laestadius. *Moreau-Yosida-based Kohn-Sham Inversion for Periodic Systems.* arXiv:[2606.19471](https://arxiv.org/abs/2606.19471) (2026).

[^penzPerspectiveMoreauYosidaRegularisation2025]: M. Penz, M. F. Herbst, T. Helgaker, and A. Laestadius. *Perspective on Moreau-Yosida Regularisation in Density-Functional Theory.* arXiv:[2511.06957](https://arxiv.org/abs/2511.06957) (2025).

----

## Analysing pseudopotential-functional mismatch
**Keywords:** Understanding errors in materials models

The key approximation in plane-wave density-functional theory (DFT)
is the usage of an approximate exchange-correlation (XC) functional.
In particular for each chosen XC functional an adapted pseudopotential model
needs to be developed as well, which has the purpose to model efficiently
and accurately the interactions of atoms and electrons in a way that it matches
the XC functional appropriately.

In recent years, new promising XC functionals such as r2SCAN [^r2SCAN]
have been developed, however adapted pseudopotentials have not yet become
widely available. As a result such promising new functionals are typically used with
inconsistent pseudopotentials.
In this project, we will analyse the error that this mismatch induces.
<!--
first for the simpler norm-conserving pseudopotentials and then for the
more advanced projector-augmented wave pseudopotential formalism.
-->

The goal of this project is to understand the discrepancy introduced
by a mismatch between pseudopotential and DFT functional.
Depending on the interests of the student this can be tackled more
as an *analytical project*, where we study
mathematically the variation of the model under a change in pseudopotential,
or in form of a *systematic numerical study*,
where we understand this effect by conducting
numerical experiments on standard DFT test problems.

**Requirements for the analytical direction:**
Numerical methods for partial differential equations;
Experience in numerical analysis of PDEs;
Experience in running DFT calculations is a bonus;

**Requirements for the numerical direction:**
Strong programming skills, ideally Julia or python;
Previous experience with running simulations
or with general solid-state physics and materials modelling is a bonus.

<!--
Analytical:
  Perturbative ansatz when electron count is conserved
  Re-perform verification study with mismatching pseudopotential.
  Perturbative ansatz when electron count is changing

Pseudopotential finetuning:
  Niklas: Pseudopotential by gradients could be a nice project
  now, to do the experiment from the paper with Niklas but better. A deeper look at
  smoothness preservation and how much norm conservation is violated. Next step
  is to include norm conservation in the loss function as a regularisation term
  directly in the bulk (skipping atomic calculations). Another bonus step is to
  include a Gaussian NLCC for GTH (as Willand 2013) and optimize those params as well.

Numerical:
  use r2SCAN01 as a meta-GGA for which we have AE reference EOS
  use ABINIT which has both NC and PAW mGGA support
  compare PBE x r2SCAN01 pseudos for NC x PAW
  look at other r2SCAN benchmark quantities if time allows
-->

[^r2SCAN]: James W. Furness, Aaron D. Kaplan, Jinliang Ning, John P. Perdew, and Jianwei Sun. *Accurate and Numerically Efficient r2SCAN Meta-Generalized Gradient Approximation.* The Journal of Physical Chemistry Letters **2020** 11 (19), 8208-8215. DOI [10.1021/acs.jpclett.0c02405](https://doi.org/10.1021/acs.jpclett.0c02405)

-----

## Differentiable Learning of Pseudopotentials
**Keywords:** Statistical machine learning; Learning better materials models

Pseudopotentials are an essential component of modern plane-wave
density-functional theory (DFT) computations for materials.
Their construction represents a fundamental trade-off between smoothness (or "softness"),
which dictates the computational cost, and transferability across diverse chemical environments.

Standard generation involves a two-phase approach: fitting parameters to isolated atoms,
followed by validation in bulk systems (e.g. [^pseudodojo]). In practice, this process is
frequently repeated in an iterative trial-and-error fashion to semi-automatically navigate this trade-off.

In this project, we aim at a more targeted optimisation using gradient information.
We will explore the learning of pseudopotentials directly in bulk materials,
utilizing recent algorithmic differentiation (AD) tools for plane-wave DFT [^addfpt].
The goal is to minimize errors against high-precision all-electron references automatically,
yielding potentials that are both efficient and highly accurate for specific applications.

**Requirements:** 
Strong numerical programming skills, ideally Julia or Python;
Understanding of gradient-based optimisation methods; Bonus: Prior knowledge about DFT.

[^pseudodojo]: M.J. van Setten, M. Giantomassi, E. Bousquet, M.J. Verstraete, D.R. Hamann, X. Gonze, & G.-M. Rignanese (2018). *The PseudoDojo: Training and grading a 85 element optimized norm-conserving pseudopotential table*. Computer Physics Communications, 226, 39-54. DOI [10.1016/j.cpc.2018.01.012](https://doi.org/10.1016/j.cpc.2018.01.012)

[^addfpt]: N. F. Schmitz, B. Ploumhans, M. F. Herbst. (2025) *Algorithmic differentiation for plane-wave DFT: materials design, error control and learning model parameters*. npj Computational Materials (*in press*). DOI [10.1038/S41524-025-01880-3](https://doi.org/10.1038/S41524-025-01880-3) (Preprint: https://arxiv.org/abs/2509.07785)

-----

## Quantifying the discretisation error in material structure computations
**Keywords:** Understanding errors in materials models

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
- **Band structures**, which are often a first step in the computation of more advanced properties such as electrical resistivity and optical absorption.


**Requirements:**
Strong programming skills, ideally Julia or python;
Basic knowledge of numerical methods for partial differential equations;
Experience in numerical analysis of PDEs is a bonus;
Experience in running DFT calculations is a bonus;

[^CDKL2022]: E. Cancès, G. Dusson, G. Kemlin and A. Levitt. SIAM J. Sci. Comp. **44** (2022). ArXiv [2111.01470](https://arxiv.org/abs/2111.01470v2)

<!--
α-Manangese structures (see noteworthy systems)
(if stress) MOF structures

Use Hessian from foundational model
Use GP Hessian trained on geoopt trajectory (energy + forces), perhaps with foundational model as prior

-->
