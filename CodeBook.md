#Overview

This dataset is a summarization of Human Activity Recognition data collected using the sensors in the Samsung Galaxy S II.
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.

#Data Points

The data points made available by this script are averages (as calculated over unique combinations of the Subject and Activity) of a subset of the original data points:

These signals were used to estimate variables of the feature vector for each pattern:
 '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAccelerometer-XYZ
* timeGravityAccelerometer-XYZ
* timeBodyAccelerometerJerk-XYZ 
* timeBodyGyroscope-XYZ 
* timeBodyGyroscopeJerk-XYZ 
* timeBodyAccelerometerMagnitude 
* timeGravityAccelerometerMagnitude 
* timeBodyAccelerometerJerkMagnitude 
* timeBodyGyroscopeMagnitude 
* timeBodyGyroscopeJerkMagnitude
* frequencyBodyAccelerometer-XYZ 
* frequencyBodyAccelerometerJerk-XYZ 
* frequencyBodyGyroscope-XYZ 
* frequencyBodyAccelerometerMagnitude 
* frequencyBodyAccelerometerJerkMagnitude 
* frequencyBodyGyroscopeMagnitude 
* frequencyBodyGyroscopeJerkMagnitude


For each of these features, there is the mean and standard deviation calculations.

The averages of those calculations were then determined for each unique combination of Subject and Activity. These averages, along with their corresponding Subject ID and Activity Name are what is written to the output file.


#Data Dictionary

subject - Integer - An identifier that represents a single person in the study. 
activity - Character (Factor) A- n identifier that describes the type of physical activity the measurements are associated with. Possible values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING 
