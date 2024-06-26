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

## Accelerating structure optimisations using perturbative post-processing
High-throughput studies, where thousands to tens of thousands of materials are
simulated, are a powerful tool for broadening our knowledge of materials
properties and discovering new and interesting functional materials. A key step
in many of these studies is structure optimisation, in which an approximate
arrangement of atoms in a crystal is optimized to the most stable
configuration.

Since each iterative step of the associated with this optimisation is roughly
as expensive as a single-point calculation of ground state energy, atomic
structure optimisation accounts for a substantial amount of computational time
in high-throughput workflows. Additionally, the obtained minimal-energy
geometry can be highly dependent on the chosen numerical parameters for the
calculation, such as the basis set cutoff. Therefore, a good compromise between
the error of a too small cutoff and a too slow (but accurate) structure
optimisation needs to be found.

Along this direction, mathematical research has provided a number of new tools
in the past years to (a) estimate the numerical error due to basis set
discretisations and (b) correct for this error using post-processing
techniques. For the force as the key quantity of interest in structure
optimisations, a promising perturbative approach has emerged recently[^CDKL2022].
A preliminary implementation of this force-refinement strategy is already
available in the [density-functional toolkit (DFTK)](https://dftk.org).
DFTK is a software our group develops in collaboration with researchers all
across the world and which enables joint research between
mathematicians and scientists on first-principle materials simulations.

The goal of this project will be to integrate DFTK with [AiiDA](https://www.aiida.net/),
a software developed at the [THEOS group](http://theossrv1.epfl.ch/) here at EPFL.
AiiDA is a software framework written in Python
which simplifies and automates workflows for high-throughput studies. By
integrating DFTK with AiiDA, we want to both test the force refinement approach
on a broader range of systems and unlock this cheaper route to structure
optimisations for broader use.

**Requirements:**
Strong programming skills in particular python;
knowledge of Julia programming is a bonus, but can also be acquired as we go along;
interest in learning about the numerical and mathematical underpinnings of
first-principle based materials simulations.

[^CDKL2022]: E. Cancès, G. Dusson, G. Kemlin and A. Levitt. SIAM J. Sci. Comp. **44** (2022). ArXiv [2111.01470](https://arxiv.org/abs/2111.01470v2)

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

[^CKL2021]: E. Cancès, G. Kemlin, A. Levitt SIAM J. Mat. Anal. Appl. **42**, 243 (2021). DOI [10.1137/20m1332864](http://dx.doi.org/10.1137/20m1332864)
[^DGYZ2022]: X. Dai, S. de Gironcoli, B. Yang, A. Zhou. Multiscale Model. Simul. **21**, 777 (2023). DOI [10.1137/22M1472103](https://doi.org/10.1137/22M1472103)
[^Manopt]: <https://www.manopt.org/> and <https://manoptjl.org/>

----

## A mathematical look at modelling superconductor candidate materials with Hubbard corrections
The study of transition-metal compounds using density-functional theory (DFT) is an established approach
and has in the past been involved with the discovery of novel cathodes for Li batteries,
thermoelectric devises or photovoltaic materials. Recently the literature discussion surrounding
[LK-99](https://en.wikipedia.org/wiki/LK-99) is yet another example where DFT calculations
are playing an important role to understand the effects of the copper (transition metal)
doping[^Lk99griffin] in the lead phosphate apatite matrix. Unfortunately employing plain
semi-local DFT is not sufficient to capture the physics of many transition-metal compounds
due to the strongly localised and partially filled $d$-orbitals being inappropriately
described. As a remedy the so-called Hubbard corrections[^Hubbard] have been proposed
and excessively studied over the past years[^SelfConsistentU].

Within DFTK Hubbard corrections are so far missing.
Moreover many fundamental mathematical and numerical aspects
surrounding Hubbard corrections are so far understudied.
As part of this project you will implement Hubbard corrections into DFTK
and use them to study open problems with respect to standard task
in electronic structure theory, such as the SCF convergence
or the geometry optimisation related to DFT+U methods.

**Requirements:**
Strong programming skills; basic knowledge of quantum mechanics in solid-state physics;
knowledge of Julia programming is a bonus, but can also be acquired as we go along;
interest in learning about the numerical and mathematical underpinnings of
first-principle based materials simulations.

[^Lk99griffin]: S. M. Griffin. *Origin of correlated isolated flat bands in copper-substituted lead phosphate apatite*. ArXiv [2307.16892](https://arxiv.org/pdf/2307.16892.pdf)
[^Hubbard]: V. I. Anisimov, J. Zaanen and O. K. Andersen. Phys. Rev. B **44**, 943 (1991). DOI [10.1103/physrevb.44.943](http://dx.doi.org/10.1103/physrevb.44.943)
[^SelfConsistentU]: I. Timrov, N. Marzari and M. Cococcion. Phys. Rev. B **98** (2018). DOI [10.1103/physrevb.98.085127](http://dx.doi.org/10.1103/physrevb.98.085127)

----

## Reduced precision and GPU performance of DFTK

DFTK currently provides preliminary support for running calculations on
CUDA-based graphics processing units (GPUs). Support for HIP-based GPU
(e.g. the ones by AMD) is on the way. In its current stage the GPU code
still requires substantial performance improvements to be competitive.
The main task of this project is to employ Julia's profiling and benchmarking
tools to assess and improve the GPU performance of DFTK. Along the line
we will further explore the opportunities of the Julia programming language
to enable reduced precision (e.g. single precision) DFT computations,
which are ideally suited to run on GPUs.
<!--
In this project we want to explore the opportunities of the Julia
programming language for performing mixed-precision computation is density functional theory.
For this we will explore where single precision computations introduce inaccuracies
and develop countermeasures using e.g. specific mixed-precision algorithms
or iterative post-processing techniques.

Along the lines
you will learn how GPU programming in Julia works and how to improve the
performance of a Julia code towards the HPC regime.
-->

**Requirements:**
Strong programming skills with experience in the implementation of algorithms
for high-performance computing;
knowledge of numerical linear algebra (e.g. Krylov methods);
knowledge of Julia programming is a bonus, but can also be acquired as we go along;
interest in learning Julia's hardware abstractions for GPU computing

----

## Curation of a benchmark set for mathematical research
The aim of this project is to use [AiiDA](https://www.aiida.net/)
in order to curate a dataset of test systems,
which can be used to automatically
test and benchmark algorithms
for density-functional theory.
This will be used both to compare the performance of DFTK
against other standard software in the field
and their respective algorithms.

**Requirements:**
Experience in running first-principle simulations in standard codes
such as VASP, ABINIT, QuantumEspresso; experience with AiiDA or DFTK is a bonus,
but can also be acquired as we go along.

----

## Active learning with adaptive discretization cost

Building large datasets with materials properties from density-functional theory (DFT) calculations
is a challenge. Active learning techniques try to efficiently query simulators iteratively,
based on a statistical model [^Garnett2023].
The computational cost of DFT is however not uniform across materials.
Understanding the cost for a given target accuracy is a problem of error control with numerical parameters.

One of the core parameters determining the cost of a DFT calculation is the
discretization. The baseline active-learning approach is computing with a fixed discretization
(plane-wave cutoff) chosen a priori for the whole dataset (e.g. [^vanderOord] and [^Merchant2023]).

The goal of this project is to formulate and implement an augmented active learning model which
can choose not only the next material structure to query but also choose an appropriate discretization adaptively,
trading off per-example uncertainty reduction against computational cost.

**Requirements:**
Strong programming skills; 
Basic knowledge of numerical methods for partial differential equations;
Experience with probabilistic machine learning methods is a bonus;
Experience in running DFT calculations is a bonus;

[^Garnett2023]: R. Garnett. *Bayesian Optimization*. Cambridge University Press (2023).

[^vanderOord]: C. van der Oord, M. Sachs, D. P. Kovács, C. Ortner and G. Csányi . *Hyperactive learning for data-driven interatomic potentials*. npj Comput Mater 9, 168 (2023). DOI [10.1038/s41524-023-01104-6](https://doi.org/10.1038/s41524-023-01104-6)

[^Merchant2023]: A. Merchant, S. Batzner, S. S. Schoenholz, M. Aykol, G. Cheon and E. D. Cubuk. *Scaling deep learning for materials discovery*. Nature 624, 80–85 (2023). DOI [10.1038/s41586-023-06735-9](https://doi.org/10.1038/s41586-023-06735-9)

----

## Error propagation in statistical learning for data of heterogeneous quality

Data-driven materials modeling has been shown to be essential in modern materials discovery. Statistical models trained on large datasets of first-principle simulations provide efficient and accurate predictions of materials properties, reducing the need for costly computations. However, the underlying assumption of uniformly high-quality training data doesn't always meet reality. When faced with data from diverse sources, incorporating the different level of uncertainty in the data is necessary to ensure accurate predictionsof the Quantity of Interest.

In this project, we will use Gaussian Process (GP) regression that offers an approach to efficiently handle data with varying quality. It provides not only probabilistic predictions but also quantifies the uncertainty associated with each prediction [^RasmussenWilliams06].

The focus will be on exploring the potential of error propagation within GP regression with non-uniform noise model, as well as evaluating the accuracy of the developed model to ensure its applicability for practical data-driven materials modelling.

**Requirements:**
Strong programming skills, ideally Julia or Python; experience with probabilistic machine learning methods, Gaussian Processes, Bayesian optimization; experience with DFTK is a bonus; basic knowledge of numerical methods for partial differential equations is a bonus.


[^RasmussenWilliams06]: C. E. Rasmussen & C. K. I. Williams, Gaussian Processes for Machine Learning, the MIT Press, 2006. DOI [3206.001.0001](https://doi.org/10.7551/mitpress/3206.001.0001)

