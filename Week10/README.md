# Large Scale Machine Learning

## Quiz: Large Scale Machine Learning
### Question 1
Suppose you are training a logistic regression classifier using stochastic gradient descent. You find that the cost (say, <img src="https://latex.codecogs.com/svg.image?cost(\theta&space;,(x^{(i)},y^{(i)}))" />), averaged over the last 500 examples), plotted as a function of the number of iterations, is slowly increasing over time.  Which of the following changes are likely to help? 

**Answer:** Try using a smaller learning rate α. 

### Question 2
Which of the following statements about stochastic gradient descent are true? Check all that apply.
|True/False| Answer|
|---|---|
|**True**|Before running stochastic gradient descent, you should randomly shuffle (reorder) the training set.  
|| In order to make sure stochastic gradient descent is converging, we typically compute <img src="https://latex.codecogs.com/svg.image?J_{train}(\theta)" /> after each iteration (and plot it) in order to make sure that the cost function is generally decreasing. 
|| One of the advantages of stochastic gradient descent is that it uses parallelization and thus runs much faster than batch gradient descent. 
|| If you have a huge training set, then stochastic gradient descent may be much faster than batch gradient descent. 
|| Stochastic gradient descent is particularly well suited to problems with small training set sizes; in these problems, stochastic gradient descent is often preferred to batch gradient descent. 
|| Suppose you are using stochastic gradient descent to train a linear regression classifier. The cost function<img src="https://latex.codecogs.com/svg.image?J(\theta)=\frac{1}{2m}\sum&space;_{i=1}^{m}(h_{\theta}(x^{(i)})-y^{(i)})^{2}" /> is guaranteed to decrease after every iteration of the stochastic gradient descent algorithm. 
|| One of the advantages of stochastic gradient descent is that it can start progress in improving the parameters <img src="https://latex.codecogs.com/svg.image?\theta"  /> after looking at just a single training example; in contrast, batch gradient descent needs to take a pass over the entire training set before it starts to make progress in improving the parameters' values. 
|| In each iteration of stochastic gradient descent, the algorithm needs to examine/use only one training example. 

### Question 3
Which of the following statements about online learning are true? Check all that apply.
|True/False| Answer|
|---|---|
|False| When using online learning, you must save every new training example you get, as you will need to reuse past examples to re-train the model even after you get new training examples in the future. 
|**True**| One of the advantages of online learning is that if the function we're modeling changes over time (such as if we are modeling the probability of users clicking on different URLs, and user tastes/preferences are changing over time), the online learning algorithm will automatically adapt to these changes. 
|False|  Online learning algorithms are most appropriate when we have a fixed training set of size mm that we want to train on. 
|**True**| Online learning algorithms are usually best suited to problems were we have a continuous/non-stop stream of data that we want to learn from. 
|False| One of the advantages of online learning is that there is no need to pick a learning rate \alphaα. 
|**True**| In the approach to online learning discussed in the lecture video, we repeatedly get a single training example, take one step of stochastic gradient descent using that example, and then move on to the next example. 
|**True**| When using online learning, in each step we get a new example <img src="https://latex.codecogs.com/svg.image?(x,y)"  />, perform one step of (essentially stochastic gradient descent) learning on that example, and then discard that example and move on to the next. 
|False| One of the disadvantages of online learning is that it requires a large amount of computer memory/disk space to store all the training examples we have seen. 


### Question 4
Assuming that you have a very large training set, which of the following algorithms do you think can be parallelized using map-reduce and splitting the training set across different machines?  Check all that apply.
|True/False| Answer|
|---|---|
|False| An online learning setting, where you repeatedly get a single example <img src="https://latex.codecogs.com/svg.image?(x,y)"  />, and want to learn from that single example before moving on. 
|**True**| Linear regression trained using batch gradient descent. 
|**True**| A neural network trained using batch gradient descent. 
|False| Logistic regression trained using stochastic gradient descent. 
|**True**|Computing the average of all the features in your training set <img src="https://latex.codecogs.com/svg.image?\mu=\frac{1}{m}\sum_{i=1}^{m}x^{i}" /> (say in order to perform mean normalization). 

### Question 5
Which of the following statements about map-reduce are true? Check all that apply.
|True/False| Answer|
|---|---|
|**True**| If you have just 1 computer, but your computer has multiple CPUs or multiple cores, then map-reduce might be a viable way to parallelize your learning algorithm. 
|**True**| When using map-reduce with gradient descent, we usually use a single machine that accumulates the gradients from each of the map-reduce machines, in order to compute the parameter update for that iteration. 
|False| Running map-reduce over <img src="https://latex.codecogs.com/svg.image?N" /> computers requires that we split the training set into <img src="https://latex.codecogs.com/svg.image?N^{2}" /> pieces. 
|**True**| In order to parallelize a learning algorithm using map-reduce, the first step is to figure out how to express the main work done by the algorithm as computing sums of functions of training examples. 
|**True**| Because of network latency and other overhead associated with map-reduce, if we run map-reduce using NN computers, we might get less than an NN-fold speedup compared to using 1 computer. 
|**True**| If you have only 1 computer with 1 computing core, then map-reduce is unlikely to help. 
|False| Linear regression and logistic regression can be parallelized using map-reduce, but not neural network training.
