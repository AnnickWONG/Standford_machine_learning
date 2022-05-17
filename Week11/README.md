# Application Example: Photo OCR

## Quiz:
### Question 1
Suppose you are running a sliding window detector to find text in images.  Your input images are 1000x1000 pixels.  You will run your sliding windows detector at two scales, 10x10 and 20x20 (i.e., you will run your classifier on lots of 10x10 patches to decide if they contain text or not; and also on lots of 20x20 patches), and you will "step" your detector by 2 pixels each time.  About how many times will you end up running your classifier on a single 1000x1000 test set image?

**Answer:** 500,000

**Explanation:**  With a stride of 2, you will run your classifier approximately 500 times for each dimension. Since you run the classifier twice (at two scales), you will run it 2 * 500 * 500 = 500,000 times.  

### Question 2
 Suppose that you just joined a product team that has been developing a machine learning application, using m = 1,000m=1,000 training examples.  You discover that you have the option of hiring additional personnel to help collect and label data. You estimate that you would have to pay each of the labellers $10 per hour, and that each labeller can label 4 examples per minute.  About how much will it cost to hire labellers to label 10,000 new training examples?

**Answer:** $400

**Explanation:** On labeller can label 4 \times 60 = 2404×60=240 examples in one hour. It will thus take him 10,000 / 240 \approx 4010,000/240≈40 hours to complete 10,000 examples. At $10 an hour, this is $400.  

### Question 3
What are the benefits of performing a ceiling analysis?  Check all that apply.

|Answer|Explanation|
|---|---|
|It can help indicate that certain components of a system might not be worth a significant amount of work improving, because even if it had perfect performance its impact on the overall system may be small. |An unpromising component will have little effect on overall performance when it is replaced with ground truth. 
|It gives us information about which components, if improved, are most likely to have a significant impact on the performance of the final system.| The ceiling analysis gives us this information by comparing the baseline overall system performance with ground truth results from each component of the pipeline.  
|It helps us decide on allocation of resources in terms of which component in a machine learning pipeline to spend more effort on. | The ceiling analysis reveals which parts of the pipeline have the most room to improve the performance of the overall system. 

### Question 4
Suppose you are building an object classifier, that takes as input an image, and recognizes that image as either containing a car (y=1) or not (y=0).  For example, here are a positive example and a negative example:

![Q4](https://github.com/AnnickWONG/Standford_machine_learning/blob/Week12/Week11/images/Q4.png)

After carefully analyzing the performance of your algorithm, you conclude that you need more positive (y=1y=1) training examples. Which of the following might be a good way to get additional positive examples?

|Answer|Explanation|
|---|---|
|Apply translations, distortions, and rotations to the images already in your training set. |These geometric distortions are likely to occur in real-world images, so they are a good way to generate additional data. 
|Mirror your training images across the vertical axis (so that a left-facing car now becomes a right-facing one). | A mirrored example is different from the original but equally likely to occur, so mirroring is a good way to generate new data. 

### Question 5
Suppose you have a PhotoOCR system, where you have the following pipeline:

![Q5_pipeline](https://github.com/AnnickWONG/Standford_machine_learning/blob/Week12/Week11/images/Q5_pipeline.png)

You have decided to perform a ceiling analysis on this system, and find the following:

![Q5_accuracy](https://github.com/AnnickWONG/Standford_machine_learning/blob/Week12/Week11/images/Q5_accuracy.png)

Which of the following statements are true?

|Answer|Explanation|
|---|---|
|If we conclude that the character recognition's errors are mostly due to the character recognition system having high variance, then it may be worth significant effort obtaining additional training data for character recognition. | Since the biggest improvement comes from character recognition ground truth, we would like to improve the performance of that system. It the character recognition system has high variance, additional data will improve its performance. 
|Performing the ceiling analysis shown here requires that we have ground-truth labels for the text detection, character segmentation and the character recognition systems. | At each step, we provide the system with the ground-truth output of the previous step in the pipeline. This requires ground truth for every step of the pipeline. 
