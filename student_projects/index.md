@def title = "Student projects"

# Student projects
Below are examples of projects our group can offer as **semester** or **Master thesis** projects.
This list is not exhaustive and other topics related to [our research](/research)
are equally possible. Several of the projects could also be adapted to the Bachelor level.
Additionally we typically have some projects available for **paid student research work**,
i.e. projects outside of the requirements of your study curriculum. Contact us if interested.

If you are interested in doing a semester project or Master thesis with us,
please make yourself familiar with **[general guidelines](/student_projects/guidelines)**
we follow for project allocation as well as during the project.

Overview of projects:

\toc

----

## Quantifying the discretisation error in structure optimisations
A key step when simulating the properties of a material is structure optimisation.
In this process
an approximate arrangement of atoms in a crystal is optimised
to obtain the most stable configuration.
In this work we will investigate how reducing the size
of the discretisation basis employed for the simulations
impacts the quality of the obtained structure.
Moreover we will employ recent perturbative
error estimates[^CDKL2022] in order to quantify the expected error in the obtained
structure versus a fully converged discretisation.
For this work we will employ the
[density-functional toolkit (DFTK)](https://dftk.org),
a first-principle materials simulation code based on density-functional theory
in which the aforementioned error estimates are implemented and readily available.

**Requirements:**
Strong programming skills, ideally Julia or python;
Basic knowledge of numerical methods for partial differential equations;
Experience in numerical analysis of PDEs is a bonus;
Experience in running DFT calculations is a bonus;

[^CDKL2022]: E. Cancès, G. Dusson, G. Kemlin and A. Levitt. SIAM J. Sci. Comp. **44** (2022). ArXiv [2111.01470](https://arxiv.org/abs/2111.01470v2)

<!--
α-Manangese structures (see noteworthy systems)
(if stress) MOF structures
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

----

## A differentiable solver for the electronic structure of atoms

Solutions from atomic calculations are a key building block to reduce
the computational cost of larger calculations of molecules and materials [^Martin2020].
For example, the construction of pseudopotentials depends on solving challenging
inverse problems on top of single atom calculations. Automatic differentiation, 
the ability to compute arbitrary parameter derivatives,
enables development of novel methods using gradient-based optimization and error propagation[^Blondel2024][^Sapienza2024].

The goal of this project is to implement a differentiable DFT code for isolated atoms in Julia.
An important focus will be mathematical correctness and careful validation against high accuracy reference results.

**Requirements:** Strong numerical programming skills.
Working knowledge of numerical methods for differential equations.
Understanding of automatic differentiation (e.g. Julia, JAX, PyTorch) is a bonus.
Knowledge of quantum physics is a bonus but not required.

[^Martin2020]: Martin RM. Electronic Structure: Basic Theory and Practical Methods. 2nd ed. Cambridge University Press; 2020. DOI [10.1017/9781108555586](https://doi.org/10.1017/9781108555586)

[^Blondel2024]: Blondel, Mathieu, and Vincent Roulet. "The elements of differentiable programming." arXiv preprint [arXiv:2403.14606](https://arxiv.org/abs/2403.14606) (2024).

[^Sapienza2024]: Sapienza, F., Bolibar, J., Schäfer, F., Groenke, B., Pal, A., Boussange, V., Heimbach, P., Hooker, G., Pérez, F., Persson, P.O. and Rackauckas, C., 2024. Differentiable Programming for Differential Equations: A Review. arXiv preprint [arXiv:2406.09699](https://arxiv.org/abs/2406.09699)

---

## Symmetry-Aware Automatic Differentiation in DFT Calculations

This project is to extend DFTK's symmetry handling capabilities to work with automatic differentiation. The project involves deriving methods that combine crystallographic symmetry analysis[^Togo2024] with derivative computations, helping to optimize density-functional theory calculations [^DFTKsymmetrydocs]. This would be a fruitful contribution the the open-source DFTK framework.

**Requirements:**
Solid numerical programming skills, ideally in Julia or python; Basic understanding of group theory; Bonus: Prior knowledge about DFT.

[^Togo2024]: Togo, A., Shinohara, K., & Tanaka, I. (2024). Spglib: a software library for crystal symmetry search. Science and Technology of Advanced Materials: Methods, 4(1). https://doi.org/10.1080/27660400.2024.2384822

[^DFTKsymmetrydocs]: https://docs.dftk.org/stable/developer/symmetries/

---

## High-throughput automated verification of DFTK on a large set of systems

Density-functional theory (DFT) calculations are a key tool used to simulate the properties of materials.
There exist many implementations of DFT for solid-state physics (e.g. ABINIT, Quantum ESPRESSO, VASP),
each solving the same problem in principle but with different internal choices and different sets of parameters.

To validate the consistency of these implementations, verification studies have been performed recently,
such as [^VerificationStudy2023] built on top of [AiiDA](https://aiida.net).
AiiDA is a software developed at the [THEOS group](http://theossrv1.epfl.ch/) here at EPFL,
which simplifies and automates workflows for high-throughput studies.

In our group, we develop a new player in the field:
the [density-functional toolkit (DFTK)](https://dftk.org).
DFTK is a new implementation developed in collaboration with researchers all
across the world and which enables joint research between
mathematicians and scientists on first-principle materials simulations.

We have developed an interface between AiiDA and DFTK already,
but it has only received limited usage and lacks automated handling of common failures.

The goal of this project is to extend the verification study to DFTK
and its novel mathematically-inspired algorithms[^Herbst2020][^Herbst2022].
We will start by running with the datasets from [^VerificationStudy2023].
Along the way, we will encounter many systems where convergence fails.
We will implement automated error detection, handling, and restarting for the most common error cases.
We will then extend the verification to more complex systems,
which are known to be difficult to converge even with established codes.

<!--

- Implement and make use of heuristics such as
  https://github.com/aiidateam/aiida-quantumespresso/pull/987/
  in DFTK

- Implement adaptive damping plus potential mixing

- Aiida-based benchmark set for testing various kinds of issues in DFT calculations
  * Focus: Automatic Benchmarking of performance of algorithms
  * Goal: Easily accessible, also for mathematicians
  * Based on SCF-xn, maybe even including beyond SCF data
  * Use that as a way to prove that LDOS, adaptive damping etc. work and reduce
    computational cost

- Do a proper timing comparision between DFTK and (Vaps, QE, Abinit) on
  * Small system (Xe, 1 kpt)
  * Surface e.g. Al2 (16 kpts)
  * Fe unit cell (1000 kpts)

-->

**Requirements:**
Good programming skills, ideally Julia or Python;
Experience in solid-state physics and materials modelling is a bonus;
Experience with running DFT simulations and/or running programs on a supercomputer is a bonus.

[^VerificationStudy2023]: Bosoni, E., Beal, L., Bercx, M. et al. *How to verify the precision of density-functional-theory implementations via reproducible and universal workflows.* [Nat Rev Phys 6, 45–58 (2024).](https://doi.org/10.1038/s42254-023-00655-3)
[^Herbst2020]: M. F. Herbst & A. Levitt *Black-box inhomogeneous preconditioning for self-consistent field iterations in density functional theory*. J. Phys. Cond. Matt. **33**, 085503 (2020). DOI [10.1088/1361-648x/abcbdb](https://doi.org/10.1088/1361-648x/abcbdb)
[^Herbst2022]: M. F. Herbst & A. Levitt *A robust and efficient line search for self-consistent field iterations* J. Comput. Phys. **459**, 111127 (2022). DOI [10.1016/j.jcp.2022.111127](http://dx.doi.org/10.1016/j.jcp.2022.111127)
