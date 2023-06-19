# Optimization-with-MATLAB

## Defining an Optimization Problem

- **optimproblem**  :   create an optimization problem
- **optimvar**  :   define optimization variables
- As a best practice, varname should be the same as the MATLAB variable name to avoid confusion
- Use **show** to display the contents of an optimization problem

``` matlab
prob = optimproblem("Description", "My Optimization Problem")
varname = optimvar("varname")
show(prob)
```
- Store the optimization expressions in the Objective field of your optimization problem as follow:
``` matlab
prob.Objective = expression
```
## Solving an Optimization Problem
Different types of optimization problems require different kinds of solvers to be used. MATLAB will choose the appropriate solver for you.

# Example 1: 
![image](https://github.com/komxun/Optimization-with-MATLAB/assets/133139057/bcebd482-54f2-4c2a-b4d3-f1a2e1a0fcc9)

The distance between the factory and the three stores is 
``` math
d = \sqrt{(x-X)^2+(y-Y)^2}
```
Where $x$ and $y$ are symbolic optimization variables, and $X$ and $Y$ are the coordinates of the stores

``` matlab
prob = optimproblem("Description", "Factory Location");
x = optimvar("x");
y = optimvar("y");
X = [5 40 70];
Y = [20 50 15];

d = sqrt((x-X).^2 + (y-Y).^2);  % 1x3 expression array representing distance between the factory and the three stores 
dTotal = sum(d);

prob.Objective = dTotal;
```
