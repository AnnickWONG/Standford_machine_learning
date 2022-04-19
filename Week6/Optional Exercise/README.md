# Optional exercise on Regularized Linear Regression and Bias-Variance
In the [instructions](https://github.com/AnnickWONG/Standford_machine_learning/blob/main/Week6/ex5-octave/ex5.pdf) of Programming Excercise 5, there are 3 optional exercises:
* 3.2: Adjusting the regularization parameter
* 3.4: Computing test set error
* 3.5: Plotting learning curves with randomly selected examples

The script ***OptionalEx.m*** provide the solution for these optional exercises. This script use the functions that are built in the previous exercise, so it should be place in the same path as the script ***ex5.m***.

## 3.2 Adjusting the regularization parameter
In this section, we will observe how the regularization parameter (λ) affects the bias-variance of regularized polynomial regression. 

Using λ = 0, 1, 100, we will obtain the result figure like:
![Op3_2](https://github.com/AnnickWONG/Standford_machine_learning/blob/main/Week6/Optional%20Exercise/Op3_2.png)

From the result, we could tell that:
* When λ is too small (λ=0), the learning algorithm is suffering from **high variance**, and the model is **overfitting** the training set. Thus, the error between the training data and the cross validation data is large.
* When λ is too large (λ=100), the learning algorithm is suffering from **high bias**, and the model is **underfitting** the training set. At that time, both the traning error and the cross validation error is high.
* When λ is suitable (λ=1), the learning algorithm follows the data trend well. Now, both the cross validation and training error converge to a relatively low value.


## 3.4 Computing test set error
In this section, we use the best value of λ (λ=3), which we found in the excercise 3.3, to train the regularized linear regression model. Then, we use this model on the test set. Finally we will obtain a test error of 3.859888.

## 3.5 Plotting learning curves with randomly selected examples
In general, when we use learning curves to debug, an avarage error across multiple sets of randomly selected examples is more useful.
We can reuse the function ***learningCurve.m*** to calculate the traning error and the cross validation error. Using a **for-loops** to generate the repeated multiple times we want, and in each loop, we randomly change the example order. Note that the example and the label order should be changed at the same time.

After average of all the error, we will obtain the result figure like:
![Op3_5](https://github.com/AnnickWONG/Standford_machine_learning/blob/main/Week6/Optional%20Exercise/Op3_5.png)
