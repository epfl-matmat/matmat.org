@def title = "Job Openings"
@def mintoclevel=2
@def maxtoclevel=3


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
If you lean towards a numerics-oriented project, you should probably apply to EDMA,
whereas if you are more interested in applications, you should apply to EDMX.

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
This implies not only a considerable waist of computational resources,
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
* You have a strong sense of autonomy and independence.
* You have completed a Master in physics, mathematics or a related subject.
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
* Bonus skills for this application are considerable experience in
  numerical analysis, quantum physics, solid-state physics or Julia programming.

#### What is offered
The activities of the MatMat group centre on understanding
modern materials simulations from a mathematical point of view
-- and to come up with ways to make such simulations faster,
quantify their errors or make them more reliable.
We disseminate our work in state-of-the-art software and directly test novel algorithms
in the context of application simulations.
In line with this our team has a broad background and our research
is closely integrated with multiple departments and interdisciplinary initiatives,
such as the [NCCR MARVEL](https://nccr-marvel.ch/).
You will have of opportunities to take part in such cross-disciplinary activities
and discuss with researchers from many domains.
This includes attending suitable conferences or workshops
or a participation in collaborations with researchers from Europe and the US,
including potential collaborative visits.

The current regulations regarding salary and working conditions of PhD students at EPFL
can be found on the detailed websites on
[salary](https://www.epfl.ch/education/phd/doctoral-studies-structure/doctoral-students-salary),
[employment conditions](https://www.epfl.ch/about/working/working-at-epfl/employment-conditions)
and [PhD admission criteria](https://www.epfl.ch/education/admission/admission-2/phd-admission-criteria-and-application/).


#### Starting date
Continuous, until a suitable candidate is found.
Note, that the chosen candidate will have to be accepted into
one of the aforementioned doctoral schools before the contract can start.




<!-- one more PhD project on AD and mixed precision and adaptive tolerance response with proper preconditioning -->

## PostDoc position: Quantifying DFT model uncertainties with Bayesian methods

A PostDoc position centring on using Bayesian methods
for understanding model uncertainties in DFT is also open.
The position will be initially for two years with an optional extension.

More details on the position will be published soon.


<!--

**Requirements:**\newline
- Strong background in Bayesian statistics

using AD

Error in data-driven DFT models,
pseudopotentials,
propagation to properties and MD potentials

-->
