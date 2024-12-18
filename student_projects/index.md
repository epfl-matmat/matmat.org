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
A key step when simulating the properties of a material is structure optimisation,
in which an approximate arrangement of atoms in a crystal is optimized
to the most stable configuration.
In this work we will investigate how reducing the size
of the discretisation basis impacts the quality of the obtained structure
in such a structure optimisation. Moreover we will employ recent perturbative
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

----

## Data-driven materials modelling with uncertainty-informed Gaussian processes

Modern materials discovery relies heavily on data-driven methods to efficiently and accurately predict material properties, 
using datasets generated from density-functional theory (DFT) calculations. 
However, these datasets often face two key challenges:

- Non-uniform computational cost: The cost of DFT calculations varies significantly across materials due to differences in numerical parameters (discretisation basis, k-point sampling, tolerances) required for a given accuracy. The baseline active learning approach is computing with a fixed discretisation (plane-wave cutoff) chosen a priori for the whole dataset (e.g. [^vanderOord] and [^Merchant2023]), which may not optimally balance cost and accuracy across diverse materials.

- Data heterogeneity: Training data often come from diverse sources, exhibiting varying levels of uncertainty, which affects the reliability of predictive models. 

The goal of this project is to develop a framework that overcomes these challenges by integrating adaptive learning with uncertainty-aware models. This involves formulating an active learning approach that adaptively selects both material structures and numerical parameters to optimize computational resources, while employing Gaussian Process regression [^RasmussenWilliams06] to effectively propagate and manage uncertainties in heterogeneous datasets. By combining these techniques, the project aims to improve the accuracy, efficiency, and reliability of data-driven materials modeling.


**Requirements:**
Strong programming skills, ideally Julia or python; 
Basic knowledge of numerical methods for partial differential equations; 
Experience with probabilistic machine learning methods is a bonus; 
Experience in running DFT calculations is a bonus.

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
