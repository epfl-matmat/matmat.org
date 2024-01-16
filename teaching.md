@def title = "Teaching"
@def mintoclevel=2
@def maxtoclevel=3

# Teaching

This page gives an overview of the classes we teach regularly.
For some earlier teaching by Michael Herbst, see <https://michael-herbst.com/teaching/>.

\toc

## Error control in scientific modelling
**IS academia:** [MATH-500](https://staging-edu.epfl.ch/coursebook/en/error-control-in-scientific-modelling-MATH-500)\newline
**Semester:** *Autumn*\newline
**Target audience:** Mathematics Master, Materials science Master\newline
**Moodle link:** <https://go.epfl.ch/error-control> \newline

#### Summary
Errors are ubiquitous in computational science as neither models nor numerical
techniques are perfect. With respect to eigenvalue problems motivated from
materials science (transfer problems, atomistic modelling) we discuss,
implement and apply numerical techniques for estimating simulation error.

#### Content
* Motivation for studying errors in eigenvalue problems
* Types of simulation error
* Residual-error relationships for eigenvalue problems
* Perturbation theory and parametrised eigenvalue problems
* Subtleties of infinite-dimensional eigenvalue problems
* Discretisation and discretisation error
* Plane-wave basis sets
* Errors due to uncertain parameters (if time permits)
* Non-linear eigenvalue problems (if time permits)

Algorithm demonstrations and implementations will be based on
the [Julia programming language](https://julialang.org/)
and interactive [Pluto](https://plutojl.org/) notebooks.

#### Prerequisites
* Analysis
* Linear algebra
* Exposure to numerical linear algebra
* Exposure to numerical methods for solving partial differential equations
  (such as finite-element methods, plane-wave methods)
* Exposure to implementing numerical algorithms (e.g. using Python or Julia)

This course delivers a mathematical viewpoint on materials modelling and it is
explicitly intended for an interdisciplinary student audience. To keep it
accessible, the key mathematical and physical concepts will both be revised as
we go along. However, the learning curve will be steep and an interest to learn
about the respective other discipline is required. The problem sheets and the
projects require a substantial amount of work and feature both theoretical
(proof-oriented) and applied (programming-based and simulation-based) components.
While there is some freedom for students to select their respective
focus, students are encouraged to team up across the disciplines
for the course work.

#### Literature
There is no single textbook corresponding to the content of the course.
Parts of the lectures have substantial overlap with the following resources,
where further information can be found.

- Youssef Saad. *Numerical Methods for Large Eigenvalue Problems*, SIAM (2011).
  A PDF is available free of charge on [Youssef Saad's website](https://www-users.cse.umn.edu/~saad/eig_book_2ndEd.pdf).
- Nicholas J. Higham. *Accuracy and Stability of Numerical Algorithms*, SIAM (2002).
- Peter Arbenz. *Lecture notes on solving large scale eigenvalue problems*, ETHZ.
  A PDF is available from [Peter Arbenz' website](https://people.inf.ethz.ch/arbenz/ewp/Lnotes/lsevp.pdf).
- Mathieu Lewin. *Théorie spectrale et mécanique quantique*, Springer (2022).

## Numerical analysis
**IS academia:** MATH-251(b)\newline
**Semester:** *Spring*\newline
**Target audience:** 2nd year Bachelor materials science, electrical engineering, chemistry\newline
**Moodle link:** <https://go.epfl.ch/numerical-analysis> \newline

#### Summary
The students will learn key numerical techniques for solving standard
mathematical problems in science and engineering. The underlying mathematical
theory and properties are discussed.

#### Content
The topics covered include:

* Properties and issues with numerical computation
* Finding roots and fixed points
* Polynomial interpolation
* Solving linear and non-linear equations
* Gradient-based methods for solving linear and eigenproblems
* Numerical integration and differentiation
* Basic numerical techniques for solving differential equations

#### Literature
- Giray Ökten *First Semester Numerical analysis* (2023).
  [Online pdf](https://diginole.lib.fsu.edu/islandora/object/fsu%3A657877/datastream/PDF/view)
- Tobin A. Driscoll, Richard J. Braun *Fundamentals of Numerical Computation*, SIAM (2022).
  [Web previow](http://tobydriscoll.net/unlinked/fnc-preview/)
  [FundamentalsNumericalComputation](https://github.com/fncbook/FundamentalsNumericalComputation.jl) julia package

#### A note to future teaching assistants
For this course the recruitment of AEs (assistante-étudiant) is directly processed through STI.
If you want to become an AE for this course please register via the respective STI platform
and do not apply by email. All such direct application emails will be ignored.
