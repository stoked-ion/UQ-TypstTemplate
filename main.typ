#import "template.typ": *

// Take a look at the file `template.typ` in the file panel
// to customize this template and discover how it works.
#show: project.with(
  title: "Experimental Investigation of an Air Breathing Lorentz Engine (ABLE)",
  tag1: "Confirmation Report",
  PAdvisor: "Principal Advisor: Vincent Wheatley",
  Advisor1: "Associate Advisor: Allan Paull",
  Advisor2: "Associate Advisor: Carolyn Jacobs",
  tag2: "School of Mechanical and Mining Engineering",
  tag3: "Faculty of Engineering, Architecture and Information Technology",
  
  authors: (
    (name: "Roshan John Kurian", affiliation: "School of Mechanical and Mining Engineering"),
  ),
  // Insert your abstract after the colon, wrapped in brackets.
  // Example: `abstract: [This is my abstract...]`
  abstract: [The project 'Air Breathing Lorentz Engine' pursues the feasibility of using MHD interactions to produce thrust in air breathing hypersonic flight.  The primary thrust mechanism is the acceleration of ions by the Lorentz force and the transfer of that force to the thruster through the applied magnetic field. This mechanism therefore counts on ample ionization and sufficient applied electric and magnetic fields for measurable thrust. The scope of the PhD lies in analyzing these and several other design parameters that affect the performance of this type of engine. The project does not aim to address how large amounts of power needed for this technology is supplied during actual flight, but rather assumes its feasibility and focusses on achieving stable conditions for ground tests and characterizing performance.],
)



= Introduction

In pursuit of faster travel, aerospace propulsion has gone through a series of transformations over the past few decades. Particularly in airbreathing propulsion, the RAMJET and Supersonic Combustion RAMJET (SCRAMJET) have enabled aircrafts to go beyond the sonic barrier into high mach numbers. These types of engines, take in supersonic air in their inlet and burn fuel to achieve higher supersonic and hypersonic speeds. Despite a major bottleneck for faster travel being subject to material advancements, in the early 1960's a lot of research looked beyond those limits, where the bottleneck would be combustion itself. At the time, a theory that was being popularized was the maximum speed limited by the energy of the combusting fuel could be overcome with Magnetohydrodynamic (MHD) body forces and effects. These MHD effects could not only accelerate flow, but could also control and derive energy from the flow.  These interests opened up the research of magneto-aerodynamics and MHD hypersonics. 

The first look into MHD hypersonics was done by Rosa during their PhD @rosa_part_1956. They looked into shock wave spectroscopy and a broad view into 'Engineering Magnetohydrodynamics'. A general overview for the prospects of magneto-aerodynamics @resler_prospects_1958 later opened up further research into the subject and initiated various projects in the United States and Russia. 

#figure(image("StockPFE.png", width: 65%, ),
  caption: "Stock image of an ABLE Engine aircraft",
)

This project focusses on the acceleration aspect of MHD hypersonics for the purpose of experimentally analyzing a novel engine design.
Fundamentally, the Air Breathing Lorentz Engine (ABLE) can be described as an unconventional air breathing scramjet, where instead of adding energy to the flow through supersonic combustion, air is ionized using methods like electron beam ionization and accelerated through the Lorentz body force in the presence of strong electromagnetic fields.



== Motivation 
The Hypersonic ABLE is a possible alternative for the first or second stage in a multi-stage to orbit launcher. The added benefits being a reusable vehicle and one that does not need to burn fuel like conventional launchers. The physics of relatively cold plasmas in the hypersonic regime is not well understood and the experimental data could provide insights to improve computational models and deepen our understanding of plasmas in this regime. The plasma model being developed could also find application in other fields like cold plasma modelling and Very Low Earth Orbit (VLEO) airbreathing satellite propulsion.

== Research Question
The fundamental research question in this PhD project is; "Can  air breathing plasma thrusters be a viable means for thrust production at hypersonic speeds and how do their experimental performance compare to theoretical and computational predictions?"

== Aims
The aims and steps in answering the research question in this project are, 
- To perform ground tests and evaluate the performance of an ABLE engine at various inflow and electrical configurations using the experimental model. 
- To use the test data to support computational efforts in understanding the characteristics of plasma physics in hypersonic regimes. 
- To use the updated computational model in exploring regions beyond the experimental envelope.
- To test the system in the T4 Shock tunnel to validate the  proof of concept and demonstrate new testing capability for the tunnel.

== Methodology

The general outline of the project can be broken down into the following steps:

+ Selection of design parameters and expected performance calculated using known plasma physics and MHD theory.
+ Analytical solution is compared to 2D Eilmer CFD simulations with the Navier Stokes + source terms approximation.
+ Various chemical models are tested to determine the dependance of various chemical mechanisms in different plasma regimes.
+ 3D Eilmer simulations with boundary layer effects to study possible sheath coupling in the setup.
+ Unpowered and powered tests are conducted and compared to prove the feasibility of the concept.
+ Powered test data is compared to the simulation results to validate the computational model.
+ Chemistry model changes to better represent the physics of the hypersonic plasma flow conditions.
+ Configurations beyond the experimental setup is simulated to explore the performance of the ABLE engine in different conditions.


#pagebreak()
= Background <background>
/*
{Basic Plasma physics including different MHD modelling techniques, conductivity tensor derivations, chemistry models and Experimental and CFD methods, Hall, Faraday and Diagonal mode.}
*/
This chapter goes through the necessary background theory behind the ABLE concept and also sets the foundation to analyze the literature in this field. Where applicable, certain concepts and configurations are explored in the literature review section alongside the appropriate study.

== Plasma Physics
Plasma is usually referred to as the fourth state of matter. In this state, the gas is in it's ionized form and three fundamental properties characterize it @bellan2008fundamentals;
- Particle Density $n$ (number of particles per unit volume)
- Temperature $T$ of each species (average kinetic energy usually measured in $e V$, $1 e V = 11,605 K$)
- Steady state magnetic field $B$ (measured in Tesla)
In a lot of cases, the gas is not fully ionized and neutral species become important, alongside the electrons and ions of the gas. Fractional ionization and the cross sections of neutrals are important when considering partially ionized plasmas.

=== Debye Shielding
Considering electrons and ions to not be in thermal equilibrium with each other, they can have separate temperatures as $T_i$ and $T_e$. Due to random thermal motion, transient spatial variations in electric potential can occur in neutral plasmas with equal densities. The plasma can be assumed collision-less when the collision between particles can be neglected to first approximation. Each species '$s$' can be considered a fluid with density $n_s$, temperature $T_s$, pressure $P_s = n_s kappa T_s$ ($kappa$ is Boltzmann's constant) and mean velocity $u_s$. Collision-less equation of motion for each fluid can be given as $ m_s d u_s / (d t) = q_s E - 1/n_s gradient P_s, $ 
where $m_s$ is the particle mass, $q_s$ is the charge of a particle, and $E$ is the electric field. For "_slow_" perturbations, inertial term '$d"/"d t$' can be dropped, and electric field is electrostatic when inductive fields are negligible, i.e $E ~ - gradient phi.alt$. Also assuming that the temperature of each species is spatially uniform and that the plasma can be characterized by a single temperature through thermal equilibrium, the previous equation simplifies to the Boltzmann equation that is often used to define the number densities of electrons and ions in thermal equilibrium, 
$ n_s = n_(s 0)" " e^((-q_s phi.alt)"/" (kappa T_s)), $ <boltzmanneq>
where $n_(s 0)$ is a constant. Because electrons are much faster than ions, the interaction can be assumed slow to electrons but not for ions.

Inserting a test charge ($q_T$) into this plasma will cause like charges to repel and opposite charges to come closer. This displacement produces a finite potential that tends to screen the test charge from the rest of the plasma by having an equal and opposite charge cloud surrounding the test particle. Poisson's equation for this case is, $ gradient^2 phi.alt = - 1/epsilon_0 [q_T delta(r) + sum_s n_s(r) q_s] $ where $q_T delta(r)$ represents the test particle charge density and the term $sum_s n_s(r) q_s$ represents the screening charge density.
We can reduce this equation by assuming neutrality and substituting @boltzmanneq to obtain the species Debye length, $ (lambda_s)^2 = (epsilon_0 kappa T_s)/(n_(s 0) (q_s)^2) $ 
#figure(image("Debye Shielding.svg", width: 35%, ),
  caption: "Debye Shielding; the electron cloud surrounding the test charge partially screens the field of the test charge to the surrounding plasma.",
)
Langmuir defined plasmas as "partially ionized gases" whose charge separation distance, the Debye length is small when compared to other characteristic macroscopic lengths @chazot_introduction_nodate. The effective Debye length is the sum of all species Debye length.  The above analysis is dependant on there being a large number of plasma particles in the shielding cloud, i.e if $4 pi n_0 lambda_D ^ 3 / 3 >> 1$. This is also the condition to state that the plasma is collision-less. \

=== Quasi-neutral 
Plasmas can be assumed to be quasi-neutral over length scales much larger than debye length (because the probability of electrons moving due to random thermal motion, far enough from the ions to cause neutrality to break down is very low and the distance is in the order of a few Debye length). When a biased electrode is inserted into plasma, the plasma screens the potential induced electric field from the rest  of the plasma and this region is called a sheath with length in the order of a Debye length. Charge neutrality is not applicable near solid surfaces, especially near electrodes of an externally applied electric field.

=== Plasma frequency
As plasma is an ionized medium, the charged particles tend to restore neutrality through electrostatic forces after a disturbance. The restoring force manifests as high frequency oscillations and is defines the plasma frequency.
$ omega_p = sqrt((n e^2)/(epsilon m_e)) $ //verify equation

At low frequency, even when the wavelength is comparable to the mean free path, the electrons and ions still maintain local neutrality. Meanwhile, the charge particles drift on average in opposite directions under an electric field. At high frequencies, because of the difference in mass between ions and electrons, they move independently and charge separation occurs.

An electromagnetic wave will reflect if the wave frequency is less than the plasma frequency. Waves with higher frequency pass through the plasma, but with attenuation @shang_plasma_2018.


=== Ohm's Law
Ohm's law defines the relationship between electric current and electric field intensity. For the purpose of this study, a classical MHD based generalized Ohm's law has been adopted. Here, the displacement current is neglected and the primary electric current is driven by charged species random motion @shang_plasma_2018. Therefore, the approximations of the generalized Ohm's law for electric conductivity are based on the collision kinetic equations for electrons and single charged ions. The derivation utilises the following equations;
$ rho = m_i n_i +m_e n_e approx n(m_i+m_e) \
u = 1/rho (n_i m_i u_i + n_e m_e u_e)approx (m_i u_i+m_e u_e)/(m_i+m_e) \ J = e(n_i u_i +n_e u_e)approx n_e e (u_i - u_e) $ <averageOhm>
Using the relations in @averageOhm, and neglecting the temporal variation of the organized motion and relatively smaller mass of electrons, we get the _generalized Ohm's law_,
$ J+(J times B - gradient p_e)/(e n) = sigma(E + u_e times B) $ <generalisedOhmslaw>
Here, $J$ is the current density, $B$ is the magnetic field strength, $p_e$ is the partial pressure of electrons and $sigma$ is the electrical conductivity. The partial pressure of electrons comes from the equation of motion where the momentum of charged particles is driven by the partial pressure gradient, and the $J times B$ term comes from the electromagnetic force driven momentum.
Considering a very large number density of charged particles, the Ohm's law for electric conductivity can be simplified to the following form,
$ J = sigma (E+u_e times B) $ <simplifiedOhm>
The above equation can be understood as the current density being driven by an effective electric field composed of an applied field $E$ and an induced field $u_e times B$.

/*
Ohm's law, $arrow(J) = sigma arrow(E)$ (for stationary conductors)\
$=> arrow(J) = sigma(arrow(E)+arrow(v) times arrow(B))$ (for moving)\
Also $E_r$, the electric field measured in a frame of reference moving with velocity $arrow(v)$ relative to the lab frame is $arrow(E_r) = arrow(E)+arrow(v) times arrow(B)$ = $f/q$, where f is coulomb force and $E_r$ is the effective electric field.
*/
=== Plasma conductivity
From Ohm's law, we get electrical conductivity $sigma$. Defining current with the drift velocity of electrons in the gas, we get,
$ J = n e u = ((n e^2)/(m nu_c))E, $ <diffusioncurrent>
where $nu_c$ is the collision frequency. From @diffusioncurrent, conductivity can be defined as,
$ sigma = (n e^2)/(m nu_c) $
The above relation corresponds the classic Ohm's law without a magnetic field ($J=sigma E$) and here, conductivity is a scalar.
In a magnetic field, collisions are more crucial in determining the drift velocity as the field encourages a gyro motion with an angular velocity called the cyclotron frequency (Larmor or gyro frequency).
$ omega_b = (e B)/m = 1.76 times 10^11 B " (rad/s") $
Due to the difference in the charge to mass ratio affecting the gyro frequency, the scalar approximation deviates for conductivity and plasma conductivity is a tensor of rank two in a magnetic field @shang_plasma_2018.
Taking a partially ionized plasma and assigning $B$ to be parallel to the z-axis, we can split the electron conductivity into parallel and perpendicular components,
$ sigma_(e,perp)=sigma_e/(1+beta_e^2) " "," "sigma_(e,parallel)=(beta_e sigma_e)/(1+beta_e^2), $
where $beta_e$ is the electron Hall Parameter. Introducing a slip factor $s=beta_e beta_i = mu_e mu_i B^2$ for weakly ionized plasmas, we can further approximate the conductivities to @mitchner1973partially,
$ sigma_perp approx (sigma(1+s))/((1+s^2) + beta_e^2)" "," "
sigma_parallel approx (beta_e sigma)/((1+s^2)+ beta_e^2) $
Therefore the electric conductivity can be written in the Cartesian tensor form,
$ sigma = mat(sigma_perp, -sigma_parallel, 0;
sigma_parallel, sigma_perp, 0;
0, 0, sigma_perp) 
 $
From Raizer, we can also define a useful conductivity function that can couple conductivity and the electron temperature @raizer1997gas.
$  sigma = 8300 times e^(-36000/T_e)  $ <raizerconductivity>
=== Hall Effect
The magnetic field's presence leads to the Hall effect which is the gyrating acceleration of charged particles in plasma. The Hall effect creates a voltage difference across the plasma and affects the interaction of charge particle motion in an externally applied magnetic field. The Larmor radius of ions is much larger than the Larmor radius of electrons, which implies a Larmor frequency of ions lower than that of electrons. For an identical drift velocity for paired ions and electrons, the curvature of ion trajectories is greater than that of electrons. This means that the collision frequency of ion-neutral is greater than electron-neutral forcing ion motion to be retarded, inducing a change in drift velocity and in turn an electric current produced normal to electric and magnetic field in opposite directions to drift velocity, the Hall current. Including the Hall current in the Ohm's law equation, 
$ J = sigma [E+u times B - beta(J times B)] $
where the Hall current magnitude is defined by $J times B$ and the Hall parameter is given by,
$ beta = omega_B/nu_c = omega_B tau, $ 
where $omega_B$ is the electron gyrofrequency, $tau$ is the mean free time between collisions and $nu_c$ is the collision frequency. Essentially, the Hall parameter is an approximate number of revolutions an average particle takes before a collision.

If the Hall Parameter ($beta$) is much smaller than one, the conduction follows scalar laws. If $beta$ is $"~"$1, the Hall current becomes significant and $J_y$ reduces (As per the configuration in @ABLE). If $beta$ is much larger than 1, the regime becomes Hall current dominated. The Hall parameter is charge to mass ratio dependant and implies that different species will have different values of $beta$.

=== Ion Slip 
In a partially ionized gas, neutrals in the gas depend on collisions to experience the electric and magnetic forces applied on the gas. Due to the difference in gyro frequencies, the electrons are nearly collisionless, while the ions are not. As the ions tend to be the majority contributor to the total current in an $E times B$ drift, This causes the combined motion of the electrons and ions against the neutrals to develop a relative velocity known as the ion slip velocity and can be the main contribution of transfer of the $J times B$ force across the bulk of the gas. This process is called ion slip. For a given current density, ion slip increases the local dissipation (Joule Heating) but the Hall effect does not. However, in a macroscopic sense, the Hall effect can increase dissipation due to distortion of the flow of current. 

=== Maxwell's Equations <maxwellequations>
The Maxwell equations consist of four fundamental laws;
+ Gauss's Law for Electric Fields 
 $ gradient dot E=1/epsilon_0 rho $ 
+ Magnetic divergence law
 $ gradient dot B=0 $
+ Faraday's Law
 $ gradient times E=-(partial B)/(partial t) $
+ Ampere's Law
 $ gradient times B=mu_0 J + mu_0 epsilon_0 (partial E)/(partial t) $
Conductive current is different from convective and displacement current. Convective current does not involve a conductive medium and this implies that it does not satisfy Ohm's law. For example, electron beam in a vacuum tube. Displacement current is produced in a time varying electric field and it was introduced by Maxwell to account for the generation of a magnetic field when conductive current is zero @shang_plasma_2018.

=== Lorentz Force
Relative motion of a conducting fluid in a magnetic field produces an _electro motive force_ (emf), $ E=u times B, $ where $u$ is the velocity of the fluid. This potential produces currents with current density, $ J = sigma (u times B) $
The induced current produces a secondary magnetic field that couples and the combined field interacts with the induced current density $J$ to produce a Lorentz force (per unit volume), $ F = J times B $

Without an applied emf, this force tends to inhibit the relative motion of the fluid @davidson_introduction_2016. In plasmas, this force acts on the electrons and ions of the gas. With an applied field, the complete form of this electromagnetic force can be written as
$ F_m = q(E+u times B) $ <lorentzforce> 

=== Joule Heating
Joule heating (or resistive heating) is caused by the collision of moving charged particles where the scattering becomes thermal energy @shang_plasma_2018. The dissipated energy as the applied field overcomes the resistance of the medium is converted into heat. In the absence of an applied magnetic field, the simplified heating relation can be given by,

$ Q = J dot E = sigma E^2 $

//=== Plasma Temperature



=== Non-equilibrium ionization
Non-equilibrium ionization occurs due to an elevated electron temperature when compared to the gas temperature. In the absence of an artificial seed species with the lowest ionization potential is assumed to ionize through energy coupling of its valence electrons with the higher energy free electrons accelerated in the field.

Non-equilibrium ionization instability can occur in plasmas when the Hall parameter is large. While atomic gases show a wide departure from ideal behavior when Hall parameter > 2, molecular gases should maintain stability over a larger range of Hall parameters . The effects of non-equilibrium ionization instability can be modelled as a reduction in the apparent values of Hall parameter and electrical conductivity. Hall parameter also tends to decrease with increasing pressure.


=== Collisions in Plasmas


A particle injected into plasma experiences a series of random collisions altering the energy and momentum of the particle. The characteristic parameter of collisions is the deflection angle $theta$ sometimes called the scattering angle. According to the Rutherford scattering problem, \ $ tan(theta/2) = (q_T q_F)/(4 pi epsilon_0 b mu v_0^2) 
space~ space "Coulomb interaction energy"/"kinetic energy" $
//T denotes test particles and F denotes field particles, b is the impact parameter as taken from [fig 1.3, Bellan]. 
Distinguishing small angle scattering for deflections smaller than 90$degree$ from larger angle scattering when the impact parameter $b$ is large. The impact parameter $b$ can be taken as the radius of a circle  whose area marks the flux of  particles for particular scattering angles. This area is called cross section for collisions. In equating the large number of small angle  collisions to one large angle collision, we get cumulative cross section to be \ $ sigma^* = 8ln (lambda_D/b_(pi"/"2)) sigma_"large" $
$sigma Gamma = t^(-1),$ Cross section times the flux gives the rate.
Since $b_(pi"/"2) = 1 "/" 2 n lambda_D^2$, the condition for $sigma^*$ significantly exceeding $sigma_ "large"$, $lambda_D "/" b_(pi "/"2) >> 1$ is equivalent to $n lambda_D^3 >> 1$. This is the Debye shielding criterion and defines the regime for an ionized gas to behave as a plasma (Debye Shielding and grazing collisions dominate large angle collisions) @bellan2008fundamentals. The cross  section can be rewritten as, $ sigma^* = 1/(2 pi) ((q_T q_F)/(epsilon_0 mu v_0^2)) ln(lambda_D/b_(pi "/"2)) $
In a hot plasma, $v_0$ is large and hence $sigma_*$ is small, so scattering by Coulomb interactions is not as important  as other mechanisms. A small collision frequency $nu = sigma^* n v$ or equivalently a large mean free path $l_ "mfp" = 1 "/"sigma^* n$ means collisions can be neglected to first approximation and the  plasma can be considered collision-less or ideal. These collision frequency parameters can be used to calculate transport properties such as electrical resistivity, mobility, and diffusion. 

Collision frequencies between the species in plasma is defined from the mass  ratio between them. The mass ratio affects momentum and kinetic energy change for like($e e, i i$) and unlike particles ($e i,i e$). We can take the incident velocity of a species to be its thermal velocity, $ v_(T sigma) = root(,2 kappa T_sigma "/"m_sigma) $
Assuming the relative velocity to be similar, we get $nu_(e i)space ~ space nu_(e e)$, and assuming equal temperatures, we get $sigma_(i i)^* ~ sigma_(e e)^*$, and hence, the collision frequencies differ only due to the different velocities in accordance with the relation $nu = n sigma v$. the ion thermal velocity is lower by an amount $(m_e "/" m_i)^(1/2)$, implying $nu_(i i) ~ (m_e "/" m_i)^(1/2) nu_(e e)$. Taking momentum to be conserved between a collision between an ion and electron, $nu_(i e)~(m_e "/" m_i)nu_(e e)$. Like particle collisions transfer energy at the same rate as momentum, $nu_(E e e)~nu_(e e)$ and $nu_(E i i)~nu_(i i)$. For interspecies collisions, an electron has to make $~(m_e"/"m_i)$ collisions in order to transfer all its energy to ions, $nu_(E e i)~(m_e"/"m_i)nu_(e e)$ //[Table 1.1] 

Taking the case of  an electron beam being injected into cold plasma with velocity $v_0$, the high energy electrons will share its energy with the relatively stationary electron in time order of $nu_(e e)^(-1)$ to reach a combined mean electron velocity $v_0 "/"2$ (under the assumption that half the electrons have velocity $v_0$). Collision with ions will cause scatter in direction without much transfer of energy in the fast time scale. In a  slower time scale of order $nu_(E e i)^(-1)$, the electrons transfer momentum and energy with the ions causing ions to speed and heat up while electrons slow down and cool. The collisional sharing of momentum and  energy achieves Maxwellian distributions and generally plasmas are *not* in thermodynamic equilibrium despite some parts being in partial equilibrium. Collision frequencies vary as $T^(-3 "/"4)$, implying slower collisions for hot plasmas. Weakly ionized plasmas also collide with neutrals, but as the interaction forces are not Coulombic, the cross sections are a lot smaller. Incident electrons with neutrals can excite or ionize the neutral in inelastic scattering, while ion neutral collisions can cause charge exchanges.
/*
=== Transport Phenomenon
In a uniform electric field, electrons and ions move in opposite directions having relative velocity $u_"rel" = u_e - u_i$. This relative velocity competes with the dissipation of average interspecies collisional velocity(drag). For an electron,
$ 0 = -e E - v_(e i) m_e u_ "rel" $
We know that electric current is $J = -n_e e u_ "rel"$. Hence, $E = eta J$, where plasma electrical resistivity is defined as,
$ eta = (m_e v_(e i)) / (n_e e^2) $
Since $v_(e i) = sigma^* n_i v_(T e)$ and quasi-neutrality means $Z n_i = n_e$,
$ eta = (Z e^2)/(2 pi m_e epsilon_0^2 v_(T e)^3) ln (lambda_D / b_(pi "/"2)) $
*The approximate plasma electrical resistivity (Spitzer resistivity) is independent of density and proportional to $T_e^(-3/2)$ and ion charge Z.* \

For random walk arguments, diffusion coefficients scale as $D~(Delta x)^2 "/" tau$, where $Delta x$ is the step size and $tau$ is the time between steps. Thermal velocity is given by $v_T = Delta x "/" tau = nu Delta x$, where $nu$ is the collision frequency.Taking the step size for electron diffusion to be the mean free path, 
$ D_e = nu_e l_ "mfp,e"^2 = (kappa T_e)/(m_e v_e) $ where $nu_e = nu_(e e)+nu_(e i) space ~ space nu_(e e)$ is the 90$degree$ scattering rate for electrons. The equation is similar for ions, where  $nu_i = nu_(i i)+nu_(i e) space ~ space nu_(i i)$ becomes the effective ion collision frequency. In magnetized plasma, the electron diffusion coefficient is smaller than the ion diffusion coefficient and the step size is the Larmor radius ($r_L = m_e v_perp "/" e B$).
*/
=== MHD Interaction Parameter (Stuart number)
Also known as the Stuart number, the MHD interaction parameter is given by,
$ S=(sigma B^2 L)/(rho u) , $
where $sigma$ is the conductivity, $B$ is the magnetic field, $L$ is the characteristic length, $rho$ is the density and $u$ is the velocity of the fluid.
It is generally assumed that S>1 is the condition required to demonstrate MHD effects.

=== Magnetic Reynolds Number
The magnitude of the Magnetic Reynolds number describes the strength of the induced electromagnetic field and can be a proxy to determine the regime of MHD. Small Magnetic Reynolds number attributes to negligible induced field and the problem can be approximated as a Navier Stokes problem with added source terms to account for the Lorentz force and Joule heating. It can be given by,
$ R_m = mu L u sigma, $
where $mu$ is the magnetic permeability of the fluid, $L$ is the characteristic length, $u$ is the velocity of the fluid and $sigma$ is the conductivity of the fluid.


== Plasma Modelling
Paul M Bellan in his text *Fundamentals of Plasma Physics* states that "Plasma Dynamics is determined by the self-consistent interaction between electromagnetic fields and statistically large numbers of charged particles". Simply, given the trajectory and velocity of every particle, the electromagnetic fields can be determined by the Maxwell's equations and  conversely, knowing the instantaneous electromagnetic fields can determine the forces on each particle through the Lorentz equation and can be used to update the trajectory and velocity of each particle @bellan2008fundamentals. These simple concepts are complex to implement. To simplify the conceptual and computational problem, assumptions can be validated for certain regimes. Three different models in order of decreasing complexity are the Vlasov theory, two-fluid theory and Magnetohydrodynamics (MHD) theory. 
=== Vlasov theory
The Vlasov theory is built on the definition of phase space and distribution functions. Taking the phase space to be the $x-v$ plane to graph the position $x$ and the velocity $v$, and taking the distribution function to define the particle density in this phase space and is denoted by $f(x,v,t)$. So, $f(x,v,t)d x d v$ becomes the number of particles at time $t$ having positions in the range $x+d x$ and velocities in the range $v+d v$. The one dimensional Vlasov theory can be written as, $ (partial f)/(partial t) + v (partial f)/(partial x) + partial/(partial v) (a f) = 0 $
Because of the commutative property, the three dimensional form can be written as,
$ (partial f)/(partial t) + bold(v) dot (partial f)/(partial bold(x)) + bold(a) dot (partial f)/(partial bold(v)) = 0 $
The Vlasov equation solutions depend on constant quantities along a particular trajectory, i.e for constant energy and momentum along a path, $f =f(E,p)$. The number of particles at given position is the number  density of that location, $ n(bold(x),t) = integral f(bold(x),bold(v),t) d bold(v) $ This implies that the mean velocity is , 
$ bold(u)(bold(x),t) = (integral bold(v) f(bold(x), bold(v), t)d bold(v))/(n(bold(x),t)) $
The procedure of multiplying the distribution function $f$ with various powers of $v$ and then integrating it over velocity is called _taking moments of the distribution function_.

Collisions in the Vlasov theory appear as discontinuities in slow time scales, where there is an apparent annihilation and creation of  particles after large collisions. A collision operator needs to be included in the equation to account for this and maintain the conservation relations. Accounting for this,
$ (partial f_sigma)/(partial t) + (partial)/(partial bold(x)) dot ( bold(v)f_sigma) + dot (partial)/(partial bold(v)) dot (bold(a) f_sigma) = Sigma C_(sigma alpha) (f_sigma), $
where $C_(sigma alpha) (f_sigma)$ is the rate of change of $f_sigma$ due to collisions of species $sigma$ with species $alpha$. Collisions should conserve particles, momentum and energy.


=== Two-Fluid equations
The two fluid equations formulation considers separate transport properties and equations for electrons and ions. 
//The problem is represented as two different fluids (electrons and ions) experiencing the 
The two fluid equations can be summarized as,
- Continuity equation for each species
$ (partial n_sigma)/(partial t) + gradient  dot (n_sigma u_sigma) = 0 $
- Equation of motion for each species
$ n_sigma m_sigma (d u_sigma)/(d t) = n_sigma q_sigma (E + u_sigma times B) - gradient P_sigma - R_(sigma alpha),  $
where $u_sigma$ is the species velocity of $sigma$, and $d"/"d t$ is the convective derivative,
$ d/(d t) = partial/(partial t)+u_sigma dot gradient $
- Equation of state for each species
#figure(
table(
  columns: 3,
  align: center,
  table.header(
    [Regime],
    [Equation of state],
    [Name],
  ),
  [$V_(p h)>> v_(T sigma)$],
  [$P_sigma space ~ space n_sigma^gamma$], [adiabatic],
  [$V_(p h) << v_(T sigma)$],
  [$P_sigma = n_sigma kappa T_sigma,space T_sigma = "constant"$], [isothermal],
),
caption: ["Equation of state for different regimes"],
)
#set align(left)
- Maxwell's equations
As described in @maxwellequations.
/*
$ gradient times bold(E) = - (partial bold(B))/(partial t) $
$ gradient times bold(B) = mu_0 sum_sigma n_sigma q_sigma bold(u)_sigma + mu_0 epsilon_0 (partial bold(E))/(partial t) $
$ gradient dot bold(B) = 0 $
$ gradient dot bold(E) = 1/epsilon_0 sum_sigma n_sigma q_sigma $
*/
=== Magnetohydrodynamic equations

These set of equations are best suited for low frequency, magnetic behavior of plasma in large spatial scales. On contrast with the two fluid equations that took two species velocities, MHD equations use the relative velocity between ions and electrons, the current density,
$ bold(J) = sum_sigma n_sigma q_sigma bold(u)_sigma $ and the center of mass velocity,
$ bold(U) = 1/rho sum_sigma m_sigma n_sigma bold(u)_sigma $
where the total mass density can be written as,
$ rho = sum_sigma m_sigma n_sigma $
The electron inertia term ($m_e "d" bold(u)_e"/"d t$) can be neglected when it is small compared to the magnetic force term like in cases velocities perpendicular to *B* and when the phenomenal characteristic time scales are longer compared to the cyclotron motion. Similarly, the Hall term ($- bold(J) times bold(B) "/" n_e e$) can be neglected when the pressure term in the MHD equation of motion is negligible and when the electron-ion collision frequency is large compared to the electron cyclotron frequency ($omega_(c e) = q_e B "/"m_e$)

The MHD equations can be summarized as,
- Mass conservation
$ (partial rho)/(partial t) + gradient dot (rho bold(U)) = 0 $
- Equation of state and associated equation of motion
 + Single adiabatic regime, where collisions equilibrate perpendicular  and parallel temperatures so that pressure and temperature are isotropic.
   $ P/rho^(5 "/"3) = "const." $
   and the equation of motion is,
   $ rho (D bold(U))/(D t) = bold(J) times bold(B) - gradient bold(P) $
 + Double adiabatic regime, where collision frequencies are insufficient to equilibrate perpendicular and parallel temperatures,
   $ (P_parallel B^2)/rho^3 = "const." space space space space space space space P_perp/(rho B) = "const." $
   and the equation of motion is,
   $ rho (D bold(U))/(D t) = bold(J) times bold(B) - gradient dot [P_perp I(<-->) + (P_parallel - P_perp) B B] $
- Faraday's Law $ gradient times bold(E) = - (partial bold(B))/(partial t) $
- Ampere's Law $ gradient times bold(B) = mu_0 bold(J) $
- Ohm's Law $ bold(E + U times B) = eta bold(J) $
The main assumptions for the above equations are:
+ The plasma is charge neutral (characteristic length is larger than Debye Length)
+ The characteristic velocity is slow compared to speed of light
+ There is no electrothermal EMF (pressure and density gradients are parallel)
+ The time scale is long compared to both the electron and ion cyclotron periods

=== Single plasma particle model
Collision-less models become important in hot plasmas because collisions occur infrequently enough to take long time scales in achieving Maxwellian velocity distributions. // Verify this statement
Here, thermodynamic equilibrium is not maintained and and single particle dynamics affect macroscopic dynamics. Drift equations can be obtained by solving the Lorentz equation, $ m (d bold(v))/(d t) = q (bold(E + v times B)) $ while assuming different time scales for different species.

//==== E $times$ B drift
A charged particle in an electric and magnetic field experiences the electric force $q bold(E)$ and the magnetic force $q bold(v times B)$. The magnetic force does no work, so only the electric field can change the particle's energy. For a particle at rest, the Electric Field accelerates the particle in the y direction which interacts with the magnetic field to produce a force to accelerate the particle in the x direction. The x component of the velocity interacts with the z magnetic field to lower the y direction. Both the electrons and ions drift in the same direction, independent of the initial velocity and the average drift velocity can be given as $ bold(v)_E = bold(E times B)/B^2 $
A steady state electric field perpendicular to a magnetic field does not drive currents in the plasma but promotes a bulk movement movement with velocity $bold(v)_E$. A steady state force perpendicular to the magnetic field on the other hand causes opposite directed motions for electrons and ions driving a cross field current, $ bold(J)_F = sum_sigma n_sigma bold(F times B)/B^2 $

=== Navier Stokes + source terms
For most aerospace applications, the magnetic Reynold's number, $R_m = mu L u sigma$, is quite smaller than unity. For this condition, the induced electromagnetic field is negligible in comparison with the applied field and the Lorentz force and Joule heating can be treated as source terms in the Navier-Stokes equation. This method is also called the Low Magnetic Reynolds Number formulation. The time dependent, compressible Navier Stokes equations are coupled with the electromagnetic forces and Joule heating in the conservative laws. When a current travels through a fluid in conditions with negligible magnetic induction, the two main changes are the addition of the Lorentz Force to the momentum equation and Joule Heating to the energy equation. The source term equations are given in @ABLE

/*
== Magnetohydrodynamics
Simply put, Magnetohydrodynamics (MHD) is the study of an electrically conducting fluid in the presence of a magnetic field @cowling_magnetohydrodynamics_1976. It involves coupled interaction between fields and fluids as th currents produced in the fluid can change the fields, while the movement of the fluid in the fields can change their fluid motion. MHD adopts the continuum approach, where plasma are regarded as continuous fluids and this is generally valid except for rarefied snd rapidly varying field conditions.

*/

== Air Breathing Lorentz Engine (ABLE) <ABLE>

//#text(red)[Not complete. To add content explaining the general schematic and analytical expressions here]
The Air Breathing Lorentz Engine takes in supersonic air, ionizes it using non equilibrium methods such as electron beams, and applies mutually perpendicular electric and magnetic fields to accelerate the plasma. A simplified 2D schematic that will be used for further analysis is shown below in @ABLEoutline.
#figure(image("ABLE_10mmWidth_Outline.svg", width: 100%,),
  caption: "The Outline of the engine used for 2D analysis",
  )<ABLEoutline>

The '10 mm' wide and '100 mm' long engine sizing is set to compare with a similar computational study done in the University of Colorado Boulder @kava_numerical_2021. High energy electron strike against a metal target and pass through a foil. Majority of the energy is lost at the foil, but would still have sufficient energy to ionize the incoming flow. The electric potential at the electrodes can be varied from $~ 300 V$ to $~ 1500 V$ and this dictates the $y$ electric field across the channel. The electrodes are segmented to reduce the Hall effect and cross currents in the channel. Using electromagnets, a maximum magnetic field of $~ 1 T$ can be generated in the $z$ direction.


=== Load Factor
The load factor is a measure of efficiency for the thruster and can be defined as shown below, 
$ "Load factor" = E/(u B) = ("KE increase"+"Joule Heating")/"KE increase" $


The load factor is calculated as $E"/"(u B)$ based on the core flow, where $u B$ is the back emf. The load factor can also be defined as the sum of increase in kinetic energy and Joule heating divided by the increase in kinetic energy. (Example: For a load factor from 2.1 to 2.3, it implies that ~45% of MHD power increases kinetic energy and ~55% contributes to Joule heating.) //For an increase in magnetic field strength to 2 to 3 Tesla, the corresponding load factor is 1.5 and 1.3 respectively) 

=== Conductivity Model
There are various conductivity models that aim to simulate plasmas in different conditions. An appropriate model can only be verified through the comparison of the model with experimental data. For the purpose of this study, the model that has been chosen for now is based on the model as described by Parent @parent2024progress.

The model assumes that the primary factor determining the conductivity of the plasma is the collisions between the various species of the plasma. Considering the conductivity to be driven by collisions, we can take the effective collision frequency between electrons and neutrals as,
$ nu_(e s)=n_s sigma_(e s) ((8 k T_e)/(pi m_e))^(1/2) ,$
where the effective electron-neutral energy exchange cross section is defined by the curve fit @gnoffo_conservation_nodate,
$ sigma_(e s) = a_s + b_s T_e + c_s T_e^2 $
The constants are generated from effective collision cross section data at 5000, 10000, and 15000 K found in [Ref 68] are given in the table below.
#figure(
table(
  columns: (auto,auto,auto,auto),
  align: center,
  table.header([$bold(s)$], [$bold(a_s)$], [$bold(b_s)$], [$bold(c_s)$]),
  [N], [5e-20], [0], [0],
  [O], [1.2e-20], [1.7e-24], [-2e-29],
  [$N_2$], [7.5e-20], [5.5e-24], [-1e-28],
  [$O_2$], [2e-20], [6e-24], [0],
  [NO], [1e-19], [0], [0],

),caption: [Effective collision cross section constants for common species in air]) <crosssectiontable>

=== Finite segmentation
It is common to segment the electrodes in the channel and to reduce the Hall current and arcing. The effect of finite segmentation is to lower the apparent electrical conductivity and apparent Hall Parameter @rosa_part_1956. Through analytical and numerical analysis,
$ sigma_"apparent"/sigma_"real" = beta_"apparent"/beta_"real" = 1/(1+s/h (beta-0.44)) $

Here $s$ is the electrode spacing, $h$ is the channel height, as shown in the figure below.          
#figure(image("Figures/Segmented_electrodes.svg",width: 70%,), 
caption: "Schematic of finite segmentation")                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           



== Computational Fluid Dynamics
=== Eilmer

Eilmer is an open source compressible Navier Stokes flow solver developed at the University of Queensland with a focus on Hypersonic flow @gibbons2023eilmer. The strength of Eilmer is in its numerical routines for solving mixed hyperbolic/parabolic partial differential equations (PDEs), discretized using finite-volume methods. These PDEs govern viscous, compressible flows in two or three dimensions, incorporating additional physics such as multi-species-gas, multi-temperature-gas, MHD and turbulence.

The solver employs a reconstruction-evolution approach for inviscid flux calculations, with spatial accuracy up to fourth-order on structured grids and second-order on unstructured grids. Viscous fluxes are computed using compact stencils. Time integration is handled via explicit low-order Runge-Kutta (RK) schemes for unsteady flows and a Jacobian-free Newton-Krylov method for accelerating steady-state convergence. Domain decomposition enables parallel execution, supporting both shared and distributed memory architectures.

Eilmer also features a programmable interface using Lua for pre- and post-processing, as well as runtime customizations.

=== Three Temperature Model <threeTempmodel>
The ABLE (PFE) simulations use the three temperature model developed by Robert Watt for Eilmer to simulate chemical and vibrational nonequilibrium effects @watt2022modelling. There are essentially three temperatures; Translational/rotational, Vibrational, and Free-electron. There are also two electronic modes where in electronic mode '0', the electronic temperature is coupled with the vibrational temperature and in electronic mode '1', the electronic temperature is coupled with free electron temperature. When energy is added into the vibrational or free electron energy pool, the distribution between electronic and other temperatures is based on CEA data tables. Electronic mode '0' might be better for the present project as the free electron energy does not need to share energy with the electronic mode. It allows for the determination of number densities of the species involved in the flow based on the energy transitions between various states.

In the Eilmer setup, the electronic mode can be specified in the chemistry setup file and regardless of the electronic mode selected (i.e which pool of energy the electronic energy shares with), the source term file can be configured to allow the source of energy to be shared with different proportions to the vibrational and free-electron pool of energy. At this present time, it is not well understood how the proportions should be defined to accurately simulate the plasma flow in the ABLE engine. An arbitrary 50-50 distribution was used in previous simulations, and understanding the correct distributions is a key part in better understanding the physics of the specific plasma regime.

In ionized air, there are generally 10 species involved: N, O, N#sub[2], O#sub[2], NO, N#super[+], O#super[+], N#sub[2]#super[+], O#sub[2]#super[+], and NO#super[+]. Since the concentrations of N#sub[2]#super[+], O#sub[2]#super[+], and NO#super[+] are small, their contributions to the internal energy can be neglected (but it is not in our case?). In a quasi-steady state, the lower electronic states of an atom tend to be in equilibrium with the ground electronic state as defined by the electron temperature

The convergence of the CFD solutions is limited by the electron impact ionization. Electron impact ionization lets a colliding electron produce an additional electron through ionization of a neutral, and this resembles an avalanche reaction. This rapid increase in electron number density increase energy absorption which lowers the heavy particle translational temperature. This lowering of temperature increase density and its sharp increase takes the form of an ionization shock traveling through as a pressure wave. This has been observed experimentally, but during avalanche ionization in computation, the electron work term in the electron energy equation becomes large enough to deviate from the hyperbolic form of time integration. This can manifest as a numerical artifact leading to divergence. To minimize divergence, proper implementation of electron conduction to reduce spatial gradient in electron temperature and proper implementation of chemical source terms to reduce electron temperature gyration. 
The specific heat for electronic excitation is high for high temperatures and this means that a large amount of energy is required to raise the electron temperature. Divergence can be lowered by introducing a relaxation parameter that slowly ramps up the chemical reactions over a set amount of time.
==== Electron Impact Vibrational Transition
Electron impact on ions do not contribute to rotational excitation due to the low momentum of the electrons. It does contribute to vibrational excitation however, since vibration is more energy dependant. Electrons that impact an ion, momentarily change it into a negative ion that changes the potential of the nucleus. This change in potential can either increase or decrease the acceleration causing a change in vibrational energy. The relaxation time for equalization of vibrational temperature on N#sub[2] and electron translational temperature is low in the electron temperature range between 5000 and 15,000 K @park1989nonequilibrium.

==== Electron Impact Electronic Transition
Collisions between electrons and molecules can also cause electronic transitions. generally overall cross sections for all  vibrational combinations are of the same order of all electronic transitions. Electronic transitions occur with preference over certain vibrational states. The initial and final electronic vibrational states must spatially overlap for electronic transition to occur. \
The number density for electronic excitation states can be calculated by treating these states as separate molecules but they are deemed unnecessary for the molecular species in air. For N#sub()[2] and NO, the first excited electronic states have high energy requirements when compared to the ground state and so they are hardly populated. This can imply neglecting them for calculating internal energies and recombination rates. Because of the high energy state, and despite having similar cross section to that of the vibrational and rotational states, dissociation prefers the vibrational route. On the other hand, O#sub()[2] has two low lying excited states, but as the electronic temperature is coupled with the vibrational temperature, the population of the two excited states are in equilibrium with the ground electronic state at the vibrational temperature.

#pagebreak()
= Literature Review <litrev>

//{Short summaries and take aways from all important literature}

The literature specific to the initial term 'Plasma Fuel Engine' is quite limited, but the general idea has existed in various forms and names. The concept ideated in the 1960's when there was interest in how magnetohydrodynamic phenomenon can aid hypersonic flow testing @resler_prospects_1958 @rosa_part_1956. 

== The prospects of magneto-aerodynamics@resler_prospects_1958

Although technically not the first ever mention of the possibilities in this field, this paper did encapsulate some of the intrinsic motivations behind pursuing MHD effects in aerodynamics. The paper broke down the fundamental equations for an electrically conducting fluid in the presence of electromagnetic fields in the aerospace context. The paper justifies that the "electric body force" or Lorentz Force is a body force that directly affects the fluid elements and as a vector product of the electric current and magnetic field strength, the current flows through a volume (not a wire) and therefore uses the current density vector and lines-of-force per square centimeter (gauss). Since high speed flight encounters high enough temperatures for air to ionize, this opens an opportunity to make use of this body force. The paper derives primitive continuity, momentum and energy relations using the first law of thermodynamics but do not include any interchange of energy apart from internal energy, mechanical work and Joule Heating.

To choose appropriate approximations for the analysis, the paper decided on some "probable magnitudes" for the aerospace regime. Non seeded air was determined to have reasonable conductivities only at extreme temperatures, so the study used seeded air for the analysis with $sigma=1.0 "mho/cm"$ as standard conductivity for this application. For the magnetic field strength, an arbitrary but feasible (at that time) 1000 Gauss (0.1 Tesla) was chosen. The paper also considered dimensionless ratios to determine the efficacy of an inviscid theory of magneto-aerodynamics and concluded that an inviscid theory can be a good first approximation, but boundary layer effects have their importance too. Taking a $1 "m"$ length scale, the magnetic Reynold's number is quite small and the induced magnetic field can be negligible. 

Considering acceleration of a gas in one-dimensional channel flow, where the gas properties only vary along the x direction, the paper derived $u'$ and $M'$, the acceleration and derivative of the Mach number along x respectively.
$ u' = 1/(M^2 - 1) (u/A A' - (sigma B^2)/p (u-u_3)(u-u_1)) $ <uprime>
$ M' = (1+[(gamma-1)"/"2]M^2)/(M^2-1) (M/A A' - (sigma B^2)/(a p) (u-u_3)(u-u_2)) $
where the significant velocities $u_1$, $u_2$, $u_3$ are defined as,
$ u_1 = [(gamma-1)/gamma] (E/B) $
$ u_2 = [(1+gamma M^2)/(2+ (gamma-1)M^2)]u_1 $
$ u_3 =E/B $

#figure(
  image("1Daccelregimes.png", width: 40%),
  caption: [Acceleration regimes in a one-dimensional channel flow. Regimes of positive acceleration and increasing Mach Number are designated by cross-hatching as shown. $u_1$ $u_2$, and $u_3$ are the significant speeds. Arrows denote typical behaviors of flows in the various regimes; arrowheads show direction of increasing x (downstream) @resler_prospects_1958.],
)<1Daccelregimes.png>

As shown in @1Daccelregimes.png, there are certain possible regimes for the flow to accelerate and decelerate based on their speed relative to the various significant speeds defined. According to @uprime, maximum acceleration can be achieved for a certain $E"/"B$ value,
$ E/B = [(2 gamma-1)/(2 (gamma-1))] u $ <maxEbyB>
A limitation in the paper is that the $E-u B$ value must not be greater than the "breakdown-potential" of the gas (For air $"~"$ $2 times 10^7 "volt cm"^2 "/gm"$ )

The authors concluded that magneto-aerodynamics could find application in decelerating re-entry vehicles, controlling skin friction and heat transfer, and accelerating or decelerating channel flows (which is especially relevant to the current project). The authors predict that there could be challenges in finding engineering solutions to higher magnetic fields and dealing with the higher surface resistances of electrodes in contact with the fluid.

== A Theoretical Treatment of the Steady-flow, Linear, Crossed-field, Direct-current Plasma Accelerator for Inviscid, Adiabatic, Isothermal, Constant-area Flow
This paper was a technical report from the Langley Research Center looking into an idealized solution for linear crossed-field plasma accelerators @wood_theoretical_1961. The primary assumptions in this paper are that the flow is inviscid, adiabatic, isothermal and under constant cross-sectional area. The paper uses the microscopic perspective to support the macroscopic point of view for the accelerator. 

#figure(image("image.png"),
caption: [Schematic of a plasma accelerator @wood_theoretical_1961]
)

The paper postulates that the microscopic view of the plasma accelerator can be simplified in a three component plasma as the ions acquire momentum from the applied electric field and impart that momentum through collisions to the neutral atoms. If all the momentum gain from the Electric field is transferred to the neutral atoms, the field can be calculated in terms of the momentum transferred through collisions. The accelerator is considered isothermal as the decrease in temperature due to acceleration is compensated by the increase in temperature through Joule Heating. Considering the mass difference between ions and electrons and large gyro radius with frequent collisions for the ions, the ions can be said to have frequent collisions without completing one gyration. Although the force can be considered directing the neutrals parallel to the axis of the channel, the ions velocity vectors tend to have a slight angle above the axis.

For the macroscopic analysis, the equations of motion, energy and conservation of mass are written in terms of average velocities. Assumptions like negligible partial pressure of the charged species, no Lorentz force in the y direction, and algebraic manipulation of the equations lead to a simplified form of the equations. The Joule heating is taken to be the difference of energy between the power input and the rate of work done by the Lorentz Force ($W_(L F)$). The Joule heating term due to the slip between driving and driven components of the plasma is a function of their velocity difference. The Lorentz force $j times B$  is the accelerating force, in which $j$ is primarily due to the flow of electrons. The paper concludes that the effect of the cyclotron angle ($omega tau$) on Joule Heating rate and accelerator length is small only for values around $10^(-3)$ radian or less.
// Look at thermal velocities and cyclotron angle derivations again if there is time.

== Experiments in Steady State Crossed‐Field Acceleration of Plasma 
The author in this paper describes one of the earliest experiments demonstrating successful acceleration of plasma in a linear crossed-field accelerator at moderately high density @wood_experiments_1961. The experiments done in the Langley Research Center follow their previous theoretical study. 
The small scale experiment used a 150kW arc jet discharge rotated by a magnetic field. This discharge heated the 2 $1/2 " " g"/"sec$ 1 $"atm"$ nitrogen inflow to a 7000 $K$ stagnation temperature. The heated nitrogen was seeded with cesium vapour. The Mach 2 flow was subject to magnetic fields of 4000 and 11000 $"gauss"$ and electric fields of 30 to 50 $"V/cm"$ in channel lengths ranging from 2 to 7 cm. Measured current densities were in the range of 6 to 30 $"amp/cm"^2$. A 5 to 25% increase in stagnation pressure was measured when the fields were applied. They found 45 to 95% agreement with the change in stagnation pressure values from their theoretical model described through @stagprestheory.
$ (Delta H)/(H Delta x) = (gamma M^2)/(2+ (gamma-1)M^2) [(2 j B)/(rho u^2)-(gamma-1)(M^2 j^2)/(sigma rho u^3)] $ <stagprestheory>

== Analytical solution for constant enthalpy MHD accelerator
This paper pursues the theoretical analysis for a crossed field accelerator that can be used to increase the velocity with constant enthalpy in a low density hypersonic wind tunnel @mirels1964analytical. The motivation behind this paper was  to investigate analytical solutions that were suitable for an appropriate sized accelerator, where the axial energy addition and the area variation are specified. Segmented electrodes are considered for the analysis to force current in the y direction, regardless of the Hall parameter ($omega tau$). The upstream and downstream ends of the accelerator are insulated from each other to prevent a current in the x direction. The derivation resulted in understanding that the length required to achieve a certain velocity decreases as the electric field and '$n$' increases. When  $n$ is 0, there is uniform energy addition per unit x. The solution presented requires the electric and magnetic fields to vary with x, but that should be experimentally feasible.

== Electron beam preionization in an MHD generator
This paper wanted to explore electron beam preionization as a means of non-equilibrium ionization for MHD generators in applications where you would need higher conductivity without increasing to very high temperatures @shair_electron_1965. A previous study that explored the use of electron beams utilized polyatomic combustion products as the working fluid. These experiments rather used monoatomic argon seeded with cesium at atmospheric pressure without exceeding 1500 $K$.

In these high density slower tests, Argon is preheated in a molybdenum mesh core heater at a mass flow rate of 90 grams/sec. The cesium is injected after this and the electron beam approximately 25 cm downstream of the seed injection. There is one microwave interferometer before and after the generator channel used to measure the electron density and in turn infer the electron temperature. The conductivity is taken assuming Saha equilibrium and the recombination rate is calculated using three body recombination relations where the rate is proportional to $(T_e)^-9/2$. These simplistic assumptions led to a result of slow recombination, but this was from backtracking the rate correlating the theoretical and experimental conductivities at the microwave stations. The authors could not conclusively determine the exact recombination rate, and recognized it could in fact have a higher recombination rate that could be picked up with more measurements. They however did conclude that the MHD generator concept is worth pursuing further since it showed promise in producing more power than the electron beam consumed.

== A Graphical Presentation of Magnetogasdynamic Accelerator and Generator Performance 
The generalized Ohm's law is used to create a graphical performance map from dimensionless electric properties @powers_graphical_1967. Continuous electrode, Faraday, diagonal conducting wall, and Hall accelerator and generators are analyzed for their dimensionless power density and efficiency in the performance map. All the power densities and efficiencies are taken independent of the Hall parameter, with the power density ($J dot E$) supplied for Lorentz acceleration given by $U B J_y$.  In an accelerator, the power density is positive, and it is negative for a generator as $J_y$ is negative. Local accelerator efficiency is given by,
$ eta_A = (U dot J times B)/(J dot E) = 1/eta_G  $
Taking dimensionless values for $E_x$, $E_y$, $J_x, J_y$, the new $E_x "and" E_y$ axes rotate through the angle $"tan"^(-1)Omega$ and since $Omega$ is always positive, the locus is represented as a semicircle lying in the positive $J_x$ and negative $J_y$ quadrant as shown in @dlessgraph.

#figure(image("dlessgraph.png", width: 69%),
caption: [Dimensionless quantities plane showing how axes are scaled @powers_graphical_1967] 
) <dlessgraph>

The different electrode designs can be visualized in @elecdesign and can be taken for an accelerator if the load is replaced by a power supply.

#figure(image("image-1.png", width: 50%),
caption: [Different electrode designs based on electrode connection @powers_graphical_1967]
)<elecdesign>

The performance map after simplifying the equations and deriving a dimensionless laboratory power density is shown below. The map shows the regions pertaining to the different electrode configurations.

#figure(image("image-2.png", width: 70%),
caption: [Performance map for different electrode configurations @powers_graphical_1967] 
) <performancemap>

=== Continuous Electrode (CE)
The CE configuration has no axial field and is represented by the $E_y$ axis in @performancemap.

=== Faraday
The Faraday configuration has no axial current and is represented by the $J_y$ axis in @performancemap. Here the accelerator efficiency drops with increasing power density, where the scaled accelerator efficiency is maximum for a given J_y, when J_x is zero. In theory, for a given power density, the Faraday device is the most efficient. Practically, due to breakdown consideration, a limiting axial electric field exists for segmented electrodes. In @performancemap, it is 2 ($E_(x^l)$) for an accelerator.

=== Diagonal Conducting Wall (DCW)
The DCW configuration has a constant and specific field ratio, $phi.alt=E_y"/"E_x$. As there exists a quadratic equation between the dimensionless laboratory power density and the scaled accelerator efficiency, the accelerator can operate at the same efficiency for two different power densities. The maximum efficiency occurs with a finite axial current, while increasing the power density until $J_x$ is zero reduces the efficiency. The current densities at accelerator open circuit are shown on the map at power density $= E_x =0$. The accelerator operates in the "braking-region" between open circuit and zero efficiency conditions. To avoid this braking region, a power density greater than $1"/"(Omega+phi.alt)^2$ should be applied.

=== Hall
The Hall configuration has no transverse electric field and is represented by the $E_x$ axis in @performancemap. The analytical expressions were derived by setting $phi.alt=0$.

== Performance of a 500-kjoule MHD Wind Tunnel
This paper is an experimental report from the Aerospace Corporation describing the results of an MHD accelerator used to improve a wind tunnel @grabowsky_performance_1969. The motivation behind this project is to utilize MHD acceleration for improving wind tunnel performance. The test facility described in this paper  uses a hot shot to produce high temperature potassium seeded nitrogen for a test time of about 3 msec. The total energy supplied to the tunnel is 500kjoule. 

The 1D solution that dictated the design of the accelerator assumed constant enthalpy, specified area variation, and energy addition per unit length proportional to a power of the velocity. The constant enthalpy was used to create consistent altitude conditions for the test flow, without encountering very high temperatures or dissociation effects. The design parameters were backtracked from desired enthalpy conditions at the inlet and exit bounded by the reflected region of a shock tunnel. The physical constraints imposed were 
+ Maximum magnetic field strength of 4 wb/$"m"^2$, 
+ Negligible ion-slip effects (Hall parameter $beta < 10$) //less than or equal to
+ Minimum accelerator length
+ Total energy of 500 kjoule
+ Reasonable boundary layer thickness compared to channel width

The centerline velocity increased from 16 kft/sec to 24 kft/sec while keeping approximately constant enthalpy. The paper did find some unexplained irregularities with the Hall potential downstream and associates it with flow non-uniformities due to 2D effects. It also found that the conductivity at the start of the channel entrance was quite low.


== MHD Augmented Shock Tunnel  Experiments with Unseeded,  High Density Air Flows
The paper describes some of the measured MHD interaction effects of one of the first MHD augmented shock tunnel experiments with unseeded, high density air flow @harris_mhd_1975.
#figure(image("image-3.png", width: 50%),
caption: [Schematic of the MHD augmented shock tunnel @harris_mhd_1975]
)
The accelerator was 12.25 inches in length, had a square cross section (0.5 x 0.5 inches entrance) and an area ratio of 2. The accelerator had 38 pairs of segmented electrodes  and with an air conductivity of around 110 mho/m and nominal magnetic field strength of 5.2 W/$m^2$.
The accelerator performance was measured through the voltage gradients at the wall, current-time history, channel static pressure, open circuit induced potentials, and nozzle impact pressure. They estimated a 100 V surface sheath loss from the measurements. Under the most optimal conditions, they reported a velocity increase from 19,600 fps to 24,000 fps in the test section.

== Electron beam generated plasmas in hypersonic magnetohydrodynamic channels
Although there are other, perhaps simpler ways of ionizing incoming air, high energy electron beam ionization is one of the most efficient ionization sources @macheret_electron-beam-generated_2001. This is because the highest efficiency is achieved when the mass of the incident particle is equal to the electron mass that needs to be excited. The advantages of electron beam ionization are:
+ Most efficient form of ionization. Even at low temperatures and low electrical fields, an adequate electrical conductivity for MHD operation can be created with reasonable beam energy and current.
+ Because of high electron energies, ionization cross section increases when incident electron energy decreases. So higher ionization inside the channel than near the wall. this reduces chance of short circuiting through the hot highly conductive boundary layer.
+ Externally sustained ionization is more stable than self-sustained non equilibrium discharges. (Electron beams are in the direction of $arrow(B)$)
Reference @macheret_electron-beam-generated_2001 also talks about the coupling of the electrode sheaths and boundary layers in Hypersonic Plasma flow. There are two main heating mechanisms involved; viscous dissipation and Joule heating. If Joule heating is smaller than viscous heating, we can uncouple sheath and boundary layer. But, for  electrode sheaths immersed in hot rarefied boundary layers, Joule heating rises and can lead to instability.


== Is the MHD scramjet really an advantage?
This is an interesting paper where they critiqued the practicality of the MHD bypass concept @bottini_is_2003. 
//The MHD Bypass concept is simply extraxting energy from and therby slowing down the inlet flow through an MHD generator and using that energy to accelerate the flow closer to the nozzle using an MHD accelerator. 
In conventional scramjets, the multi-shock inlet used to slow down the flow creates losses in the engine and the MHD bypass concept can be used to minimize the entropy rise of the shock system. The question is then posed of whether the added complexity of extracting energy from the flow using an MHD generator and then accelerating it using an MHD accelerator has a smaller entropy increase when compared to the gasdynamic shock system. Two models were studied, one where the coupling between the Navier Stokes and Maxwell equations were ignored and one where they were not. For a flight Mach number of 10, and a generator entrance Mach number of 4.7, the MHD bypass performance was calculated with corresponding entropy rise. Higher Mach numbers showed lower specific thrust and impulse, but the values were still relevant ($~2000$s Isp). Although the efficiency of the accelerator was limited by the high speed in these types of engines, the authors concluded that the MHD bypass concept is still promising and worth further study.
/*
== Performance Theory of Diagonal Conducting Wall Magnetohydrodynamic Accelerators

== Numerical Study of an Electron-Beam-Confined Faraday Accelerator
*/
== Detailed modelling of plasmas for computational aerodynamics
The computational efficiency of the drift diffusion model can be significantly increased by obtaining the potential from Ohm's law rather than Gauss's law while maintaining the validity of Gauss's law by adding source terms to the ion transport equation @parent_detailed_2016. The authors found that the stiffness in the simulation was not caused due to the usual culprit of large  variation in time scales but rather due to Gauss's law amplifying the numerical error associated with the densities within quasi-neutral regions.

/*
== Numerical Simulation of Electron-Beam Powered Plasma  Fueled Engines


== Three-Dimensional Numerical Analysis of Plasma Fueled  Engines

*/
== Electron losses in hypersonic flows
Reference @parent_electron_2022 states that the the sheaths have a profound effect on the electron temperature not only in the vicinity of the surface but deep within the quasi neutral region. This was attributed to:
 - The amount of electron cooling taking place within the sheath being in proportion with the electron heating elsewhere.
 - The high electron thermal conductivity spreading the sheath cooling effect to the rest of the plasmas.
 Since ambipolar diffusion depends on the electron temperature and that in turn depends on the sheath, it is important to incorporate sheath effects for an accurate simulation of electron loss by diffusion to the surface. The different effects derived from the new park model are given below.

=== Effect of dynamic pressure
The dynamic pressure region explored here is between 1-50 kPa. Both electron losses and gains increase with higher dynamic pressure. The electron gains are essentially due to associative ionization while electron impact ionization is negligible. Dynamic pressure affects the electron loss ratio as the vast majority of electrons are lost through two body recombination in high dynamic pressure, however at lower dynamic pressures, very few electrons are lost through two or three body recombination. The electron losses can be considered evenly split between diffusion to the surface and convection out of the outflow boundary. Two body recombination is lower at lower dynamic pressure because for a given Mach number, lower dynamic pressure entails a lower flow density and lower charged species densities, and the two body recombination loss mechanism scales with the densities of electrons to the square while the electrons lost to the surface is more simply proportional to the density of electrons.


=== Effect of Mach Number
This was evaluated by varying free stream Mach number between 12 and 24, while keeping dynamic pressure and geometry constant
At lower Mach numbers, the main electron loss mechanisms are surface recombination and outflow convection. While at higher Mach numbers, most of the electrons are lost through two body recombination (i.e dissociative recombination). Surprisingly, two and three body recombination becomes stronger compared to other loss mechanisms as the Mach number increases. Intuitively, i) an increase in Mach number at constant dynamic pressure leads to lower flow densities and ii) rate of two and three body recombination scales with the plasma density to the square and cube respectively while electron loss to the surface or through outflow scales more or less proportional to plasma density. It cannot be due to higher mach number leading to higher temperatures which increase rate coefficient because rate coefficient either decreases with increasing temperature (Three body recombination) or are weakly dependent on temperature (Two body recombination). Rather the recombination process is higher due to plasma density increase since most ions and electrons being created through associative ionization ($"O"+"N"arrow"NO"^++"e"^-$). Thus the density of plasma depends strongly on presence of N and O radicals and they go up strongly as the translational temperature of the mixture is raised and the mixture temperature downstream of the shock reaches higher values for larger Mach numbers.


=== Effect of leading edge radius
This was evaluated by fixing the Mach number and setting the dynamic pressure either on 1 or 10 kPa
At the higher radius considered of 10 cm, almost all electrons are lost through the two body dissociative recombination process. But when the leading edge is on the order of millimeters, at least as many if not more electrons are lost to the surface and outflow boundaries. The two body recombination is not significant at small scales because the ratio between the volume of flow behind the shock and the surface touching the flow become smaller as the scale is reduced. When free stream properties remain constant, the amount of electrons lost through two body recombination scales with the volume of the flow behind the shock because the reaction rates (depends on densities and temperature) varies very little. While the amount of electrons lost to he surface is proportional to the surface area exposed to plasma flow and not volume. Similarly the electrons lost through the outflow boundary is proportional to the outflow boundary surface and not volume of the flow.

=== Importance of Plasma Sheath
Non neutral sheaths affect the electron temperature through electron cooling and electron temperature affects recombination rates and ambipolar diffusion to the surface. Electron cooling occurs in the sheath because the electromagnetic energy input in the sheath is strongly negative. Electromagnetic energy input can be expressed as $arrow(E)dot arrow(J_e)$, where $arrow(E)$ is electric field and $arrow(J_e)$ is the electron current. Within a sheath besides a dielectric, net current to the surface is zero. The electron current coming out of the surface must therefore balance the ion current to the surface. Electric field points towards the surface while electron current points away from the surface. High electric field and high electron current due to the diffusion leads to large negative $arrow(E)dot arrow(J_e)$ magnitude which results in cooling of electrons. Due to fast electron thermal conductivity, the cooling is not limited to the sheath but spread to the quasi neutral plasma flow far from the surface. For high electron cooling, maximum electron temperature on stagnation streamlines drop to below free stream and losses to the surface dominates over recombination. For low electron cooling, electron temperature reaches maximum vibrational temperature and two body recombination becomes dominant.

=== Limitations of the physical model
A continuum model would lead to significant errors when mean free path is proportional with the distance between shock and surface (like during low free stream dynamic pressure of 1 kPa AND low leading edge radius of 1 mm). For those cases Direct Simulation Monte Carlo (DSMC) might be preferred. Since collisions in the sheath have been detected here, a collision-less model would not be accurate. Kinetic simulations are better than the drift diffusion fluid model used here as it does not lump both the low and high energy electrons together and would permit more accurate simulations of electron cooling due to high energy electrons going through the sheath and getting absorbed to the surface.



== Progress in electron energy modeling for plasma flows and discharges
Electron temperature is crucial in determining plasma density as it can determine @parent2024progress;
- Electron production through Townsend ionization
- Destruction of electrons through electron-ion two and three body recombination
- Electron loss to the surface (a function of ambipolar diffusion which scales as $1+T_e"/"T$)

Gnoffo @gnoffo_conservation_nodate assumed free electron vibrational relaxation as an infinitely fast process and hence used a single transport equation to obtain both vibrational and electron temperature. Very few simulations of high speed flows solve electron temperature in non-equilibrium. The studies that do, take elastic and inelastic electron energy relaxation terms from [Lee[1984,1985]]. The Problems with Lee's approach are mainly;
- It requires accurate cross sections for all inelastic process
- Even if all cross sections are highly accurate, the electron energy relaxation source terms could be incorrect due to non trivial conversions of cross sections to reaction rate functions of electron temperature.

This paper mainly focussed on overcoming these issues by proposing a new model for electron energy transport. All electron energy loss affecting parameters are reduced to two; the reduced electric field and the reduced electron mobility. Corrections from this paper on the reaction rates of the air-plasma model are implemented in this project and some of the rates are mentioned below. The spline fit curves are yet to be implemented into the air-plasma model.

#figure(
  table(
    columns: (auto, auto, auto),
    align: (left, left, left),
    table.header(
      [*Reaction*], [*Rate coefficient*], [*Reference*]
    ),
    [e + NO#super[+] → N + O], [3.00 × 10#super[-7] (T#sub[e]/300)#super[-0.56] cm#super[3]/s], [Sheehan and St.-Maurice (2004)],
    [e + O#sub[2]#super[+] → O + O], [2.40 × 10#super[-7] (T#sub[e]/300)#super[-0.70] cm#super[3]/s], [Peverall et al. (2001)],
    [e + N#sub[2]#super[+] → N + N], [Rate given as spline-fit through rate data], [Peterson et al. (1998, Fig. 3)],
    [e + N#sub[2] → N + N + e], [Rate given as spline-fit using cross-sectional data], [Phelps and Pitchford (1985, Fig. 10)],
    [e + e + N#super[+] → e + N], [2.20 × 10#super[-40] A#super[2] T#sub[e]#super[-4.5] cm#super[6]/s], [Dunn and Kang (1973)],
    [e + e + O#super[+] → e + O], [2.20 × 10#super[-40] A#super[2] T#sub[e]#super[-4.5] cm#super[6]/s], [Dunn and Kang (1973)],
    [e + N → N#super[+] + e + e], [Rate given as spline-fit using cross-sectional data], [Smith et al. (1962, Fig. 4)],
    [e + O → O#super[+] + e + e], [Rate given as spline-fit using cross-sectional data], [Morgan (1992)],
    [e + N#sub[2] → N#sub[2]#super[+] + e + e], [Rate given as spline-fit using cross-sectional data], [Morgan (1992)],
    [e + O#sub[2] → O#sub[2]#super[+] + e + e], [Rate given as spline-fit using cross-sectional data], [Morgan (1992)],
    [e + NO → NO#super[+] + e + e], [Rate given as spline-fit using cross-sectional data], [Morgan (1992)],
  ),
  caption: [Reaction rate coefficients for electron impact reactions in air plasma @parent2024progress]
)<airplasmareactionrates>


#pagebreak()
= Progress

/*
{Continuation from the literature review, the work done through the simulations so far; taking code from Alexis, adding conductivity model into Eilmer with Nick's help, transitioning simulations to Eilmer 5, updating conductivity to collisional model, updating model to derive conductivity from collisions, present results so far like 11,000 K (~1 eV) limit for recombination.
Also training as an operator in T4 }
#text(red)[Still requires additional content]
*/
From all the previous work looked at in the background in @background and the literature in @litrev. The MHD propulsion concept in various forms have had preliminary modelling and experimental work done. To explore the concept in the context of an airbreathing hypersonic plasma engine, an analytical study is done to understand the overarching physics behind the concept before further computational and experimental work is done. Only the important results from the work done so far are presented here. There are also further results presented in the Appendix.
== Analytical studies
A basic analytical study using first relations is presented here to understand the parameters to focus on during further analysis. The general schematic of the analyzed engine is as shown previously in @ABLEoutline. The spacing between the walls is 10 mm and the length of the engine is 100 mm. An electric potential of 1000 V is applied at the top electrodes while the electrodes at the bottom are grounded. The magnetic field strength is 1 T and the fields are assumed to be constant throughout the duct of the engine. The inflow is set at 3000 m/s ($~ "Mach "10$ at 10 km altitude).

We know that the Lorentz force density is given by $J times B$. To get the thrust produced by the engine, we would need to integrate it over the volume of the engine considered. In our 2D case, we can integrate it over an area of $0.001 " "m^2$. The current flowing through the engine can be taken as the current from the simplified form of the generalized Ohm's law from @simplifiedOhm, or from the current defined through the drift velocity of the electrons from @diffusioncurrent
#math.equation(block: true, numbering: none)[
$J = sigma(E+u_e times B)$ \
$ J = n e u = ((n e^2)/(m nu_c))E $ \
]
Taking the simplified Ohm's law equation and applying the directions for the electric field, magnetic field, and velocity, we get,
#math.equation(block: true, numbering: none)[
$J = sigma(E_y - u_x B_z)$ \
$J =sigma(1000/0.01)-(3000 times 1) $ \
$J=97,000" "sigma$
]
Integrating this current over the cross sectional area and assuming  different values of conductivity, $sigma$ gives us the classical analytical thrust produced by these engines as shown in the table below.

#figure(
  table(
    columns: (auto, auto),
    align: (center, right),
    [*Conductivity ($sigma$)* ($"mho/m"$)], [*Thrust ($J times B$)* (N)],
    [0.1], [9.7],
    [1], [97],
    [10], [970],
    [100], [9,700],

  ),
  caption: [Analytical thrust produced by the engine for different conductivities.],
)

This simple calculation oversimplifies the actual nature of thrust produced by the engine. Lorentz Force is not a mechanical force but rather a body force experienced by the charged particles in the plasma. The transfer of force from the charged particles is driven by ion slip and there is no simple analytical relation for the inter particle effects in the plasma. While this relation does highlight the importance of conductivity and in turn the number density of electrons in the plasma, it again assumes a scalar nature of conductivity and may not be appropriate for the macroscopic overview. The analytical study could  further explore the difference between currents using different relations and the effects of assuming mechanical forces, but further effort and work is focussed on the computational study that aims to account for the complexities of the plasma flow and the experimental study that aims to verify it.
 
== Eilmer 4 modifications
After the initial analytical analysis, a CFD approach was evaluated based on literature. The Navier Stokes plus source term  approximation was used as the starting point to evaluate the performance when compared to the general relations. A source term code in Eilmer 4 was inherited from Alexis Lefevre and Daniel Smith and then went through a series of modifications to better represent the physics of the engine.

The code described a simple rectangular geometry with a hypersonic inflow. The initial configuration included an electron beam region towards the beginning of the engine, followed by an electromagnetic field region emulating the electrodes and electromagnets of the engine. The electric and magnetic fields were added as scalar properties across the domain. The operation of the electron beam was emulated by introducing high energy electrons in the area covered by the electron beam. A relaxation parameter was implemented in the code to avoid instability due to the sudden introduction of a large number of high energy species into the flow. 
The initial code when run without any modifications represented a model with very fast recombination immediately after the electron beam region. This led to lower ionization fractions in the electromagnetic field regions of the engine and practically no thrust. An example solution visualised using paraview is given below in @basicparaview. Various different geometries were tested to see effects of length, width and electrode distance. Most of the simulations focussed on fixing the design to the dimensions mentioned in @ABLEoutline
#figure(
  grid(
    rows: 2,
    gutter: 0em,
    image("Figures/Progress/vel_basic.png", width: 95%),
    image("ebeam_adjusted.png", width: 95%)
  ),
  caption: [Paraview snapshots of the pre-existing model simulated in Eilmer 4. Little to no velocity increase (top) as the electrons recombine immediately after the electron beam region (bottom).],
) <basicparaview>
=== Setup
The introduction of electron beams as a sudden generation of electrons within a specific volume is not necessarily physical despite the end result being the sudden introduction of high energy electrons in a given part of the engine. The simplification implemented in the model does not account for the collisions between the electrons and the species of the gas as it enters the medium and it does not replicate a distribution curve of the electrons within the engine. Regardless, this approximation is considered satisfactory for the present model and an additional configuration was added to the code that introduced preionized air, where the ionization fraction could be specified during setup. The preionized air configuration could be used whenever there could be ambiguity in the electron beam model. As no changes were made to the chemistry of the code, the recombination was still immediate and resulted in a similar outcome as the electron beam model.

#figure(
  grid(
    rows: 2,
    gutter: 0em,
    image("Figures/Progress/vel_preionized.png", width: 95%),
    image("Figures/Progress/econc_preionized.png", width: 95%)
  ),
  caption: [Paraview snapshots of the modified preionized model simulated in Eilmer 4.],
)

To simulate the interaction of how multiple electron beams affect the flow, 4 electron beams were added to the model with a 10 mm spacing between each. Each electron beam seemed to slightly increase the electron temperature compared to the previous beam and a slight velocity increase was seen when compared to the model without multiple electron beams. @multiebeam shows the paraview snapshots of the electron concentration, electron temperature, and velocity for the  multiple electron beam model, one after the other. 'T_modes(1)' is the free electron temperature in the flow from the three temperature model.

#figure(
  grid(
    rows: 3,
    gutter: 0em,
    image("Figures/Progress/multiebeam_econc.png", width: 95%),
    image("Figures/Progress/multiebeam_Te.png", width: 95%),
    image("Figures/Progress/multiebeam_vel.png", width: 95%)
  ),
  caption: [Paraview snapshots of the modified multi-electron beam model simulated in Eilmer 4.],
)<multiebeam>


=== Chemistry modifications
Most simulations set electronic mode to '1' in the three temperature model as explained in @threeTempmodel. When simulations were run in electronic mode '0', they had to be run at extremely low cfl values of the order of $0.01$ or lower to avoid instability. The rapid recombination also did not agree with past observations and literature as experiments that produced an effect on the flow needed to have a high enough ionization fraction to realize MHD effects. Eilmer 4 was then run with and without the chemistry model (i.e reacting=false). When chemistry was switched off, the mechanisms leading to recombination were not accounted for and larger accelerations were observed as seen in @reactingcomparison. As it was not realistic to simulate the engine without chemistry, changes would need to be made to the chemistry model and how conductivity is computed in the code. 
#figure(
  grid(
    columns: 2,
    rows: 2,
    gutter: 0.5em,
    image("Figures/Progress/reactingfalse_econc.png", width: 100%),
    image("Figures/Progress/reactingtrue_econc.png", width: 100%),
    image("Figures/Progress/reactingfalse_vel.png", width: 100%),
    image("Figures/Progress/reactingtrue_vel.png", width: 100%)
  ),
  caption: [Comparison between simulations with chemistry turned off (left) and on (right).],
) <reactingcomparison>
// 08/08/24 and 09/08/24 Pure Faraday mode #10
The initial version calculated the conductivity $sigma$ based on the following formula,
$ sigma=(n_e e nu_c)/B_z $ 
The collision frequency $nu_c$, was calculated based on the collision cross-sections defined by Gnoffo @gnoffo_conservation_nodate. The first collision frequency code is presented below.

#v(0.5em)
```lua
function collision_frequency(v_elec,Te,n_neutrals)  -- Based on Gnoffo (1989) 
  Q_e_N2 = 7.5e-20+5.5e-24*Te-1.0e-29*Te^2
  Q_e_O2 = 2.0e-20+6.0e-24*Te
  nu_en = 1.33*v_elec*n_neutrals*(0.78*Q_e_N2+0.22*Q_e_O2)
  nu_c = 3.0e-5*n_e/(Te^1.5)
  nu_tot = nu_en + nu_c
  return nu_tot
end
```
#v(0.5em)

The biggest change made into the model was the addition of conductivity ($sigma$) as a gas property in EIlmer. This addition has benefits in a wide variety of MHD simulations as the conductivity determines the strength of the current and in turn determines the extent of MHD effects in the flow. Different conductivity models could be directly defined in the Eilmer source  code and cellwise conductivity can be studied after the simulation. The models that were added with the help of Nick Gibbons was the Raizer model for conductivity that is electron temperature ($T_e$) dependant, a diffusion conductivity model, and a constant scalar conductivity helpful in debugging. The code for these models is provided in @conductivitycode of the Appendix.


=== Results

The most interesting result from the simulations from Eilmer 4 is an apparent activation electron temperature ($T_e_"act"$). Recombination of electrons is slowed down after the electron temperature crosses $~ 1 "eV"$ (~11,600 K). Once electron temperature crosses this threshold, there is a rapid increase in velocity. In @activateTe, this temperature is crossed between the 2100 and 4200 (V/m) electric field range. This temperature could be significant due to the specific chemistry model implemented in the simulation. 
// The graph below is probably reacting off and might need to be changed. Is N2+ the important species for that specific temperature? 

#figure(
  image("Figures/Progress/activate_Te.png", width: 65%),
  caption: [Exit velocity and exit electron temperature for different applied electric fields]
)<activateTe>

== Eilmer 5 modifications
The changes made previously were stuck in Eilmer 4 and as Eilmer 4 was soon transitioning to a legacy status, it made sense to convert the model and do all further work in Eilmer 5. This transition involved changing parts of the code and the setup to the new format and verify if the results carried through without change. The modifications made to the source code previously would also need to be ported. 

=== Setup
The geometry setup and grid formation setup did change when compared to Eilmer 4, but the primary geometry that was tested remained the same in the ($10 times 100$ mm) configuration.  The default simulating setup developed for Eilmer 5 was to test six different voltages (350,500,650,800,950,1100) at 10 different configurations of the energy distribution in the source terms file as described in @threeTempmodel and defined in @energydisttable below.
#figure(
  table(
    columns: 2,
    align: left,
    table.header(
      [*Configuration number*], [*Energy distribution*],
    ),
    [1], [90% into mode '0' and 10% into mode '1'],
    [2], [80% into mode '0' and 20% into mode '1'],
    [3], [70% into mode '0' and 30% into mode '1'],
    [4], [60% into mode '0' and 40% into mode '1'],
    [5], [50% into mode '0' and 50% into mode '1'],
    [6], [40% into mode '0' and 60% into mode '1'],
    [7], [30% into mode '0' and 70% into mode '1'],
    [8], [20% into mode '0' and 80% into mode '1'],
    [9], [10% into mode '0' and 90% into mode '1'],
    [10], [100% into mode '1'],
  ),
  caption: [Energy distribution configurations tested in the simulations]
) <energydisttable>

=== Chemistry modifications
The changes made in Eilmer 4 adding conductivity ($sigma$) as a gas property was also implemented in Eilmer 5. The main difference with how the simulations were conducted now when compared to previously was that previously, the collision frequencies were calculated based on the collisional cross sections from literature and that in turn was used to calculate the conductivity. After implementing the conductivity as a gas property, the conductivity was calculated using the electron temperature based on the Raizer model @raizer1997gas.

$ sigma = 8300 times e^(-36000/T_e) $
// remove equation number from above
The conductivity calculated was then called into the source term file and used to calculate the collision frequency for the other properties. The downside of this approach is that the conductivity model is also an approximation and when local electron temperatures get high, local conductivity also rapidly increases. While this may appear physical, it would need to be verified to what extent this holds true before other factors affect the conductivity and vice versa. As conductivity increases, the  current also increases, increasing the source of Joule heating which in turn further increase electron temperature. This positive feedback loop led to instabilities at very high electron temperatures. 

As shown previously, the activating electron temperature is an important parameter to achieve to delay recombination in the chemistry model. A conductivity model that reinforces an uncontrolled positive feedback loop would overestimate the effectiveness of the engine. To avoid this, the plasma model published in 2024 by B. Parent with the latest chemistry data and implementation was decided to be implemented in the code @parent2024progress. The model uses an implementation of the collision frequency function with updated collision cross-sections that is then used to calculate the conductivity. 

```lua
function collision_frequency(n_N,n_O,n_N2,n_O2,n_NO,n_ions,q_e,eps_zero,k_b,v_elec,Te,n_e)  -- Based on Gnoffo(1989) and Imamura(2018)
  -- Cross sections 
  Q_e_N  = 5.0e-20
  Q_e_O  = 1.2e-20 + 1.7e-24*Te - 2.0e-28*Te^2
  Q_e_N2 = 7.5e-20 + 5.5e-24*Te - 1.0e-28*Te^2
  Q_e_O2 = 2.0e-20 + 6.0e-24*Te
  Q_e_NO = 1.0e-19
  -- Individual electron collision frequencies
  nu_eN  = (4/3) * Q_e_N * n_N * v_elec
  nu_eO  = (4/3) * Q_e_O * n_O * v_elec
  nu_eN2 = (4/3) * Q_e_N2* n_N2* v_elec
  nu_eO2 = (4/3) * Q_e_O2* n_O2* v_elec
  nu_eNO = (4/3) * Q_e_NO* n_NO* v_elec
  -- electron-neutral collision
  nu_en  = nu_eN+nu_eO+nu_eN2+nu_eO2+nu_eNO
  -- electron-ion collision	
  nu_ei  = (6*math.pi)*((q_e^2)/(12*math.pi*eps_zero*k_b*Te))^2 * log(12*math.pi*(eps_zero*k_b/q_e^2)^(3/2)*math.sqrt(Te^3/n_e)) * n_ions * v_elec
  -- total collision frequency 
  nu_tot = nu_en + nu_ei
return nu_tot
end
```

The model also contained updated air-plasma reaction rates that are electron temperature dependant that has been partially implemented in the chemistry model. The spline fit curve function implementation is left to further work in the research plan and will be the most immediate next step in the project. The reaction rates are presented in @airplasmareactionrates. The latest version of the Eilmer 5 code used  for the simulation is added to the Appendix in @eilmer5sourcecode

=== Results
The change from Eilmer 4 to Eilmer 5 did not result in any noticeable changes in the solutions for the same setup configurations. The activating electron temperature was still an important parameter to achieve to delay recombination in the chemistry model. The results for a wider range of electric fields and energy distributions are presented in the Appendix.
== Blank Shot in T4
As the experimental model was 3D printed and a lot of systems were assembled and test fitted, an unpowered test shot was conducted to verify the model in the T4 facility.
#figure(
  grid(
    columns: 2,
    gutter: 1em,
    image("ABLE_Front view.jpg", height: 9cm),
    image("ABLE_Side view.jpg", height: 9cm)
  ),
  caption: "Front view (left) and side view (right) of the ABLE model in T4."
)
The model survived the test conditions and the Schileren image is given below. Future unpowered shots is part of the Research plan.
#figure(image("13303-pfe-steadStateTestTime.png", width: 75%), caption: "Schlieren image of the test shot (13303) showing shock patterns.")

#pagebreak()
= Research Plan
//{ Plan moving forward is complete the changes to Eilmer 5 code, run viscous and then 3D simulations, helping run the experiments coming up, analyzing the results, using them to run simulations and to plan additional campaigns. The one thing we can change are different tunnel conditions. The model itself has restrictions on the different electrical configurations that can be tested.}
The immediate next step is to finish the implementation of the updated air-plasma chemistry model in Eilmer. This updated model will also be uploaded to the github repository for other members to use. A rough research plan for the next few months is given below.

#figure(
  table(
    columns: (auto, auto),
    align: left,
    [*Task*], [*Timeline*],
    [Implementation of updated air-plasma chemistry model], [April 2025],
    [Exploring viscous and 3D simulations in Eilmer], [May 2025],
    [1#super("st ") experimental campaign; Unpowered and powered tests], [June 2025],
    [Report on analysis of results and comparison with computational models], [September 2025],
    [Further simulations beyond the experimental regimes], [November 2025],
    [Analysis and building of 2#super("nd ")campaign's test matrix], [February 2026],
    [2#super("nd ") experimental campaign], [November 2026],
    [Report on model analysis and different experimental regimes], [February 2027],
    [Thesis writing], [April 2027],
  ),
  caption: [Research timeline for the PhD]
)

The first experimental campaign is currently being scheduled for June 2025, after which the model will complete handover for further analysis and experimental campaigns to explore unexplored regions of performance. The first campaign looks at the feasibility of the concept as a whole by comparing the difference in the results between the unpowered and powered tests. The results will inform further model analysis and design of the second test campaign. The second campaign will explore further regimes and test conditions with an updated test matrix. These experimental data should enable better understanding of the plasma model for future simulations.


