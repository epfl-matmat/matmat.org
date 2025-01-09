+++
title = "Job Openings"
mintoclevel = 2
maxtoclevel = 3
+++


# Job Openings
This page lists the current PhD or PostDoc openings in our group.
If you are interested in working with us,
but no openings matching your profile,
you are still welcome to submit a general inquiry.

In any case, please **consider the [application guidelines](/jobs/guidelines/)**
before you contact us.

<!--
We like to give each serious candidates the proper consideration they deserve.
Unfortunately the large number of mass applications
with no connections to the projects or general research in our group
make it necessary to do a preliminary screening of candidates.
All applications not following these guidelines might be silently ignored.
-->

<!--
## Specific openings
Currently no specific openings to advertise.
-->

<!--

## PhD position: Self-adapting numerical methods for high-throughput DFT simulations

#### Background
Density-functional theory (DFT) is one of the most widely employed simulation methods
to predict the properties of materials from first principles.
An important application is the computational discovery of novel materials,
where many thousands of systematic simulations may be performed.
At this level a limiting factor remains the robustness of numerical schemes
for DFT simulations.

#### Project goals
In this project you will obtain and combine physical and mathematical insights
in order to develop algorithmic techniques,
which robustly adapt to the simulated material on the fly.
You will apply and extend existing results in numerical analysis
to obtain novel preconditioners
(building [upon previous work](https://michael-herbst.com/publications/2020.09.03_ldos_preconditioning.pdf))
as well as adaptive basis selection techniques.
Your methods will be implemented into codes
such as the [density-functional toolkit (DFTK)](https://dftk.org)
as well as the [SIRIUS](https://github.com/electronic-structure/SIRIUS) electronic structure library,
such that they can be tested in the high-throughput context.
You will be integrated into the materials simulation activities
at EPFL, e.g. within the [NCCR MARVEL](https://nccr-marvel.ch/),
and collaborate with physicists, mathematicians and computer scientists from EPFL, Switzerland and abroad.

#### Candidate profile
* You are highly motivated and want to become an independent researcher in a fascinating
  interdisciplinary field, working towards faster and more reliable methods
  for discovering the materials of tomorrow.
* You have a strong sense of autonomy and independence, but also enjoy being part of a diverse team.
* You have completed a Master (or 4-year Bachelor) in physics, mathematics or a related subject.
  Candidates who will complete their degree within the next months are also welcome to apply.
* Your academic record is strong and underpins your potential to become an excellent researcher.
* You have a broad background in computational physics, numerical mathematics or computer science
  and you look forward to acquiring expertise in domains beyond your current background.
* You have a strong interest in numerical methods, their implementation and application
  to physics and materials simulations.
* You enjoy programming and implementing algorithms and have solid experience
  in an HPC programming language such as C++, Fortran or Julia.
* You are fluent in written and oral English.
* Bonus skills for this application are considerable experience in
  numerical analysis, numerical linear algebra,
  high-performance computing, quantum physics,
  solid-state physics or Julia programming.

#### What is offered
The activities of the MatMat group revolve around understanding
modern materials simulations from a mathematical point of view
-- and to develop algorithms to make such simulations faster,
quantify their errors or make them more reliable.
You will become part of a young and energetic team,
fully integrated with both the mathematics and the materials institutes
as well as multiple cross-disciplinary initiatives,
such as the [NCCR MARVEL](https://nccr-marvel.ch/).
Guided by your research topic you have the opportunity
to grow substantially your background and obtain expertise
in theory as well as applications.
For this you have access to a stimulating community of researchers
at EPFL's main campus beautifully located at the lake Geneva shore.
For disseminating your work funds to attend suitable conferences
and workshops as well as potential visits to our collaboration partners
all over the world are provided.

The current regulations regarding salary and working conditions of PhD students at EPFL
can be found on the detailed websites on
[salary](https://www.epfl.ch/education/phd/doctoral-studies-structure/doctoral-students-salary),
[employment conditions](https://www.epfl.ch/about/working/working-at-epfl/employment-conditions)
and [PhD admission criteria](https://www.epfl.ch/education/admission/admission-2/phd-admission-criteria-and-application/).


#### Deadline and starting date
Continuous until a suitable candidate has been found.
Note, that the chosen candidate will have to be accepted into
one of the aforementioned doctoral schools
before the contract can start.
-->

## PostDoc position: Gradient-accelerated inverse materials design

#### Background
In inverse materials design one wishes to discover novel materials
in a targeting fashion. That is guided by systematic simulations of
the expected properties of candidate structures, one aims to find the
structure best matching a prescribed targeted property combination.
A common approach is to employ a statistical surrogate (e.g. within a Bayesian
Optimisation framework) such that the search only requires as few as possible
of the expensive first-principle simulations.
We will focus on approaches based on density-functional theory (DFT) simulation
-- an extremely common electronic-structure model.
For DFT our recent work on algorithmic differentiation techniques within the
[density-functional toolkit (DFTK)](https://dftk.org) is extremely promising
to be exploited for such inverse design searches, as it enables to compute
gradients of materials properties with respect to possible design parameters
in a simple and efficient way.

<!--
One of the most widely used methods for
modelling solid-state systems from first principles
is plane-wave density-functional theory (DFT).
A typical DFT simulation involves a number of modelling parameters,
typically bundled in the form of modelling components
such as the chosen pseudopotentials or the DFT functional.
These parameters in turn can be determined
employing some form of regression against higher-fidelity reference data,
making them inherently uncertain.
Propagating this uncertainty through a DFT simulation
for observing its influence on simulation output quantities
is to date hardly explored.
A main obstacle for such research is in particular
the challenging nature of DFT itself,
involving at its heart a non-linear, non-convex optimisation problem.
However, the recent implementation of algorithmic differentiation (AD)
capabilities to the [density-functional toolkit (DFTK)](https://dftk.org),
our in-house Julia-based DFT code,
provides novel and so far unexplored opportunities
for inference and uncertainty propagation.
-->

#### Project details
In this project we will explore the opportunities
of algorithmic differentiation
to accelerate inverse materials design,
e.g. by considering recent advances in first-order
Bayesian optimisation procedures (e.g. [^1]).
Your work will be integrated with similar
efforts in our group, e.g. to develop
multi-task Gaussian Process surrogates[^2]
for materials modelling.
Within ongoing collaborations with other materials simulation
groups at EPFL your advances can be directly developed
and tested within the scope of practical materials modelling problems.

<!--
The goal of this project is to investigate the opportunities
with respect to uncertainty quantification in DFT
enabled by AD. Due to the unexplored nature of this topic,
a variety of research questions
could be tackled, depending on your interest and prior background.
Examples could be multi-fidelity or gradient-accelerated
techniques for Bayesian regression of uncertainty models
or tailored inference strategies
making use of sensitivities and sensitivity derivatives.
By focusing on reduced physical settings
(which e.g. drop the non-linearities of DFT)
you could also approach these questions from an analytical point of view.
You will use DFTK to implement your ideas and perform numerical experiments
to back them up.
In collaboration with other researchers from our group
and the other materials simulation groups at EPFL
you will also work on scaling up your findings to the full DFT setting
and in this way provide first tests of your methods on application problems.
-->

#### Candidate profile
* You are motivated to tackle a challenging interdisciplinary research topic
  and push the state of Bayesian Optimisation methods
  for inverse materials design.
* You obtained your PhD in statistics, computational mathematics,
  method development for computational solid-state physics or a related subject.
* You have an excellent academic track record and demonstrated prior research experience
  in at least one of the following:
  - Quantum-chemical or materials simulations, computational materials design,
  - Bayesian optimisation, Bayesian experimental design or inverse problems
    with an application in physics or engineering simulations.
  <!--
  with Bayesian regression, multi-fidelity or multi-tasking methods
  or inverse problems.
  -->
* You enjoy collaborating with researchers from a diverse background
  and look forward to acquiring the broad skillset required
  for cross-disciplinary research in materials modelling.
  <!--
* You enjoy pen and paper analysis, but you are not afraid to implement and test your
  ideas in practice.
  -->
* You are experienced in working with larger scientific codes in a collaborative
  software development environment. You have a solid experience with
  the Julia programming language or you are fluent in a related language (Python, Matlab)
  and are curious to code in Julia.
* You are fluent in written and oral English.
* You enjoy occasionally supervising undergraduate students on topics related to your research.
* Bonus skills for this application are considerable experience in
  sustainable software engineering or high-performance computing.

#### What is offered
The activities of the MatMat group revolve around understanding
modern materials simulations from a mathematical point of view
-- and to come up with ways to make such simulations faster and quantify their errors.
You will become part of a young and energetic team,
fully integrated with both the [mathematics](https://math.epfl.ch/)
and the [materials](https://imx.epfl.ch/) institutes
as well as multiple cross-disciplinary initiatives,
such as the [NCCR MARVEL](https://nccr-marvel.ch/).
Within the proposed topic you will be able to bring in your prior expertise,
but also be able to get to know the exciting theory and practice of material modelling.
EPFL's main campus is beautifully located at the lake Geneva shore
hosting a stimulating community of interdisciplinary-minded researchers.
Funds to disseminate your work at suitable conferences
as well as potential visits to our international network of collaboration partners
are provided.

The position will be a fixed-term position (CDD) for initially 2 years,
renewable on a one-year basis.
Further extensions depend on progress and the funding situation.
For more information on working at EPFL see also
the website on [current employment conditions](https://www.epfl.ch/about/working/working-at-epfl/employment-conditions).

#### Deadline and starting date
Screening of candidates is done on a rolling basis
until a suitable candidate has been found, starting from 1st February 2025
The expected starting date is the first half of 2025, but can be negotiated.

[^1]: J. Wu, M. Poloczek, A. Wilson, P. Frazier. [*Bayesian Optimization with Gradients.*](https://proceedings.neurips.cc/paper_files/paper/2017/file/64a08e5f1e6c39faeb90108c430eb120-Paper.pdf) NeurIPS (2017).
[^2]: K. Fisher, M. F. Herbst, Y. Marzouk. [*Multitask methods for predicting molecular properties from heterogeneous data.*](https://arxiv.org/pdf/2401.17898) Journal of Chemical Physics (2024). [arXiv:2401.17898](https://arxiv.org/pdf/2401.17898)
