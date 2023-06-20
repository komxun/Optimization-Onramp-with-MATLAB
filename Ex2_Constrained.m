clc, clear ,close all

%% Data 
Name = ["Broccoli", "Corn", "Lettuce", "Potaties", "Tofu", "Donut", "Bacon",...
    "Apple", "Banana", "Toast", "Oatmeal", "Yogurt", "Scrambled Eggs", "Steak", ...
    "Chocolate Chip Cookie", "Orange"]';
Name = categorical(Name);
Price = [0.48, 0.54, 0.06, 0.18, 0.93, 0.38, 0.87, 0.72, 0.45, 0.15, 0.27, 1.1, 0.13, 2.2, 0.09, 0.75]';
Calories = [50, 100, 5, 110, 94, 195, 43, 95, 105, 79, 158, 100, 91, 679, 78, 45]';
Carbs = [13.6, 17.1, 0.4, 37, 2.3, 22, 0.1, 25, 27, 15, 27, 6, 1, 0, 9, 11]';
Protein = [8, 2.5, 0.2, 4.3, 10, 2.1, 3, 0.5, 1.3, 2.7, 6, 17, 6, 62, 1.5, 0.9]';
VitaminC = [160.2, 5.2, 0.8, 19, 0.1, 0.6, 0, 8.4, 10.3, 0, 0, 0, 0, 0, 0, 51.1]';

food = table(Name, Price, Calories, Carbs, Protein, VitaminC)

%% Defining Optimization Problem
prob = optimproblem("Description","An Optimal Breakfast");
servings = optimvar("servings",16,"LowerBound",0);
C = food.Price .* servings;
prob.Objective = sum(C);

% Factors
cals = food.Calories .* servings;
carbs = food.Carbs .* servings;
protein = food.Protein .* servings;

totalCals = sum(cals);
totalCarbs = sum(carbs);
totalProtein = sum(protein);

%% Adding Constraints
% Total Calories = 350
prob.Constraints.calories = totalCals == 350;
% Total Carbs >= 45
prob.Constraints.carbs = totalCarbs >= 45;
% Total protein >= 15
prob.Constraints.protein = totalProtein >= 15;

% Solve the optimization problem
[sol, optval] = solve(prob);
optServings = sol.servings;

% Evaluation
calEval = evaluate(totalCals, sol);
carbsEval = evaluate(totalCarbs, sol)
proteinEval = evaluate(totalProtein, sol)


%% Plot
b = bar(food.Name, optServings);
title("Optimal servings")
xtips1 = b(1).XEndPoints;
ytips1 = b(1).YEndPoints;
labels1 = string(b(1).YData);
text(xtips1,ytips1,labels1,'HorizontalAlignment','center',...
    'VerticalAlignment','bottom')
