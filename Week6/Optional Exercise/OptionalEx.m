%% Machine Learning Online Class
%  Exercise 5 | Regularized Linear Regression and Bias-Variance
%  Optional exercies 3.2, 3.4 and 3.5
% 
% 

%% Initialization
clear ; close all; clc
%% Loading Data
fprintf('Loading and Visualizing Data ...\n')
load ('ex5data1.mat');
m = size(X, 1);
%% Feature Mapping for Polynomial Regression
p = 8;

% Map X onto Polynomial Features and Normalize
X_poly = polyFeatures(X, p);
[X_poly, mu, sigma] = featureNormalize(X_poly);  % Normalize
X_poly = [ones(m, 1), X_poly];                   % Add Ones

% Map X_poly_test and normalize (using mu and sigma)
X_poly_test = polyFeatures(Xtest, p);
X_poly_test = bsxfun(@minus, X_poly_test, mu);
X_poly_test = bsxfun(@rdivide, X_poly_test, sigma);
X_poly_test = [ones(size(X_poly_test, 1), 1), X_poly_test];         % Add Ones

% Map X_poly_val and normalize (using mu and sigma)
X_poly_val = polyFeatures(Xval, p);
X_poly_val = bsxfun(@minus, X_poly_val, mu);
X_poly_val = bsxfun(@rdivide, X_poly_val, sigma);
X_poly_val = [ones(size(X_poly_val, 1), 1), X_poly_val];           % Add Ones

%%  ========= 3.2: Adjusting the regularization parameter ===========
% In this section, we will observe how the regularization parameter
% (lambda) affects the bias-variance of regularized polynomial regression.
%
figure(1);
lambda_test = [0;1;100];
for i = 1:length(lambda_test)
    lambda = lambda_test(i);
    [theta] = trainLinearReg(X_poly, y, lambda);

    % Plot training data and fit
    subplot(2,3,i);
    plot(X, y, 'rx', 'MarkerSize', 10, 'LineWidth', 1.5);
    plotFit(min(X), max(X), mu, sigma, theta, p);
    xlabel('Change in water level (x)');
    ylabel('Water flowing out of the dam (y)');
    title (sprintf('Polynomial Regression Fit (lambda = %f)', lambda));

    subplot(2,3,i+3);
    [error_train, error_val] = ...
        learningCurve(X_poly, y, X_poly_val, yval, lambda);
    plot(1:m, error_train, 1:m, error_val);

    title(sprintf('Polynomial Regression Learning Curve (lambda = %f)', lambda));
    xlabel('Number of training examples')
    ylabel('Error')
    axis([0 13 0 100])
    legend('Train', 'Cross Validation')

end

%%  ================ 3.4: Computeing test error ==================
% In this section, we will compute the test error using the best value of
% lambda = 3.
%
lambda = 3;
[theta] = trainLinearReg(X_poly, y, lambda);
test_error = linearRegCostFunction(X_poly_test, ytest, theta, 0);
fprintf(['Test error at lambda = 3: %f '...
         '\n(this value should be about 3.8599)\n'], test_error);

%%  ==3.5:Plotting learning curves with randomly selected examples==
figure(2);

lambda = 0.01;
test_time = 50;
error_train_sum = zeros(m,1);
error_val_sum = zeros(m,1);
for i = 1:test_time
    sel = randperm(m);
    X_poly_sel = X_poly(sel,:);
    y_sel = y(sel,:);
    [error_train, error_val] = ...
        learningCurve(X_poly_sel, y_sel, X_poly_val, yval, lambda);
    error_train_sum = error_train_sum + error_train;
    error_val_sum = error_val_sum + error_val;    
end
error_train_avg = error_train_sum / test_time;
error_val_avg = error_val_sum / test_time;
plot(1:m, error_train_avg, 1:m, error_val_avg);

title(sprintf('Polynomial Regression Learning Curve (lambda = %f)', lambda));
xlabel('Number of training examples')
ylabel('Error')
axis([0 13 0 100])
legend('Train', 'Cross Validation')

fprintf('Polynomial Regression (lambda = %f)\n\n', lambda);
fprintf('# Training Examples\tTrain Error\tCross Validation Error\n');
for i = 1:m
    fprintf('  \t%d\t\t%f\t%f\n', i, error_train(i), error_val(i));
end


