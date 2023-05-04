@def title = "Student projects"

# Student projects
Below are examples of projects our group can offer as semester or Master thesis projects.
This list is not exhaustive and other topics related to [our research](/research)
are equally possible. Several of the projects could also be adapted to the Bachelor level.

If you are interested in doing a project with us, please email the relevant project
proposer, mentioning your grades in all relevant classes.

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

**Contact:** [Michael F. Herbst](mailto:michael.herbst@epfl.ch) or [Austin Zadoks](mailto:austin.zadoks@epfl.ch)

[^CDKL2022]: E. Cancès, G. Dusson, G. Kemlin and A. Levitt. SIAM J. Sci. Comp. **44** (2022). ArXiv [2111.01470](https://arxiv.org/abs/2111.01470v2)
[^Aiida]: S. Huber, et al. Scientific Data. **7**, 300 (2020). https://www.aiida.net/


----

## Curation of a dataset of benchmark systems for mathematical research
The aim of this project is to use [AiiDA](https://www.aiida.net/)
in order to curate a dataset of test systems,
which can be used to automatically
test and benchmark algorithms
for density-functional theory.
This will be used both to compare the performance of DFTK
against other standard softwares in the field
and their respective algorithms.

A more detailed description will follow soon.

**Requirements:**
Experience in running first-principle simulations in standard codes
such as VASP, ABINIT, QuantumEspresso; expericence with AiiDA or DFTK is a bonus,
but can also be acquired as we go along

**Contact:** [Michael F. Herbst](mailto:michael.herbst@epfl.ch)
