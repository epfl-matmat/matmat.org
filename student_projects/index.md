@def title = "Student projects"

# Student projects
Below are examples of projects our group can offer as semester or Master thesis projects.
This list is not exhaustive and other topics related to [our research](/research)
are equally possible. Several of the projects could also be adapted to the Bachelor level.

If you are interested in doing a project with us,
please make yourself familiar with **[general guidelines](/student_projects/guidelines)**
we follow during the project.
We will in general not accept or decline any project
until six weeks before the semester begins.

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

----

## Active learning with adaptive discretisation cost

Building large datasets with materials properties from density-functional
theory (DFT) calculations
is a challenge. Active learning techniques try to efficiently query simulators
iteratively,
based on a statistical model [^Garnett2023].
The computational cost of DFT is however not uniform across materials.
Understanding the cost for a given target accuracy is a problem of error
control with numerical parameters.

One of the core parameters determining the cost of a DFT calculation is the
discretisation. The baseline active-learning approach is computing with a fixed
discretisation
(plane-wave cutoff) chosen a priori for the whole dataset (e.g. [^vanderOord]
and [^Merchant2023]).

The goal of this project is to formulate and implement an augmented active
learning model which
can choose not only the next material structure to query but also choose an
appropriate discretisation adaptively,
trading off per-example uncertainty reduction against computational cost.

**Requirements:**
Strong programming skills, ideally Julia or python;
Basic knowledge of numerical methods for partial differential equations;
Experience with probabilistic machine learning methods is a bonus;
Experience in running DFT calculations is a bonus;

[^Garnett2023]: R. Garnett. *Bayesian Optimization*. Cambridge University Press (2023).

[^vanderOord]: C. van der Oord, M. Sachs, D. P. Kovács, C. Ortner and G. Csányi . *Hyperactive learning for data-driven interatomic potentials*. npj Comput Mater 9, 168 (2023). DOI [10.1038/s41524-023-01104-6](https://doi.org/10.1038/s41524-023-01104-6)

[^Merchant2023]: A. Merchant, S. Batzner, S. S. Schoenholz, M. Aykol, G. Cheon and E. D. Cubuk. *Scaling deep learning for materials discovery*. Nature 624, 80–85 (2023). DOI [10.1038/s41586-023-06735-9](https://doi.org/10.1038/s41586-023-06735-9)

----

## Manifold optimisation methods in density-functional theory

The problem underlying density-functional theory (DFT) is a minimisation of an energy functional
with respect to the density matrix. In turn the space of density matrices themselves
has the structure of a smooth manifold. However, instead of solving this minimisation
problem directly (termed *direct minimisation*, DM), most
codes solve DFT by satisfying the first-order stationarity conditions,
which leads to the self-consistent field (SCF) equations.
For some settings the convergence of direct minimisation can be superior[^CKL2021],
which has been stimulating for the recent mathematical studies
of DM approaches to DFT[^DGYZ2022].
In this project we want to build upon the readily available software stacks
for optimisations on manifolds[^Manopt] and explore the use of their readily
available manifold optimisation routines in the context of DFT approaches.

**Requirements:**
Strong programming skills, ideally Julia or python;
Basic knowledge of Riemannian optimisation;
Basic knowledge of numerical methods for partial differential equations;
Experience in numerical analysis of PDEs is a bonus;
Experience in running DFT calculations is a bonus;

<!--
https://ronnybergmann.net/talks/2024-Aachen-Difference-of-Convex-Manopt.pdf
ManOpt.jl:
* ManifoldCostGradientObjective
-->

[^CKL2021]: E. Cancès, G. Kemlin, A. Levitt SIAM J. Mat. Anal. Appl. **42**, 243 (2021). DOI [10.1137/20m1332864](http://dx.doi.org/10.1137/20m1332864)
[^DGYZ2022]: X. Dai, S. de Gironcoli, B. Yang, A. Zhou. Multiscale Model. Simul. **21**, 777 (2023). DOI [10.1137/22M1472103](https://doi.org/10.1137/22M1472103)
[^Manopt]: <https://www.manopt.org/> and <https://manoptjl.org/>

----

## Error propagation in statistical learning for data of heterogeneous quality

Data-driven materials modeling has been shown to be essential in modern materials discovery. 
Statistical models trained on large datasets of first-principle simulations provide efficient 
and accurate predictions of materials properties, reducing the need for costly computations. 
However, the underlying assumption of uniformly high-quality training data doesn't always meet reality. 
When faced with data from diverse sources, incorporating the different level of uncertainty in the data 
is necessary to ensure accurate predictions of the quantity of interest.

In this project, we will use Gaussian Process (GP) regression that offers an approach to efficiently 
handle data with varying quality, providing probabilistic predictions which enable 
quantification of uncertainty [^RasmussenWilliams06]. We will explore the potential of error propagation 
within GP regression with non-uniform noise model, and evaluate the accuracy of the developed model to ensure 
its applicability for practical data-driven materials modelling.

**Requirements:**
Strong programming skills, ideally Julia or Python; 
experience with probabilistic machine learning methods, Gaussian Processes, Bayesian optimization; 
experience with DFTK is a bonus; 
basic knowledge of numerical methods for partial differential equations is a bonus.


[^RasmussenWilliams06]: C. E. Rasmussen & C. K. I. Williams, Gaussian Processes for Machine Learning, the MIT Press, 2006. DOI [3206.001.0001](https://doi.org/10.7551/mitpress/3206.001.0001)

----

## Implementing a differentiable solver for the electronic structure of atoms

Solutions from atomic calculations are a key building block to reduce
the computational cost of larger calculations of molecules and materials [^Martin2020].
For example, the construction of pseudopotentials depends on solving challenging
inverse problems on top of single atom calculations. Automatic differentiation, 
the ability to compute arbitrary parameter derivatives,
enables development of novel methods using gradient-based optimization and error propagation[^Blondel2024][^Sapienza2024].

The goal of this project is to implement a differentiable DFT code for isolated atoms in Julia.
An important focus will be mathematical correctness and careful validation against high accuracy reference results.


**Requirements:**

Strong numerical programming skills.
Working knowledge of numerical methods for differential equations.
Understanding of automatic differentiation (e.g. Julia, JAX, PyTorch) is a bonus.
Knowledge of quantum physics is a bonus but not required.

[^Martin2020] Martin RM. Electronic Structure: Basic Theory and Practical Methods. 2nd ed. Cambridge University Press; 2020. DOI [10.1017/9781108555586](https://doi.org/10.1017/9781108555586)

[^Blondel2024] Blondel, Mathieu, and Vincent Roulet. "The elements of differentiable programming." arXiv preprint [arXiv:2403.14606](https://arxiv.org/abs/2403.14606) (2024).

[^Sapienza2024] Sapienza, F., Bolibar, J., Schäfer, F., Groenke, B., Pal, A., Boussange, V., Heimbach, P., Hooker, G., Pérez, F., Persson, P.O. and Rackauckas, C., 2024. Differentiable Programming for Differential Equations: A Review. arXiv preprint [arXiv:2406.09699](https://arxiv.org/abs/2406.09699)
