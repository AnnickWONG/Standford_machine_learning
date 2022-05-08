# Anomaly Detection & Recommender Systems

## Quiz: Anomaly Detection
### Question 1
For which of the following problems would anomaly detection be a suitable algorithm?

|True/Flase|Answer|Explanation|
|---|---|---|
|**True**|From a large set of primary care patient records, identify individuals who might have unusual health conditions.|Since you are just looking for unusual conditions instead of a particular disease, this is a good application of anomaly detection.|
|**True**|Given a dataset of credit card transactions, identify unusual transactions to flag them as possibly fraudulent.|By modeling "normal" credit card transactions, you can then use anomaly detection to flag the unusuals ones which might be fraudulent.|
|False|In a computer chip fabrication plant, identify microchips that might be defective.|Classification problem
|False|Given data from credit card transactions, classify each transaction according to type of purchase (for example: food, transportation, clothing).|Classification Problem
|False|From a large set of hospital patient records, predict which patients have a particular disease (say, the flu).|Classification Problem

### Quesion 2
Suppose you have trained an anomaly detection system that flags anomalies when <img src="https://latex.codecogs.com/svg.image?p(x)" /> is less than <img src="https://latex.codecogs.com/svg.image?\epsilon" />, and you find on the cross-validation set that it has too many false positives (flagging too many things as anomalies / it mis-flagging far too many good transactions as fradulent).  What should you do?

**Answer:** Decrease <img src="https://latex.codecogs.com/svg.image?\epsilon&space;" />

**Explanation:** By decreasing <img src="https://latex.codecogs.com/svg.image?\epsilon&space;" />, you will flag fewer anomalies, as desired.

### Question 3
Suppose you are developing an anomaly detection system to catch manufacturing defects in airplane engines.  You model uses

<img src="https://latex.codecogs.com/svg.image?p(x)=\prod&space;_{j=1}^{n}p(x_{j};\mu&space;_{j},\sigma&space;_{j}^{2})"/>

You have two features <img src="https://latex.codecogs.com/svg.image?x_{1}"/>= vibration intensity, and <img src="https://latex.codecogs.com/svg.image?x_{2}" />= heat generated.  Both <img src="https://latex.codecogs.com/svg.image?x_{1}" /> and <img src="https://latex.codecogs.com/svg.image?x_{2}" /> take on values between 0 and 1 (and are strictly greater than 0), and for most "normal" engines you expect that <img src="https://latex.codecogs.com/svg.image?x_{1}\approx&space;x_{2}" />.  One of the suspected anomalies is that a flawed engine may vibrate very intensely even without generating much heat (large <img src="https://latex.codecogs.com/svg.image?x_{1}"/> , small <img src="https://latex.codecogs.com/svg.image?x_{2}"/>), even though the particular values of <img src="https://latex.codecogs.com/svg.image?x_{1}"/> and <img src="https://latex.codecogs.com/svg.image?x_{2}"/> may not fall outside their typical ranges of values.  What additional feature <img src="https://latex.codecogs.com/svg.image?x_{3}"/> should you create to capture these types of anomalies:
 
 **Answer:** <img src="https://latex.codecogs.com/svg.image?x_{3}=\frac{x_{1}}{x_{2}}"/>
 
 **Explanation:** As it will take on large values for anomalous examples and smaller values for normal examples.
 
 ### Question 4
 Which of the following are true? Check all that apply.
 
|True/False|Answer|Explanation|
|---|---|---
|**True**|If you do not have any labeled data (or if all your data has label <img src="https://latex.codecogs.com/svg.image?y=0"/>), then is is still possible to learn <img src="https://latex.codecogs.com/svg.image?p(x)"/>, but it may be harder to evaluate the system or choose a good value of <img src="https://latex.codecogs.com/svg.image?\epsilon&space;" />.|Only negative examples are used in training, but it is good to have some labeled data of both types for cross-validation.|
|**True**|When choosing features for an anomaly detection system, it is a good idea to look for features that take on unusually large or small values for (mainly the) anomalous examples.|These are good features, as they will lie outside the learned model, so you will have small values for <img src="https://latex.codecogs.com/svg.image?p(x)" /> with these examples.|
|**True**|When developing an anomaly detection system, it is often useful to select an appropriate numerical performance metric to evaluate the effectiveness of the learning algorithm.|You should have a good evaluation metric, so you can evaluate changes to the model such as new features.|
|**True**|In anomaly detection, we fit a model <img src="https://latex.codecogs.com/svg.image?p(x)"/> to a set of negative (<img src="https://latex.codecogs.com/svg.image?y=0"/>) examples, without using any positive examples we may have collected of previously observed anomalies.|We want to model "normal" examples, so we only use negative examples in training.|
|False|If you are developing an anomaly detection system, there is no way to make use of labeled data to improve your system.|
|False|If you have a large labeled training set with many positive examples and many negative examples, the anomaly detection algorithm will likely perform just as well as a supervised learning algorithm such as an SVM.|Anomaly detection only models the negative examples, whereas an SVM learns to discriminate between positive and negative examples, so the SVM will perform better when you have many positive and negative examples.|
|False|In a typical anomaly detection setting, we have a large number of anomalous examples, and a relatively small number of normal/non-anomalous examples.|
|False|When evaluating an anomaly detection algorithm on the cross validation set (containing some positive and some negative examples), classification accuracy is usually a good evaluation metric to use.|Classification accuracy is not enough for evaluating an anomaly detection. Since there are relatively small number of anomalous examples, flagging all the examples as normal could have a greate accuracy.

### Question 5
 You have a 1-D dataset <img src="https://latex.codecogs.com/svg.image?\left\{x^{(1)},...,x^{(m)}&space;\right\}"/>and you want to detect outliers in the dataset. You first plot the dataset and it looks like this:
 
 ![Q5](https://github.com/AnnickWONG/Standford_machine_learning/blob/Week9/Week9/image/Q5.png)
 
 Suppose you fit the gaussian distribution parameters <img src="https://latex.codecogs.com/svg.image?\mu&space;_{1}" /> and <img src="https://latex.codecogs.com/svg.image?\sigma_{1}^{2}&space;" />  to this dataset. Which of the following values for <img src="https://latex.codecogs.com/svg.image?\mu&space;_{1}" /> and <img src="https://latex.codecogs.com/svg.image?\sigma_{1}^{2}&space;" /> might you get?

**Answer:** <img src="https://latex.codecogs.com/svg.image?\mu&space;_{1}=-3,\sigma_{1}^{2}&space;=4"/>

**Explanation:** The data are centered around -3 and tail most of the points lie in [-5, -1].

## Recommender Systems
### Question 1
Suppose you run a bookstore, and have ratings (1 to 5 stars) of books.  Your collaborative filtering algorithm has learned a parameter vector <img src="https://latex.codecogs.com/svg.image?\theta&space;^{(j)}" /> for user <img src="https://latex.codecogs.com/svg.image?j"/>, and a feature<img src="https://latex.codecogs.com/svg.image?x^{(i)}"/> for each book.  You would like to compute the "training error", meaning the average squared error of your system's predictions on all the ratings that you have gotten from your users.  Which of these are correct ways of doing so (check all that apply)?
For this problem, let <img src="https://latex.codecogs.com/svg.image?m"/> be the total number of ratings you have gotten from your users.  (Another way of saying this is <img src="https://latex.codecogs.com/svg.image?m=\sum&space;_{i=1}^{n_{m}}\sum&space;_{j=1}^{n_{u}}r(i,j)"/>.  [Hint: Two of the four options below are correct.]

**Answer:**
* <img src="https://latex.codecogs.com/svg.image?\frac{1}{m}\sum&space;_{(i,j):r(i,j)=1}((\theta&space;^{(j)})^{T}x^{(i)}-y^{(i,j)})^{2}" />
* <img src="https://latex.codecogs.com/svg.image?\frac{1}{m}\sum&space;_{(i,j):r(i,j)=1}(\sum&space;_{k=1}^{n}(\theta&space;^{(j)})_{k}x_{k}^{(i)}-y^{(i,j)})^{2}" />
* <img src="https://latex.codecogs.com/svg.image?\frac{1}{m}\sum&space;_{i=1}^{n_{m}}\sum&space;_{j:r(i,j)=1}(\sum&space;_{k=1}^{n}(\theta&space;^{(j)})_{k}x_{k}^{(i)}-y^{(i,j)})^{2}"/>
* <img src="https://latex.codecogs.com/svg.image?\frac{1}{m}\sum&space;_{j=1}^{n_{u}}\sum&space;_{j:r(i,j)=1}(\sum&space;_{k=1}^{n}(\theta&space;^{(j)})_{k}x_{k}^{(i)}-y^{(i,j)})^{2}" />


### Question 2
In which of the following situations will a collaborative filtering system be the most appropriate learning algorithm (compared to linear or logistic regression)?

**Answer:**
* You own a clothing store that sells many styles and brands of jeans. You have collected reviews of the different styles and brands from frequent shoppers, and you want to use these reviews to offer those shoppers discounts on the jeans you think they are most likely to purchase
* You run an online bookstore and collect the ratings of many users. You want to use this to identify what books are "similar" to each other (i.e., if one user likes a certain book, what are other books that she might also like?)


### Question 3
You run a movie empire, and want to build a movie recommendation system based on collaborative filtering.  There were three popular review websites (which we'll call A, B and C) which users to go to rate movies, and you have just acquired all three companies that run these websites.  You'd like to merge the three companies' datasets together to build a single/unified system.  On website A, users rank a movie as having 1 through 5 stars. On website B, users rank on a scale of 1 - 10, and decimal values (e.g., 7.5) are allowed. On website C, the ratings are from 1 to 100.  You also have enough information to identify users/movies on one website with users/movies on a different website.  Which of the following statements is true?

**Answer:** 
* You can merge the three datasets into one, but you should first normalize each dataset separately by subtracting the mean and then dividing by (max - min) where the max and min (5-1) or (10-1) or (100-1) for the three websites respectively.
* You can merge the three datasets into one, but you should first normalize each dataset's ratings (say rescale each dataset's ratings to a 1-100 range).

### Question 4
Which of the following are true of collaborative filtering systems? Check all that apply.

**Answer:**
* Even if each user has rated only a small fraction of all of your products (so <img src="https://latex.codecogs.com/svg.image?r(i,j)=0"  /> for the vast majority of <img src="https://latex.codecogs.com/svg.image?(i,j)"  /> pairs), you can still build a recommender system by using collaborative filtering.
* For collaborative filtering, it is possible to use one of the advanced optimization algoirthms (L-BFGS/conjugate gradient/etc.) to solve for both the <img src="https://latex.codecogs.com/svg.image?x^{(i)}"/>'s and <img src="https://latex.codecogs.com/svg.image?\theta^{(j)}"/> 's simultaneously.
* If you have a dataset of users ratings' on some products, you can use these to predict one user's preferences on products he has not rated.
* Recall that the cost function for the content-based recommendation system is <img src="https://latex.codecogs.com/svg.image?J(\theta&space;)=\frac{1}{2}\sum&space;_{j=1}^{n_{u}}\sum&space;_{i:r(i,j)=1}((\theta&space;^{(j)})^{T}x^{(i)}-y^{(i,j)})^{2}&plus;\frac{\lambda&space;}{2}\sum&space;_{j=1}^{n_{u}}\sum&space;_{k=1}^{n}(\theta&space;_{k}^{(j)})^{2}" /> . Suppose there is only one user and he has rated every movie in the training set. This implies that <img src="https://latex.codecogs.com/svg.image?n_{u}=1"/> and <img src="https://latex.codecogs.com/svg.image?r(i,j)=1" /> for every <img src="https://latex.codecogs.com/svg.image?(i,j)"/>. In this case, the cost function <img src="https://latex.codecogs.com/svg.image?J(\theta&space;)" /> is equivalent to the one used for regularized linear regression.

### Question 5
Suppose you have two matrices <img src="https://latex.codecogs.com/svg.image?A" title="https://latex.codecogs.com/svg.image?A" /> and <img src="https://latex.codecogs.com/svg.image?B"/>, where <img src="https://latex.codecogs.com/svg.image?A" title="https://latex.codecogs.com/svg.image?A" /> is 5x3 and <img src="https://latex.codecogs.com/svg.image?B"/> is 3x5. Their product is <img src="https://latex.codecogs.com/svg.image?C=AB"/>, a 5x5 matrix. Furthermore, you have a 5x5 matrix <img src="https://latex.codecogs.com/svg.image?R" /> where every entry is 0 or 1. You want to find the sum of all elements <img src="https://latex.codecogs.com/svg.image?C(i,j)"/> for which the corresponding <img src="https://latex.codecogs.com/svg.image?R(i,j)"/>  is 1, and ignore all elements <img src="https://latex.codecogs.com/svg.image?C(i,j)"/>  where <img src="https://latex.codecogs.com/svg.image?R(i,j)=0"/>. One way to do so is the following code:

```
C = A * B;
total = 0;
for i = 1:5
   for j = 1:5
      if (R(i,j） == 1）
         total = total + C(i,j);
      end
   end
end
```

Which of the following pieces of Octave code will also correctly compute this total? Check all that apply. Assume all options are in code. 
     
**Answer:**     
* total = sum(sum((A * B) .* R))
* C = A * B; total = sum(sum(C(R == 1)))
* C = (A * B) .* R; total = sum(C(:));
