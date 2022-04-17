# Support vector Machine

## Quiz
### Question 1
Suppose you have trained an SVM classifier with a Gaussian kernel, and it learned the following decision boundary on the training set:

![decision boundary](https://github.com/AnnickWONG/Standford_machine_learning/blob/Studying/Week%207/image/Q1_dicesion_boundary.png)

You suspect that the SVM is underfitting your dataset.  Should you try increasing or decreasing C?  Increasing or decreasing σ² ?
 
**Answer:** It would be reasonable to try **increasing** C. It would also be reasonable to try **decreasing** σ².

**Explanation:** The figure shows a decision boundary that is underfit to the training set, so we'd like to lower the bias / increase the variance of the SVM. We can do so by either increasing the parameter C or decreasing σ².

### Question 2
The formula for the Gaussian kernel is given by 
<img src="http://chart.googleapis.com/chart?cht=tx&chl=similarity(x,l^{(1)}) = \exp{(-\frac{||x-l^{(1)}||^2}{2\sigma^2})}" style="border:none;">

The figure below shows a plot of <img src="http://chart.googleapis.com/chart?cht=tx&chl=f_1 =similarity(x,l^{(1)})" style="border:none;"> when  σ² = 1.

![plot of f1](https://github.com/AnnickWONG/Standford_machine_learning/blob/Studying/Week%207/image/Q2_f1.png)

Which of the following is a plot of f₁ when σ² = 2?

![answer](https://github.com/AnnickWONG/Standford_machine_learning/blob/Studying/Week%207/image/Q2_answers.png)

**Answer:** D

**Explanation:** This figure shows a "narrower" Gaussian kernel centered at the same location which is the effect of decreasing σ².


### Question 3
The SVM solves <img src="http://chart.googleapis.com/chart?cht=tx&chl=C \min_\theta \sum_{i=1}^m y^{(i)} \text{cost}_1(\theta^Tx^{(i)})+(1-y^{(i)}) \text{cost}_0(\theta^Tx^{(i)})+\sum_{j=1}^n \theta_j^2" style="border:none;">
where the functions <img src="http://chart.googleapis.com/chart?cht=tx&chl=\text{cost}_0(z)" style="border:none;"> and <img src="http://chart.googleapis.com/chart?cht=tx&chl=\text{cost}_1(z)" style="border:none;"> look like this:

![cost_function](https://github.com/AnnickWONG/Standford_machine_learning/blob/Studying/Week%207/image/Q3_cost_function.png)

The first term in the objective is:
 <img src="http://chart.googleapis.com/chart?cht=tx&chl=C\min_\theta \sum_{i=1}^m y^{(i)} \text{cost}_1(\theta^Tx^{(i)}) + (1-y^{(i)}) \text{cost}_0(\theta^Tx^{(i)})" style="border:none;"> 

This first term will be zero if two of the following four conditions hold true.  Which are the two conditions that would guarantee that this term equals zero?

**Answer:**
* For every example with <img src="http://chart.googleapis.com/chart?cht=tx&chl=y^{(i)} = 0">, we have that <img src="http://chart.googleapis.com/chart?cht=tx&chl=\theta^Tx^{(i)} \leq -1">
* For every example with <img src="http://chart.googleapis.com/chart?cht=tx&chl=y^{(i)} = 1">, we have that <img src="http://chart.googleapis.com/chart?cht=tx&chl=\theta^Tx^{(i)} \geq 1">

### Question 4
 Suppose you have a dataset with n = 10 features and m = 5000 examples. 

After training your logistic regression classifier with gradient descent, you find that it has underfit the training set and does not achieve the desired performance on the training or cross validation sets. 

Which of the following might be promising steps to take? Check all that apply.

|Answer|Explanation|
|---|---|
|Use an SVM with a Gaussian Kernel.|By using a Gaussian kernel, your model will have greater complexity and can avoid underfitting the data.|
|Create / add new polynomial features.|When you add more features, you increase the variance of your model, reducing the chances of underfitting.|

### Question 5
Which of the following statements are true? Check all that apply.

|True/False|Answer|Explanation|
|---|---|---|
|**True**|Suppose you have 2D input examples. The decision boundary of the SVM (with the linear kernel) is a straight line.|The SVM without any kernel (ie, the linear kernel) predicts output based only on <img src="http://chart.googleapis.com/chart?cht=tx&chl=\theta^Tx^{(i)}">, so it gives a linear / straight-line decision boundary, just as logistic regression does.
|False|If the data are linearly separable, an SVM using a linear kernel will return the same parameters θ regardless of the chosen value of C (i.e., the resulting value of θ does not depend on C).| |
|False|If you are training multi-class SVMs with the one-vs-all method, it is not possible to use a kernel.| |
|**True**|The maximum value of the Gaussian kernel is 1.| When <img src="http://chart.googleapis.com/chart?cht=tx&chl=x = l^{(1)}">, the Gaussian kernel has value exp(0)=1, and it is less than 1 otherwise.
