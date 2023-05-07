@def title = "Job Openings"

# Job Openings
Below, this page lists the current PhD or PostDoc openings in our group.
If you are interested in working with us,
but no openings matching your profile,
you are still welcome to submit a general inquiry.

In any case, please consider [application guidelines](#application_guidelines)
before you contact us.
We like to give each serious candidates the proper consideration they deserve.
Unfortunately the large number of mass applications
with no connections to the projects or general research in our group
make it necessary to do a preliminary screening of candidates.
All applications not following these guidelines might be silently ignored.

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

Please send your files to [this email address](mailto:michael.herbst@epfl.ch?subject=[HIRING]),
making sure to include the text `[HIRING]` at the start of the subject.
We may silently ignore your application if you do not comply with these instructions.

A note for **PhD applicants**: Before you can start in our group you need to get *additionally* admitted into an EPFL doctoral school.
In our group both the [doctoral school in mathematics (EDMA)](https://www.epfl.ch/education/phd/edma-mathematics/)
as well as the [doctoral school in materials (EDMX)](https://www.epfl.ch/education/phd/edmx-materials-science-and-engineering/) are suitable.
You can use these links to find further information about the schools and their respective application process (including the respective deadlines).
We strongly recommend you to apply to one of these before contacting us,
since the required information is very similar (so you only need to collect it once).
Moreover admission to a doctoral school gives you a chance to obtain a PhD position in other groups at EPFL as well.
If you lean towards a numerics-oriented project, you should probably apply to EDMA,
whereas if you are more interested in applications, you should apply to EDMX.

## PhD position: Self-adapting algorithms for high-throughput DFT simulations
High-throughput studies, where thousands to tens of thousands of materials are
simulated, are a powerful tool for broadening our knowledge of materials
properties and discovering new and interesting functional materials.
Unfortunately existing algorithms still lack robustness,
such that substantial trial-and-error tuning of numerical parameters
may be required to converge tricky systems with density functional theory (DFT).

Based on combining mathematical analysis and physical intuition
within the non-linear eigenproblem setting of DFT,
we have developed a number of self-adapting algorithms for DFT simulations
(e.g. [LDOS preconditioning](https://michael-herbst.com/publications/2020.09.03_ldos_preconditioning.pdf)).
These aim to automatically tune the numerics to the modelled materials system,
which we could successfully demonstrate by implementing them
into [DFTK](https://dftk.org), our in-house DFT code.
Along a similar vain the [SIRIUS](https://github.com/electronic-structure/SIRIUS)
project has built a remarkable library of tailored methods to enable
DFT simulations robustly on (pre-)exascale high-performance computing (HPC) hardware.

The goal of this project is twofold. Firstly to provide a deep integrations
of both codes and in this way extend their respective capabilities by joining forces.
Secondly to use the highly flexible prototyping framework of DFTK with the
feature-rich SIRIUS library to investigate a number of research directions
to improve the numerical robustness of DFT methods.
This includes directions include adaptive discretisation
techniques using recent a posteriori error estimation for DFT,
improved acceleration or preconditioning techniques for DFT simulations.

More practical details will soon be added to this description.

**Required skills:**
- Strong background in numerical linear algebra;
- Experience with implementing algorithms in an HPC context;
- Solid experience in a related programming language (e.g. C++, Fortran, Julia);
- Interest to learn about the physical principles of materials modelling;
- Interest to learn about the matematical structure of density-functional theory

**Optional skills:**
- Background in numerical analysis;
- Background in solid-state physics or materials simulations;
- Julia programming
