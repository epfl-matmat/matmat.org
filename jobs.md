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

In any case, please consider [application guidelines](#application_guidelines)
before you contact us.
<!--
We like to give each serious candidates the proper consideration they deserve.
Unfortunately the large number of mass applications
with no connections to the projects or general research in our group
make it necessary to do a preliminary screening of candidates.
All applications not following these guidelines might be silently ignored.
-->

\toc

## Application guidelines

In the Mathematics for Materials modelling (MatMat) group we have a highly interdisciplinary research
programme including numerical, statistical and physical questions related to materials modelling.
We work on understanding the mathematical properties of materials simulations, developing new physical models,
techniques for understanding simulation error, reliable algorithms as well as modern software design
and implementation strategies for simulation codes.

For this work ideal candidates should have a solid knowledge of linear algebra and numerics,
experience in programming and scientific computing
as well as the application of these methods to chemistry, materials science and physics.
But what is most important is that the applicant demonstrates broad interests
as well as a curiosity to learn from the disciplines they might not be familiar with.
On top of that we seek a good portion of critical thinking and creativity
to come up with the unusual solutions we often require.
In particular at the PhD level we are open to candidates from many backgrounds and study programmes
while at the PostDoc level we often seek applicants whose expertise is more focused and topic-specific.

Before you apply please take your time to familiarise yourself with the [ongoing research](/research) in our group.
If you apply to one of the specific job openings below, please also read the project-specific information carefully.
In your application we encourage you to make reference to the research programme of our group
and discuss how your background and interests fit in.

Your application should contain:

- **Cover letter** (max 1 page): Explain here why you would like to work with us and how your profile fits our research programme.
- **full CV**: Make sure to include a publication list *(if you have prior publications)*
- Full transcript of marks *(for PhD applicants)*
- Contact information for **two references**

Please send your files to [this email address](mailto:michael.herbst@epfl.ch?subject=[APPLICATION]),
making sure to include the text `[APPLICATION]` at the start of the subject.
We may silently ignore your application if you do not comply with these instructions.

A note for **PhD applicants**: Before you can start in our group you need to get *additionally* admitted into an EPFL doctoral school.
In our group both the [doctoral school in mathematics (EDMA)](https://www.epfl.ch/education/phd/edma-mathematics/)
as well as the [doctoral school in materials (EDMX)](https://www.epfl.ch/education/phd/edmx-materials-science-and-engineering/) are suitable.
You can use these links to find further information about the schools and their respective application process (including the respective deadlines).

We strongly recommend you to apply to one of these doctoral schools in parallel,
since the required information is very similar (so you only need to collect it once).
Moreover admission to a doctoral school gives you a chance to obtain a PhD position in other groups at EPFL as well.
If your desired project topic is more closely related to numerics / analysis,
you should probably apply to EDMA,
whereas if the project will be more on the side of
physical models / materials applications, you should apply to EDMX.

## PhD position: Self-adapting numerical methods for high-throughput DFT simulations

#### Background
Density-functional theory (DFT) is one of the most widely employed simulation methods
to predict the properties of materials from first principles.
An important application is the computational discovery of novel materials,
where many thousands of systematic simulations may be performed.
In this regime the often highly problem-specific numerical parameters of DFT
need to be automatically selected.
This is a highly challenging task, which often proceeds by trial and error,
i.e. multiple runs of the same simulation where parameters are tweaked until
the simulation is successful.
This implies not only a considerable waste of computational resources,
but also substantially limits the overall throughput with which new materials
can be found.

#### Project goals
In this project you will obtain and combine physical and mathematical insights
into the numerical methods of DFT in order to develop algorithmic techniques,
which robustly adapt to the simulated material on the fly.
For this you will apply and extend existing results in numerical analysis
to obtain novel preconditioners
(building [upon previous work](https://michael-herbst.com/publications/2020.09.03_ldos_preconditioning.pdf))
as well as adaptive basis selection techniques.
Your developed methods will be implemented into codes
such as the [density-functional toolkit (DFTK)](https://dftk.org)
as well as the [SIRIUS](https://github.com/electronic-structure/SIRIUS) electronic structure library,
such that they can be directly tested on cutting-edge materials simulations.
In your work you will be closely integrated into the materials simulation activities
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
* You have a broad background in quantum physics, numerical mathematics and computer science
  or are looking forward to the challenge of acquiring a diverse cross-disciplinary skillset.
  In any case your willingness to look beyond the borders of your discipline
  will be key in this project.
* You have a strong interest in numerical methods, their implementation and application
  to physics and materials simulations. Previous experience in one of numerical linear algebra,
  high-performance computing or computational physics is highly desirable.
* You enjoy programming and implementing algorithms and have solid experience
  in an HPC programming language such as C++, Fortran or Julia.
* You are fluent in written and oral English.
* Bonus skills for this application are considerable experience in
  numerical analysis, quantum physics, solid-state physics or Julia programming.

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

<!-- one more PhD project on AD and mixed precision and adaptive tolerance response with proper preconditioning -->



## PostDoc position: Quantifying uncertainties in first-principle material simulations

#### Background
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

#### Project goals
<!-- Could go more into the numerical analysis side: E.g. balance uncertainty in lattice constant
with discretisation or uncertainty in pseudopotential with discretisation -->
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

#### Candidate profile
* You are motivated to tackle a challenging interdisciplinary research topic
  and to substantially push the state of uncertainty quantification methods
  for density-functional theory.
* You obtained your PhD in mathematics, statistics or a related subject.
* You have a strong background in Bayesian statistics
  and worked on uncertainty quantification for physics or engineering simulations.
* You have an excellent academic track record and demonstrated prior research experience
  working with Bayesian regression, multi-fidelity or multi-tasking methods
  or inverse problems.
* You enjoy collaborating with researchers from a diverse background
  and you look forward to acquiring the broad skillset required
  for cross-disciplinary research in materials modelling.
* You enjoy pen and paper analysis, but you are not afraid to implement and test your
  ideas in practice.
* You have previously used Python, Matlab, R or Julia to conduct numerical experiments
  or test your ideas in non-trivial settings.
* You are fluent in written and oral English.
* You enjoy occasionally supervising undergraduate students on topics related to your research.
* Bonus skills for this application are considerable experience in
  quantum-chemical or materials simulations, numerical linear algebra,
  high-performance computing or Julia programming.

#### What is offered
The activities of the MatMat group revolve around understanding
modern materials simulations from a mathematical point of view
-- and to come up with ways to make such simulations faster,
quantify their errors or make them more reliable.
You will become part of a young and energetic team,
fully integrated with both the mathematics and the materials institutes
as well as multiple cross-disciplinary initiatives,
such as the [NCCR MARVEL](https://nccr-marvel.ch/).
Within the proposed topic you will be able to bring in your prior expertise,
explore your ideas and grow substantially your background
in both the theory and practice of materials modelling.
For this you have access to a stimulating community of researchers
at EPFL's main campus beautifully located at the lake Geneva shore.
For disseminating your work funds to attend suitable conferences
and workshops as well as potential visits to our collaboration partners
all over the world are provided.

The position will be a fixed-term position (CDD) for initially 2 years,
renewable on a one-year basis. Further extensions depend on progress
and the funding situation.
For more information on working at EPFL see also
the website on [current employment conditions](https://www.epfl.ch/about/working/working-at-epfl/employment-conditions).

#### Deadline and starting date
Initial screening will start 1st August 2023 and continue
until a suitable candidate has been found.
The expected starting date is January 2024,
but this can be negotiated in both directions.
