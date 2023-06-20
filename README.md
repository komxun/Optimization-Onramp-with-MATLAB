# Optimization-Onramp-with-MATLAB
Summary from [MATLAB Optimization Onramp](https://matlabacademy.mathworks.com/details/optimization-onramp/optim)

# Defining an Optimization Problem

- `optimproblem`  :   create an optimization problem
- `optimvar`  :   define optimization variables
- As a best practice, `varname` should be the same as the MATLAB variable name to avoid confusion
- Use `show` to display the contents of an optimization problem

``` matlab
prob = optimproblem("Description", "My Optimization Problem")
varname = optimvar("varname")
show(prob)
```
- You can also create a single optimization variable vector with multiple elements
- In general, an Nx1 vector of optimization variables with a lower bound can be defined as:

``` matlab
varname = optimvar("varname", N, "LowerBound", lowerBoundValue); % N: number of variables
```

- Store the optimization expressions in the Objective field of your optimization problem as follow:
``` matlab
prob.Objective = expression
```

# Providing the Initial Guess 
Different types of optimization problems require different kinds of solvers to be used. MATLAB will choose the appropriate solver for you.
- Solvers designed to handle nonlinear objectives require you to provide an initial guess
- To provide your initial guess, you can use structure 
```matlab
initialGuess.varName1 = 10;   % varName must be the same name as the optimizing variable!
initialGuess.varName2 = 15;
initialGuess.varName3 = 2;
```

# Providing Constraints
To store an equality constraint in your optimization problem, you must set an optimization expression equal to your desired numerical value
``` matlab
prob.Constraints.Name1 = expression1 == value;   % Equality constraints
prob.Constraints.Name2 = expression2 >= value    % Inequality constraints
```

# Solving an Optimization Problem
## Solving Unconstrained Optimization Problem
Use `solve` to solve the optimization problem
``` matlab
[sol, optval] = solve(prob, x0);   % x0 is the initial guess
```
- The optimal values of your optimization variables are stored in the solution structure `sol`, and can be accessed using dot notation `sol.varName1`, `sol.varName2`

# Evaluate the Optimal Solution
The `evaluate` function can be used to evaluate optimization expressions at a specified value(s)
``` matlab
solEval = evaluate(prob.Objective, sol)
```

# Example 1: 
![image](https://github.com/komxun/Optimization-Onramp-with-MATLAB/assets/133139057/bcebd482-54f2-4c2a-b4d3-f1a2e1a0fcc9)

The distance between the factory and the three stores is 
``` math
d = \sqrt{(x-X)^2+(y-Y)^2}
```
Where $x$ and $y$ are symbolic optimization variables, and $X$ and $Y$ are the coordinates of the stores

https://github.com/komxun/Optimization-Onramp-with-MATLAB/blob/9affa04c4a4a34c9e34cb42dfedf5ca6612f6e3c/Ex1_Unconstrained.m#L1-L39


