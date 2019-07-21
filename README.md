## Using FDM or FEM solve poisson and heat equations in 1D and 2D
### Basic equations
poisson equation: 

<div align=center><img src="https://latex.codecogs.com/gif.latex?-\nabla&space;u=f" title="-\nabla u=f"/></div>

heat equation: 

<div align=center><img src="https://latex.codecogs.com/gif.latex?u_t-\nabla&space;u=f" title="u_t-\nabla u=f"/></div>

### Basic idea
#### Finite Difference Methods
> 
- Replacing the dervatives by finite differences
- Taylor series  

1D problem
<div align=center><img width="250" height="250" src="https://github.com/MatNoble/PDE_coding/blob/master/image/FD.png"/></div>  

#### Finite Element Methods
> 
- Integration by part
- Variational 
- Weak formula
- Garlekin formula
- Finite dimensional space approximates infinite dimensional space 
