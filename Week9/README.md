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
