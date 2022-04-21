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
Suppose we have three cluster centroids <img src="https://latex.codecogs.com/svg.image?\mu&space;_{1}=\begin{bmatrix}1&space;\\2\end{bmatrix}" title="https://latex.codecogs.com/svg.image?\mu _{1}=\begin{bmatrix}1 \\2\end{bmatrix}" />, <img src="https://latex.codecogs.com/svg.image?\mu&space;_{1}=\begin{bmatrix}1&space;\\2\end{bmatrix}" title="https://latex.codecogs.com/svg.image?\mu _{2}=\begin{bmatrix}-3 \\0\end{bmatrix}" /> and <img src="https://latex.codecogs.com/svg.image?\mu&space;_{1}=\begin{bmatrix}1&space;\\2\end{bmatrix}" title="https://latex.codecogs.com/svg.image?\mu _{3}=\begin{bmatrix}4 \\2\end{bmatrix}" />. Furthermore, we have a training example <img src="https://latex.codecogs.com/svg.image?x^{(i)}=\begin{bmatrix}3&space;\\1\end{bmatrix}" title="https://latex.codecogs.com/svg.image?x^{(i)}=\begin{bmatrix}3 \\1\end{bmatrix}" />. After a cluster assignment step, what will <img src="https://latex.codecogs.com/svg.image?c^{(i)}" title="https://latex.codecogs.com/svg.image?c^{(i)}" /> be?

**Answer:** <img src="https://latex.codecogs.com/svg.image?c^{(i)}=3" title="https://latex.codecogs.com/svg.image?c^{(i)}=3" />

**Explanation:** <img src="https://latex.codecogs.com/svg.image?x^{(i)}" title="https://latex.codecogs.com/svg.image?x^{(i)}" /> is closest to <img src="https://latex.codecogs.com/svg.image?\mu&space;_{3}" title="https://latex.codecogs.com/svg.image?\mu _{3}" />.

### Question 3
K-means is an iterative algorithm, and two of the following steps are repeatedly carried out in its inner-loop. Which two?

**Answer:**
* The cluster assignment step, where the parameters <img src="https://latex.codecogs.com/svg.image?c^{(i)}" title="https://latex.codecogs.com/svg.image?c^{(i)}" /> are updated.
* Move the cluster centroids, where the centroids <img src="https://latex.codecogs.com/svg.image?\mu&space;_{k}" title="https://latex.codecogs.com/svg.image?\mu _{k}" /> are updated.

### Question 4
Suppose you have an unlabeled dataset <img src="https://latex.codecogs.com/svg.image?\left\{&space;x^{(1)},...,x^{(m)}\right\}" title="https://latex.codecogs.com/svg.image?\left\{ x^{(1)},...,x^{(m)}\right\}" />. You run K-means with 50 different random initializations, and obtain 50 different clusterings of the data. What is the recommended way for choosing which one of these 50 clusterings to use?

**Answer:** Compute the distortion function <img src="https://latex.codecogs.com/svg.image?J(c^{(1)},...,c^{(m)},\mu&space;_{1},...,\mu&space;_{k})" title="https://latex.codecogs.com/svg.image?J(c^{(1)},...,c^{(m)},\mu _{1},...,\mu _{k})" />, and pick the one that minimizes this.

**Explanation:** A lower value for the distortion function implies a better clustering, so you should choose the clustering with the smallest value for the distortion function.

### Question 5
Which of the following statements are true? Select all that apply.

|Answer|Explantion|
|---|---|
|On every iteration of K-means, the cost function <img src="https://latex.codecogs.com/svg.image?J(c^{(1)},...,c^{(m)},\mu&space;_{1},...,\mu&space;_{k})" title="https://latex.codecogs.com/svg.image?J(c^{(1)},...,c^{(m)},\mu _{1},...,\mu _{k})" />(the distortion function) should either stay the same or decrease; in particular, it should not increase.|Both the cluster assignment and cluster update steps decrese the cost / distortion function, so it should never increase after an iteration of K-means.|
|A good way to initialize K-means is to select K (distinct) examples from the training set and set the cluster centroids equal to these selected examples.|This is the recommended method of initialization.|
