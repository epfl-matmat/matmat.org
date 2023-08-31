+++
title = "Example problem"
+++

# Example problem

## Preamble

This page provides a small example problem, which is not exactly electronic structure theory,
but that structurally resembles the challenges we will face in density-functional theory (DFT).
The tasks are deliberately formulated in a very open fashion
to give you the flexibility to tackle them in a form you feel comfortable with.

A large part of the exercise is to implement a discretisation
and solution procedure for the problem discussed below.
Please keep an eye on writing your code in a readable and understandable fashion
as I will not manage to spend a lot of time looking at it.
Ideally the code should be unit tested
and work beyond the scenario we are considering here,
but for the sake of this exercise this is optional as you likely
won't have enough time for this.

Both your code as well as your reasoning during the exercise will be discussed in the interview.
Don't worry if you don't manage to complete the full exercise.
The idea is that you spend a couple of hours on this,
such that we have a basis for discussion and I get an idea how you approach such a problem.

It is completely natural when getting into a new topic to get stuck somewhere.
I very much encourage you to send me an email with questions if this is the case.

## The Gross-Pitaevskii equation

In this example we will deal with the numerical modelling of the (time-independent)
[Gross-Pitaevskii equation](https://en.wikipedia.org/wiki/Gross%E2%80%93Pitaevskii_equation) (GPE).
The GPE is simpler than DFT, but since it still displays interesting behaviour,
which makes it a favourite model of applied mathematicians,
that study electronic structure problems.
Of note the GPE itself has physical significance as well:
it is a mean-field model for bosonic systems.

In one dimension the GPE reads in atomic units:
$$
    H ψ = \left(-\frac12 Δ + V + 2 C |ψ|^2\right) ψ = λ_1 ψ \qquad \|ψ\|_{L^2} = 1,
$$
where $\psi \in L^2(\R)$ is the effective one-particle bosonic wave function,
$C$ provides the strength of the boson-boson coupling. The application
of the external potential $V : \R \mapsto \R$ is point-wise (in real space), i.e.
$$
    \left[V\psi\right](x) = V(x) \psi(x).
$$
Of note $H$ is an eigenvector-dependent operator.
Overall the GPE is thus a non-linear eigenvalue problem,
where we seek the lowest eigenvalue $\lambda_1$ and associated eigenfunction $\psi$.

In this example we will consider external potentials of the form
$$
    \begin{align*}
        G_{\alpha, L, R}(x) &= -\frac{\alpha}{\sqrt{2\pi} \cdot L} \exp\left[- \frac12 \Big(\frac{x - R}{L}\Big)^2\right] \\
        V(x) &= G_{\alpha, L, R} + G_{\alpha', L', R'} + \beta x^2,
    \end{align*}
$$
i.e. the sum of two inverted Gaussians plus a confining parabola.
Due to the confinement $\psi$ decays exponentially as $\abs{x} \to \infty$.

## Task 1: Implement a numerical method for GPE problems

Consider the setting $C = 1$, $\beta = 1/10$, $L = L' = 1$, $\alpha = \alpha' = 5$, $R = -3$, $R = 3$
and find the corresponding $\lambda_1$ and $\psi$ (lowest eigenpair of $H$) numerically.
You can use any discretisation method and programming language of your choice.
Ensure that your method converges $\lambda_1$ to at least $4$ digits.

The remainder of this task description is basically some hints
that help you to achieve this in one particularly simple way.
You don't have to follow any of this and in fact there are plenty
of better methods out there, which you are welcome to follow if you want.

**Tip on the algorithm:**
Since this is a non-linear eigenvalue problem you will need another iterative procedure
around the actual diagonalisation to find the eigenfunction $\psi$.
Since the phase of the eigenvectors is ill-defined,
it is usually more convenient to iterate on the bosonic density $\rho = |ψ|^2$
instead of the eigenfunction $\psi$.
One approach we will consider here is the **self-consistent field** (SCF) procedure,
which is a fixed-point method.

It can be implemented as follows:
- Assume that at the $n$-th iteration we have a good guess density $\rho^{(n)}$.
  For $\rho^{(0)}$ just take the zero vector.
- From this we can build a corresponding $H^{(n)} = -\frac12 Δ + V + 2 C \rho^{(n)}$
  and diagonalise it to find its lowest eigenfunction, which we call $\psi^{(n)}$.
  From $\psi^{(n)}$ we obtain $\rho^{(n)}_\text{out} = |ψ^{(n)}|^2$.
- Typically a good next iterate is $\rho^{(n+1)} = \rho^{(n)} + d [\rho^{(n)}_\text{out} - \rho^{(n)}]$,
  i.e. we perform damped fixed-point iterations. For GPE usually a very small $d$ is needed
  (e.g. $d$ between $0.1$ and $0.01$).
- Convergence is achieved if $\rho^{(n)}_\text{out}$ and $\rho^{(n)}$
  or respectively if the subsequent first
  eigenvalues $\lambda_1^{(n+1)}$ and $\lambda_1^{(n)}$ do not differ significantly any more.
  The desired eigenpair is then $(\lambda_1^{(n+1)}, \psi^{(n+1)})$.
  Usually on the order of $100$ iterations in the outer loop are required.


**Tip on the implementation:**
If you are unsure how to set up and discretise the problem,
you can take a look at the [DFTK](https://dftk.org) code developed in our group.
It uses plane waves and periodic boundary conditions,
see [this introduction in the documentation](https://docs.dftk.org/stable/guide/periodic_problems/).
As a result of this you will put the GPE problem above into a large box with artificial periodic
boundary conditions,
see [this example for details](https://docs.dftk.org/stable/examples/gross_pitaevskii/).
Don't forget to converge wrt. the box size.
Custom potentials (like the two Gaussians) are discussed
in [this example](https://docs.dftk.org/stable/examples/custom_potential/).
Once you have constructed a `PlaneWaveBasis` object,
you can easily obtain a representation of the discretised Hamiltonian $H$
at given bosonic density `ρ` by constructing a `Hamiltonian` object, e.g.
```julia
# Make sure to use kgrid=(1,1,1) when setting up the PlaneWaveBasis
basis = PlaneWaveBasis( #= ... more arguments ... =#, kgrid=(1,1,1) )
ρ = zeros(basis.fft_size..., 1)
H = Hamiltonian(basis; ρ=ρ).blocks[1]   # [1] Select 1st (and only) k-Point
```
The resulting Hamiltonian object `H` can be directly passed to an eigensolver
as it supports e.g. the `*` operator to perform a matrix-vector product.
E.g. here we use an LOBPCG built into DFTK to find the smallest 3 eigenpairs starting
from a random guess:
```julia
X    = randn(ComplexF64, size(H, 2), 3)     # ramdom guess
prec = PreconditionerTPA(H.basis, H.kpoint)  # Setup preconditioner

# Solve and get eigenpairs back
(; λ, X) = lobpcg_hyper(H, X; prec, tol=1e-6, maxiter=300)
```
It is generally a good idea to use the eigenvectors `X`
from a previous SCF step as an initial guess to save on the number
of required iterations of the diagonalisation procedure.

Note that DFTK has a `self_consistent_field` function to do a (more sophisticated) SCF.
You can use it for testing, but I would still ask you to code up your own SCF
as part of this exercise.


## Task 2: Investigating the eigenspectrum of H
Once your numerical SCF scheme from the previous section is up and running, play with the model's parameters,
in particular $C$ and the Gaussian parameters $\alpha$, $\alpha'$, $R$ and $R'$.
For each parameter choice first run the SCF to obtain the solution $\psi$ and then investigate
the total potential $V + 2 C |ψ|^2$, the density $\rho = |\psi|^2$ as well as the five lowest
eigenvalues of the GPE operator $H$.
How do the eigenvalues depend on your parameter choices?

## Task 3: Inverse design
For $C = 1$ and $\beta = 1/10$ find values for the Gaussian parameters such that
the gaps between the first three eigenvalues have a ratio of $1 : 10$.
In other words if we denote the lowest eigenvalues of $H$ by $\lambda_1, \lambda_2, \lambda_3$,
then we desire $$ |\lambda_3 - \lambda_2| = 10 |\lambda_2 - \lambda_1|. $$

**Tip:**
One solution can be obtained by restricting $L = L' = 1$, $\alpha = \alpha' = 5$ and $R = -R'$.
