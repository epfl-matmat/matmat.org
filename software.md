@def title = "Software"

# Software
In computational science software is the central platform.
It serves both to develop new ideas and algorithms,
but also to test them on application-relevant problems,
which in turn frequently needs to new research directions
from the uncovered flaws and insufficiencies.

Even more so in the interdisciplinary [research setting](/research)
of the MatMat group software also serves as the scaffolding,
which coordinates and collects the advances from various
disciplinary communities. With this in mind a primary focus
in our software projects is thus to make our codes accessible
across research backgrounds and in this way facilitate
cross-community fertilisation.
Our software is open-source,
see [**epfl-matmat on github**](https://pasc23.pasc-conference.org/program/schedule/),
and often developed in collaboration with contributors across the globe.

\toc

## DFTK: The density-functional toolkit
![DFTK research fields](/assets/dftk.png)

The [Density-Functional ToolKit](https://dftk.org)[^DFTK] is a Julia-based code
for plane-wave density-functional theory simulations, which our group
co-develops and employs to conduct the majority of our research
(see [Self-adapting simulations](/research/self_adapting_simulations/)
and [Estimation of simulation error](/research/error_estimation/)).
DFTK was started in 2019 and despite only 7500 lines of code
we unlocked a [sizable feature set](https://docs.dftk.org/stable/features/).
This includes an efficiency to routinely treat **systems beyond 1000 electrons**
(using MPI / GPU parallelisation)
and at the same time support for **arbitrary reduced models**
(e.g. analytical potentials, Gross-Pitaevskii-type problems, reduced dimensionality).
Non-standard features include built-in support for
[**automatic differentation**](/research/error_estimation/) and
[**arbitrary precision**](/research/self_adapting_simulations/),
which make DFTK the ideal prototyping platform for solid-state DFT methods.

For some introductory material about DFTK,
see the [DFTK documentation](https://docs.dftk.org/stable/guide/introductory_resources/).

## JuliaMolSim and AtomsBase: Julia-based atomistic modelling
~~~<img width="100px" alt="juliamolsim" src="/assets/juliamolsim.png" />~~~

Our group participates in ongoing community efforts to build
the software infrastructure required for atomistic modelling in julia,
such as the ones grouped within the
[JuliaMolSim](https://github.com/JuliaMolSim/)
github organisation.

Most importantly this
includes [AtomsBase](https://github.com/JuliaMolSim/AtomsBase.jl),
a package providing a common interface for atomic structures
for other Julia packages to use.
With AtomsBase packages for parsing structure files
(e.g. [AtomsIO](https://github.com/mfherbst/AtomsIO.jl)), for visiualising
structures or for running simulations (such as [DFTK](https://dftk.org))
can seamlessly integrate, allowing a data-flow of atomistic structures
in a completely user-transparent way.

An overview on the state of julia tools for atomistic modelling,
showcasing these efforts in practice, gives the recent (May 2023)
[Julia for Materials](https://mfherbst.github.io/julia-for-materials/)
seminar talk by Michael
([Youtube recording](https://www.youtube.com/watch?v=dujepKxxxkg)).

## ReducedBasis: Spin systems and parametrised eigenproblems
With [ReducedBasis](https://github.com/mfherbst/ReducedBasis.jl) we developed
a Julia package to accelerate the setting, where one wishes to solve a parametrised
eigenproblems for a number of parameter instances with low to medium precision.
Our main interest for developing this package is our
[work on quantum spin systems](/research/spin_systems/),
where the strength of interaction between the spins
are the parameters of the problem. In turn solving a single eigenproblem
requires expensive methods, for example tensor network approaches (MPS, DMRG),
which can easily take hours to days per instantce.
With ReducedBasis we manage to drastically reduce the number of parameter instances
where the eigenproblem needs to be solved for standard tasks
(e.g. phase diagrams)[^ReducedBasis]. The code makes it easy to swap the considered
eigenproblem or the underlying solvers,
such that we believe this package to be useful beyond its original purpose.

## Other contributions
Other projects where we participate and regularly contribute include:

<!-- TODO Add small logos wherever possible -->

- [adc-connect](https://adc-connect.org): Hybrid python/C++ for rapid development of algebraic-diagrammatic construction methods (ADC), a Greens-function-based approach for computational spectroscopy.  
  *Contributions:* Michael initialised the project in 2018.
- [ddx](https://github.com/ddsolvation/ddX): Domain-decomposition-based approach to linear-scaling continuum solvation models for molecular quantum chemistry.  
  *Contributions:* Python/C interfaces and integration with Psi4 and adcc.
- [Psi4](https://psicode.org/): Open-source quantum-chemistry software suite.  
  *Contributions:* Interfaces to adcc and ddx, smaller fixes.
- [QCEngine](http://docs.qcarchive.molssi.org/projects/QCEngine/en/stable/): Unified programmable python interface for a number of quantum-chemistry software packages.  
  *Contributions:* adcc interface.

<!--
- [molsturm](https://molsturm.org): Proof-of-concept quantum-chemistry program for basis-function-agnostic quantum chemistry.
- [Q-Chem](https://www.q-chem.com/): Commercial quantum-chemistry software suite
-->

[^DFTK]: M. F. Herbst, A. Levitt, E. Cancès. JuliaCon Proceedings. **3**, 69 (2021). DOI <https://doi.org/10.21105/jcon.00069>

[^ReducedBasis]: P. Brehmer, M. F. Herbst, S. Wessel, M. Rizzi, B. Stamm. *Reduced basis surrogates for quantum spin systems based on tensor networks.* arXiv [2304.13587](https://arxiv.org/abs/2304.13587)
