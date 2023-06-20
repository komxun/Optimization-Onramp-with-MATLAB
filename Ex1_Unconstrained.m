clc, clear, close all

prob = optimproblem("Description", "Factory Location");
x = optimvar("x");
y = optimvar("y");
X = [5 40 70];
Y = [20 50 15];

d = sqrt((x-X).^2 + (y-Y).^2);  % 1x3 expression array representing distance between the factory and the three stores 
dTotal = sum(d);
prob.Objective = dTotal;

initialGuess.x = 230;
initialGuess.y = 69;
[sol, optval] = solve(prob, initialGuess);

xOpt = sol.x
yOpt = sol.y

% Evaluate the Optimal Solution
dTotalEval = evaluate(dTotal, sol)

%% Plotting the results
plotStores
hold on
scatter(xOpt, yOpt, 'filled')
hold off
legend("Store 1", "Store 2", "Store 3", "Optimal Factory Location")

%% Functions
function plotStores()
    X = [5 40 70];
    Y = [20 50 15];
    pgon1 = nsidedpoly(5,"Center",[X(1) Y(1)],"sidelength",3);
    pgon2 = nsidedpoly(5,"Center",[X(2) Y(2)],"sidelength",3);
    pgon3 = nsidedpoly(5,"Center",[X(3) Y(3)],"sidelength",3);
    plot([pgon1 pgon2 pgon3])
    axis equal
end