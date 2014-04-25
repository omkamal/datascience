# Human Activity Recognition Using Smartphones Dataset Code Book

## Introduction

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities: 

* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

Subjects were wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has **gravitational** and **body motion** components, was separated using a Butterworth low-pass filter into **body acceleration** and **gravity**. 

The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

Only __*mean*__ and __*standard deviation*__ measures were required to get averaged across:

* Subjects: ( __30 Subject__ ) 
* Activity Labels: ( __6 Activites__ )

That will make a data frame the consistes of __30 * 6 = 180__ records.


## Data Processing and transformation
The following steps were carried out to __transform__ the raw data into the __tidy data__:

1. All features columns labels is read from the file __feature.txt__ into an R data frame (__561__ columns).
2. The following 3 files in the __train__ directory are read into R, each in a seperate data frame.
  * X_train.txt
  * subject_train.txt
  * y_train.txt
3. The 3 data frames columns are then merged into one data frame and called __training_data__.  
4. The following 3 files in the __test__ directory are read into R, each in a seperate data frame.
  * X_test.txt
  * subject_test.txt
  * y_test.txt
5. The 3 data frames columns are then merged into one data frame and called __testing_data__.
6. Both __training_data__ and __testing_data__ are merged into one data frame and is called __all_data__.
7. Columns the contain either of the following words (__*mean*__ or __*std*__) in their columns labels are indentifed using __grep__ command.
8. Using the indexs for those columns, another data frame is constructed that holds the subset of data required (__mean__ and __standard deviation__) columns only, the new dataframe is called __subset_data__.
9. A new column is added that contains the __Activity_Labels__ by reading the file __*activity_labels.txt*__ and carrying out the __look up__.
10. Data is then melted using the __melt__ command (__*reshape*__ package).
11. The data is then casted and summarized using the __*mean*__ function across both __subjects__ and __activity_labels__.
12. The data is then save as __CSV tab delimited file__ using the file name __*tidy_data_tab_delimted.txt*__.



## Data Units
* Some columns are measured in __seconds__ and some in __hertz__ and is normalized across the columns.
* __Subjects__ and __Activity Labels__ are factors. 
  

## Feature Data.
Each record contain the following data:

1. subject
2. activity_label
3. y
4. tBodyAcc-mean()-X
5. tBodyAcc-mean()-Y
6. tBodyAcc-mean()-Z
7. tBodyAcc-std()-X
8. tBodyAcc-std()-Y
9. tBodyAcc-std()-Z
10. tGravityAcc-mean()-X
11. tGravityAcc-mean()-Y
12. tGravityAcc-mean()-Z
13. tGravityAcc-std()-X
14. tGravityAcc-std()-Y
15. tGravityAcc-std()-Z
16. tBodyAccJerk-mean()-X
17. tBodyAccJerk-mean()-Y
18. tBodyAccJerk-mean()-Z
19. tBodyAccJerk-std()-X
20. tBodyAccJerk-std()-Y
21. tBodyAccJerk-std()-Z
22. tBodyGyro-mean()-X
23. tBodyGyro-mean()-Y
24. tBodyGyro-mean()-Z
25. tBodyGyro-std()-X
26. tBodyGyro-std()-Y
27. tBodyGyro-std()-Z
28. tBodyGyroJerk-mean()-X
29. tBodyGyroJerk-mean()-Y
30. tBodyGyroJerk-mean()-Z
31. tBodyGyroJerk-std()-X
32. tBodyGyroJerk-std()-Y
33. tBodyGyroJerk-std()-Z
34. tBodyAccMag-mean()
35. tBodyAccMag-std()
36. tGravityAccMag-mean()
37. tGravityAccMag-std()
38. tBodyAccJerkMag-mean()
39. tBodyAccJerkMag-std()
40. tBodyGyroMag-mean()
41. tBodyGyroMag-std()
42. tBodyGyroJerkMag-mean()
43. tBodyGyroJerkMag-std()
44. fBodyAcc-mean()-X
45. fBodyAcc-mean()-Y
46. fBodyAcc-mean()-Z
47. fBodyAcc-std()-X
48. fBodyAcc-std()-Y
49. fBodyAcc-std()-Z
50. fBodyAcc-meanFreq()-X
51. fBodyAcc-meanFreq()-Y
52. fBodyAcc-meanFreq()-Z
53. fBodyAccJerk-mean()-X
54. fBodyAccJerk-mean()-Y
55. fBodyAccJerk-mean()-Z
56. fBodyAccJerk-std()-X
57. fBodyAccJerk-std()-Y
58. fBodyAccJerk-std()-Z
59. fBodyAccJerk-meanFreq()-X
60. fBodyAccJerk-meanFreq()-Y
61. fBodyAccJerk-meanFreq()-Z
62. fBodyGyro-mean()-X
63. fBodyGyro-mean()-Y
64. fBodyGyro-mean()-Z
65. fBodyGyro-std()-X
66. fBodyGyro-std()-Y
67. fBodyGyro-std()-Z
68. fBodyGyro-meanFreq()-X
69. fBodyGyro-meanFreq()-Y
70. fBodyGyro-meanFreq()-Z
71. fBodyAccMag-mean()
72. fBodyAccMag-std()
73. fBodyAccMag-meanFreq()
74. fBodyBodyAccJerkMag-mean()
75. fBodyBodyAccJerkMag-std()
76. fBodyBodyAccJerkMag-meanFreq()
77. fBodyBodyGyroMag-mean()
78. fBodyBodyGyroMag-std()
79. fBodyBodyGyroMag-meanFreq()
80. fBodyBodyGyroJerkMag-mean()
81. fBodyBodyGyroJerkMag-std()
82. fBodyBodyGyroJerkMag-meanFreq()
