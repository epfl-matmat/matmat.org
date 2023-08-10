@def title = "Student projects"

# Student projects
Below are examples of projects our group can offer as semester or Master thesis projects.
This list is not exhaustive and other topics related to [our research](/research)
are equally possible. Several of the projects could also be adapted to the Bachelor level.

If you are interested in doing a project with us,
**email the project proposer**, mentioning your grades in all relevant classes.
Please be aware of the **[general guidelines](/student_projects/guidelines)**.

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

**Contact:** [Michael F. Herbst](https://people.epfl.ch/michael.herbst) or [Austin Zadoks](mailto:austin.zadoks@epfl.ch)

[^CDKL2022]: E. Cancès, G. Dusson, G. Kemlin and A. Levitt. SIAM J. Sci. Comp. **44** (2022). ArXiv [2111.01470](https://arxiv.org/abs/2111.01470v2)
[^Aiida]: S. Huber, et al. Scientific Data. **7**, 300 (2020). https://www.aiida.net/

----

## A mathematical look at modelling superconductor candidate materials with Hubbard corrections
The study of transition-metal compounds using density-functional theory (DFT) is an established approach
and has in the past been involved with the discovery of novel cathodes for Li batteries,
thermoelectric devises or photovoltaic materials. Recently the literature discussion surrounding
[LK-99](https://en.wikipedia.org/wiki/LK-99) as a promising candidate for high-temperature
superconductivity is yet another example where DFT calculations are playing an important role
to understand the effects of the copper (transition metal) doping [^Lk99griffin] in the
lead phosphate apatite matrix. Unfortunately employing plain semi-local DFT is not sufficient
to capture the physics of many transition-metal compounds due to the strongly localised
and partially filled $d$-orbitals being inappropriately described. As a remedy the
so-called Hubbard corrections [^Hubbard] have been proposed and excessively studied
over the past years [^SelfConsistentU]. Practically all theoretical studies of LK-99
employ Hubbard corrections to make their predictions
(see e.g. the [list on wikipedia](https://en.wikipedia.org/wiki/LK-99)).

Within DFTK Hubbard corrections are so far missing.
Moreover many fundamental mathematical and numerical aspects
surrounding Hubbard corrections are so far understudied.
As part of this project you will (a) implement Hubbard corrections into DFTK,
(b) use them to simulate the bands of LK-99,
and (c) investigate numerical techniques to improve the SCF convergence of DFT
calculations with Hubbard corrections (termed also DFT+U calculations).

**Requirements:**
Strong programming skills; basic knowledge of quantum mechanics in solid-state physics;
knowledge of Julia programming is a bonus, but can also be acquired as we go along;
interest in learning about the numerical and mathematical underpinnings of
first-principle based materials simulations.


**Contact:** [Michael F. Herbst](https://people.epfl.ch/michael.herbst), [Iurii Timrov](https://people.epfl.ch/iurii.timrov)

[^Lk99griffin]: S. M. Griffin. *Origin of correlated isolated flat bands in copper-substituted lead phosphate apatite*. ArXiv [2307.16892](https://arxiv.org/pdf/2307.16892.pdf)
[^Hubbard]: V. I. Anisimov, J. Zaanen and O. K. Andersen. Phys. Rev. B **44**, 943 (1991). DOI [10.1103/physrevb.44.943](http://dx.doi.org/10.1103/physrevb.44.943)
[^SelfConsistentU]: I. Timrov, N. Marzari and M. Cococcion. Phys. Rev. B **98** (2018). DOI [10.1103/physrevb.98.085127](http://dx.doi.org/10.1103/physrevb.98.085127)

----

## Performance optimisation of GPU routines in DFTK

DFTK currently provides preliminary support for running calculations on
CUDA-based graphics processing units (GPUs). Support for HIP-based GPU
(e.g. the ones by AMD) is on the way. In its current stage the GPU code
still requires substantial performance improvements to be competitive.
The main task of this project is to employ Julia's profiling and benchmarking
tools to assess and improve the GPU performance of DFTK. Along the lines
you will learn how GPU programming in Julia works and how to improve the
performance of a Julia code towards the HPC regime.

If time permits we might also target an extension of the overall GPU support in DFTK
towards new platforms (e.g. Intel) or new routines in DFTK.

**Requirements:**
Strong programming skills with experience in the implementation of algorithms
for high-performance computing;
knowledge of Julia programming is a bonus, but can also be acquired as we go along;
interest in learning Julia's hardware abstractions for GPU computing

**Contact:** [Michael F. Herbst](https://people.epfl.ch/michael.herbst)

----

## Mixed-precision approaches in density-functional theory
In this project we want to explore the opportunities of the Julia
programming language for performing mixed-precision computation is density functional theory.
For this we will explore where single precision computations introduce inaccuracies
and develop countermeasures using e.g. specific mixed-precision algorithms
or iterative post-processing techniques.

**Requirements:**
Strong background in numerical linear algebra in particular Krylov methods;
considerable programming skills in python or Matlab;
knowledge of Julia programming is a bonus, but can also be acquired as we go along

**Contact:** [Michael F. Herbst](https://people.epfl.ch/michael.herbst)

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

**Contact:** [Michael F. Herbst](https://people.epfl.ch/michael.herbst)

