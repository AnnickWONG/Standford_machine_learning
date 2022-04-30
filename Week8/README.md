# Unsupervised Learning & Dimensionality Reduction

## Quiz: Unsupervised Learning
### Question 1
For which of the following tasks might K-means clustering be a suitable algorithm? Select all that apply.

|True/False|Answer|Explanation|
|---|---|---|
|False|Given historical weather records, predict if tomorrow's weather will be sunny or rainy.| classification problem |
|False|Given many emails, you want to determine if they are Spam or Non-Spam emails.|classification problem|
|**True**|Given a set of news articles from many different news websites, find out what are the main topics covered.|K-means can cluster the articles and then we can inspect them or use other methods to infer what topic each cluster represents.|
|**True**|From the user usage patterns on a website, figure out what different groups of users exist.|We can cluster the users with K-means to find different, distinct groups.|

### Question 2
Suppose we have three cluster centroids <img src="https://latex.codecogs.com/svg.image?\mu&space;_{1}=\begin{bmatrix}1&space;\\2\end{bmatrix}" />, <img src="https://latex.codecogs.com/svg.image?\mu&space;_{1}=\begin{bmatrix}1&space;\\2\end{bmatrix}" /> and <img src="https://latex.codecogs.com/svg.image?\mu&space;_{1}=\begin{bmatrix}1&space;\\2\end{bmatrix}" />. Furthermore, we have a training example <img src="https://latex.codecogs.com/svg.image?x^{(i)}=\begin{bmatrix}3&space;\\1\end{bmatrix}" />. After a cluster assignment step, what will <img src="https://latex.codecogs.com/svg.image?c^{(i)}"  /> be?

**Answer:** <img src="https://latex.codecogs.com/svg.image?c^{(i)}=3" />

**Explanation:** <img src="https://latex.codecogs.com/svg.image?x^{(i)}" /> is closest to <img src="https://latex.codecogs.com/svg.image?\mu&space;_{3}"  />.

### Question 3
K-means is an iterative algorithm, and two of the following steps are repeatedly carried out in its inner-loop. Which two?

**Answer:**
* The cluster assignment step, where the parameters <img src="https://latex.codecogs.com/svg.image?c^{(i)}" /> are updated.
* Move the cluster centroids, where the centroids <img src="https://latex.codecogs.com/svg.image?\mu&space;_{k}"  /> are updated.

### Question 4
Suppose you have an unlabeled dataset <img src="https://latex.codecogs.com/svg.image?\left\{&space;x^{(1)},...,x^{(m)}\right\}"  />. You run K-means with 50 different random initializations, and obtain 50 different clusterings of the data. What is the recommended way for choosing which one of these 50 clusterings to use?

**Answer:** Compute the distortion function <img src="https://latex.codecogs.com/svg.image?J(c^{(1)},...,c^{(m)},\mu&space;_{1},...,\mu&space;_{k})"  />, and pick the one that minimizes this.

**Explanation:** A lower value for the distortion function implies a better clustering, so you should choose the clustering with the smallest value for the distortion function.

### Question 5
Which of the following statements are true? Select all that apply.

|Answer|Explantion|
|---|---|
|On every iteration of K-means, the cost function <img src="https://latex.codecogs.com/svg.image?J(c^{(1)},...,c^{(m)},\mu&space;_{1},...,\mu&space;_{k})" />(the distortion function) should either stay the same or decrease; in particular, it should not increase.|Both the cluster assignment and cluster update steps decrese the cost / distortion function, so it should never increase after an iteration of K-means.|
|A good way to initialize K-means is to select K (distinct) examples from the training set and set the cluster centroids equal to these selected examples.|This is the recommended method of initialization.|


## Quiz: Principal Component Analysis
### Question 1
Consider the following 2D dataset:
![Question 1](https://github.com/AnnickWONG/Standford_machine_learning/blob/Week8/Week8/image/Q1.png)

Which of the following figures correspond to possible values that PCA may return for <img src="https://latex.codecogs.com/svg.image?u^{(1)}" /> (the first eigenvector / first principal component)? Check all that apply (you may have to check more than one figure).

![Q1_answer](https://github.com/AnnickWONG/Standford_machine_learning/blob/Week8/Week8/image/Q1_Answer.png)

**Answer:** A, B

**Explanation:** The maximal variance is along the y = x line, no matter it is negative or positive along the line is correct.

### Question 2
Which of the following is a reasonable way to select the number of principal components <img src="https://latex.codecogs.com/svg.image?k" />?

(Recall that <img src="https://latex.codecogs.com/svg.image?n"  /> is the dimensionality of the input data and <img src="https://latex.codecogs.com/svg.image?m" /> is the number of input examples.)

**Answer:** Choose <img src="https://latex.codecogs.com/svg.image?k"  /> to be the smallest value so that at least 99% of the variance is retained.

**Explanation:** It maintains the structure of the data while maximally reducing its dimension.

### Question 3
Suppose someone tells you that they ran PCA in such a way that "95% of the variance was retained." What is an equivalent statement to this?

**Answer:** <img src="https://latex.codecogs.com/svg.image?\frac{\frac{1}{m}\sum&space;_{i=1}^{m}\left\|x^{(i)}-x_{approx}^{(i)}&space;\right\|^{2}}{\frac{1}{m}\sum&space;_{i=1}^{m}\left\|x^{(i)}&space;\right\|^{2}}\leq&space;0.05" />

### Question 4
Which of the following statements are true? Check all that apply.

|Answer| Explanation|
|---|---|
|Even if all the input features are on very similar scales, we should still perform mean normalization (so that each feature has zero mean) before running PCA.|If you do not perform mean normalization, PCA will rotate the data in a possibly undesired way.|
|Given input data <img src="https://latex.codecogs.com/svg.image?x\in&space;\mathbb{R^{n}}" /> , it makes sense to run PCA only with values of <img src="https://latex.codecogs.com/svg.image?k"  /> that satisfy <img src="https://latex.codecogs.com/svg.image?k\leq&space;n"  />. (In particular, running it with <img src="https://latex.codecogs.com/svg.image?k=n"  /> is possible but not helpful, and <img src="https://latex.codecogs.com/svg.image?k>n"> does not make sense.)| With <img src="https://latex.codecogs.com/svg.image?k=n" />, there is no compression, so PCA has no use.|
|Given an input  <img src="https://latex.codecogs.com/svg.image?x\in&space;\mathbb{R^{n}}" /> , PCA compresses it to a lower-dimensional vector  <img src="https://latex.codecogs.com/svg.image?z\in&space;\mathbb{R^{k}}" /> .|PCA compresses it to a lower dimensional vector by projecting it onto the learned principal components.|
|If the input features are on very different scales, it is a good idea to perform feature scaling before applying PCA.|Feature scaling prevents one feature dimension from becoming a strong principal component only because of the large magnitude of the feature values (as opposed to large variance on that dimension).|


### Question 5
Which of the following are recommended applications of PCA? Select all that apply.
|Answer|Explanation|
|---|---|
|Data compression: Reduce the dimension of your data, so that it takes up less memory / disk space.|Data compression: Reduce the dimension of your data, so that it takes up less memory / disk space.|
|Data compression: Reduce the dimension of your input data <img src="https://latex.codecogs.com/svg.image?x^{(i)}" />, which will be used in a supervised learning algorithm (i.e., use PCA so that your supervised learning algorithm runs faster).|If your learning algorithm is too slow because the input dimension is too high, then using PCA to speed it up is a reasonable choice.|
|Data visualization: Reduce data to 2D (or 3D) so that it can be plotted.|This is a good use of PCA, as it can give you intuition about your data that would otherwise be impossible to see.|
