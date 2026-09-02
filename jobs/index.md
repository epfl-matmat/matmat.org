+++
title = "Job Openings"
mintoclevel = 2
maxtoclevel = 3
+++

# Job Openings
This page lists the current openings in our group
(PostDoc, PhD, summer projects).
If you are looking for a PhD or PostDoc position with us,
but no openings matching your profile,
you are still welcome to submit a general inquiry.

In any case, please **consider the [application guidelines](/jobs/guidelines/)**
before you contact us.

<!--
## Specific openings

Currently no specific openings to advertise.
-->

## PhD or PostDoc: Exploiting error control in first-principle materials modelling

Predicting the physical and chemical properties of materials today involves
multi-stage computational pipelines that typically involve expensive data
generation using first-principle models such as density-functional theory
as well as the training of machine-learning surrogates.
Each stage introduces both modelling and numerical
approximations, which propagate and compound.
As a result, trustworthy predictions require rigorous, quantitative error
estimates across the entire workflow, which to date is largely lacking.

In recent work, our group has worked on
quantifying simulation accuracy and improving models relying on algorithmic
differentiation techniques[^addfpt].
In this work we rely on specific DFT models with calibrated uncertainty estimates,
which were machine-learned from experimental data[^beef][^uafd].
Taking this data-driven idea further neural operator techniques[^fno]
offer both to improve accuracy of DFT predictions as well as the potential
to similarly estimate model uncertainty from the training procedure itself.
This offers numerous directions for follow-up research, which we want to explore
with a motivated PhD student or PostDoc to expand our team.
Possible topics include:

* Machine-learned interatomic potential surrogates informed by error
  estimation techniques in first-principle
  density-functional theory (DFT) simulations.
* Error estimation of DFT model predictions
* Constructing novel DFT models using data-driven techniques (machine-learned XC functionals)
* Algorithmic differentiation techniques to enable sensitivity analysis
  and goal-oriented uncertainty quantification


#### Candidate profile
* You are highly motivated and want to become an independent researcher in a fascinating
  interdisciplinary field, working towards faster and more reliable methods
  for discovering the materials of tomorrow.
* You have a strong sense of autonomy and independence, but also enjoy being part of a diverse team.
* You have completed a Master (or 4-year Bachelor) in physics, mathematics or a related subject.
  Candidates who will complete their degree within the next months are also welcome to apply.
* Your academic record is strong and underpins your potential to become an excellent researcher.
* The ideal candidate has a prior background in multiple of the following subject areas:
  Gaussian Process Regression, Bayesian techniques in uncertainty quantification,
  operator learning, mathematical structure of quantum physics, condensed matter physics,
  atomistic modelling, atomistic machine learning, electronic structure theory.
* While you may not have expertise in all of these domains you look forward
  to acquiring expertise in electronic structure theory and atomistic modelling.
* You have a strong interest in numerical methods, their implementation and application
  to physics and materials simulations.
* You enjoy programming and implementing algorithms and have solid experience
  in a programming language such as JAX, pytorch or Julia.
* You are fluent in written and oral English.
* Bonus skills for this application are considerable experience in
  sustainable software engineering or high-performance computing.

#### What is offered
The activities of the MatMat group revolve around understanding
modern materials simulations from a mathematical point of view
--- and to come up with ways to make such simulations faster and quantify their errors.
You will become part of a young and energetic team,
fully integrated with both the [mathematics](https://math.epfl.ch/)
and the [materials](https://imx.epfl.ch/) institutes.
Within the proposed topic you will be able to bring in your prior expertise,
but also be able to get to know the exciting theory and practice of material modelling.
EPFL's main campus is beautifully located at the lake Geneva shore
hosting a stimulating community of interdisciplinary-minded researchers.
Funds to disseminate your work at suitable conferences
as well as potential visits to our international network of collaboration partners
are provided.

The current regulations regarding salary and working conditions of PhD students at EPFL
can be found on the detailed websites on
[salary](https://www.epfl.ch/education/phd/doctoral-studies-structure/doctoral-students-salary),
[employment conditions](https://www.epfl.ch/about/working/working-at-epfl/employment-conditions)
and [PhD admission criteria](https://www.epfl.ch/education/admission/admission-2/phd-admission-criteria-and-application/).

#### Deadline and starting date
The position is available from january 2027 and hiring will be done on a continuous basis
until a suitable candidate has been found.
Note, that for PhD candidates, the chosen candidate will have to be accepted into
one of the aforementioned doctoral schools
before the contract can start.

[^addfpt]: N. F. Schmitz, B. Ploumhans and M. F. Herbst. *Algorithmic differentiation for plane-wave DFT: materials design, error control and learning model parameters*. npj Computational Materials **12**, 6 (2025). DOI [10.1038/S41524-025-01880-3](https://doi.org/10.1038/S41524-025-01880-3) (Preprint: https://arxiv.org/abs/2509.07785)
[^beef]: Mortensen, J. J., K. Kaasbjerg, S. L. Frederiksen, J. K. Nørskov, J. P. Sethna, and K. W. Jacobsen, Phys. Rev. Lett. **95** (2005), DOI [10.1103/phys-revlett.95.216401](https://doi.org/10.1103/phys-revlett.95.216401)
[^uafd]: Hansen, T., J. J. Mortensen, T. Bligaard, and K. W. Jacobsen, Phys. Rev. B **112**, 7, 075412 (2025).
[^fno]: N. Bosch, N. F. Schmitz, M. F. Herbst. *Euclidean Fourier Neural Operators*. (Preprint: <https://arxiv.org/abs/2608.28425>)


<!--
## PhD position: Error-controlled Bayesian methods for inverse materials design

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

#### Project goals
Recent advances in the direction of multi-fidelity statistical models [^2]
as well as techniques to estimate numerical errors [^3] in DFT simulations
provide new opportunities for efficient, error-controlled
Bayesian optimisation schemes for inverse materials design.
In collaboration with similar ongoing projects in the group
we will explore how these opportunities enable to accelerate
the discovery of materials for electronics and mechanical devices.

#### Candidate profile

#### What is offered

#### Deadline and starting date

-->

## Summer research opportunities

We are always looking for outstanding students to join our
group over summer as part of the
[EPFL excellence in engineering (E3)](https://eee.epfl.ch)
programme. The program is open to Bachelor and Master students
in science, mathematics or engineering degrees. To submit your
application and for more information please see the 
[E3 website](https://eee.epfl.ch). Deadlines are usually in autumn
for an internship in the following summer.
