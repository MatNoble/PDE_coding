## Using FDM or FEM solve poisson and heat equations in 1D and 2D
### Basic equations
poisson equation: 

<div align=center><img src="https://latex.codecogs.com/svg.latex?-\Delta&space;u&space;=&space;f" title="-\Delta u = f" /></div>


heat equation: 

<div align=center><img src="https://latex.codecogs.com/svg.latex?u_t&space;-&space;\Delta&space;u&space;=&space;f" title="u_t - \Delta u = f" /></div>
<hr>
### Basic idea
#### Finite Difference Methods
> 
- Replacing the dervatives by finite differences

  <div align=center><img src="https://latex.codecogs.com/svg.latex?u^k_t&space;=&space;\frac{u^{k&plus;1}-u^k}{\Delta&space;t}" title="u^k_t = \frac{u^{k+1}-u^k}{\Delta t}" /></div>
  
  <div align=center><img src="https://latex.codecogs.com/svg.latex?\begin{aligned}&space;u_{x&space;x}&space;&&space;\approx&space;\frac{u\left(x_{i-1},&space;y_{j}\right)-2&space;u\left(x_{i},&space;y_{j}\right)&plus;u\left(x_{i&plus;1},&space;y_{j}\right)}{h_{x}^{2}}&space;\\&space;u_{y&space;y}&space;&&space;\approx&space;\frac{u\left(x_{i},&space;y_{j-1}\right)-2&space;u\left(x_{i},&space;y_{j}\right)&plus;u\left(x_{i},&space;y_{j&plus;1}\right)}{h_{y}^{2}}&space;\end{aligned}" title="\begin{aligned} u_{x x} & \approx \frac{u\left(x_{i-1}, y_{j}\right)-2 u\left(x_{i}, y_{j}\right)+u\left(x_{i+1}, y_{j}\right)}{h_{x}^{2}} \\ u_{y y} & \approx \frac{u\left(x_{i}, y_{j-1}\right)-2 u\left(x_{i}, y_{j}\right)+u\left(x_{i}, y_{j+1}\right)}{h_{y}^{2}} \end{aligned}" /></div>
  
- Taylor series  

##### Example 1
for the 1D heat problem:
<div align=center><img src="https://latex.codecogs.com/svg.latex?\left\{\begin{array}{c}{u_{t}-&space;u_{x&space;x}=f(x,&space;t)\left(x_{1}<x<x_{2}\right)(t>0)}&space;\\&space;{u(x,&space;0)=g_{t}(x)\left(x_{1}<x<x_{2}\right)}&space;\\&space;{u\left(x_{1},&space;t\right)=g_{1}(t),&space;u\left(x_{2},&space;t\right)=g_{2}(t)(t>0)}\end{array}\right." title="\left\{\begin{array}{c}{u_{t}- u_{x x}=f(x, t)\left(x_{1}<x<x_{2}\right)(t>0)} \\ {u(x, 0)=g_{t}(x)\left(x_{1}<x<x_{2}\right)} \\ {u\left(x_{1}, t\right)=g_{1}(t), u\left(x_{2}, t\right)=g_{2}(t)(t>0)}\end{array}\right." /></div>

with specific parameters:
<div align=center><img src="https://latex.codecogs.com/svg.latex?0.1<x<\pi,\&space;0<t<0.2" title="0.1<x<\pi,\ 0<t<0.2" /></div>
<div align=center><img src="https://latex.codecogs.com/svg.latex?u(x,&space;0)=10&space;\frac{\cos&space;\left(\left(\frac{x-x_{1}}{2}\right)^{2}\right)&space;\sin&space;\left(\left(x-x_{2}\right)^{3}\right)}{x^{\frac{4}{5}}}\\" title="u(x, 0)=10 \frac{\cos \left(\left(\frac{x-x_{1}}{2}\right)^{2}\right) \sin \left(\left(x-x_{2}\right)^{3}\right)}{x^{\frac{4}{5}}}\\" /></div>
<div align=center><img src="https://latex.codecogs.com/svg.latex?u\left(x_{1},&space;t\right)=u\left(x_{2},&space;t\right)=0" title="u\left(x_{1}, t\right)=u\left(x_{2}, t\right)=0" /></div>
<div align=center><img src="https://latex.codecogs.com/svg.latex?f(x,&space;t)=0" title="f(x, t)=0" /></div>

have the flowing result:
<div align=center><img width="500" height="500" src="https://github.com/MatNoble/PDE_coding/blob/master/image/FD.png"/></div>  

***
#### Finite Element Methods
> 
- Integration by part
- Variational 
- Weak formula
- Garlekin formula
- Finite dimensional space approximates infinite dimensional space 
