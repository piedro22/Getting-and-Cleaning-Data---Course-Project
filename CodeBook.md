Code Book
================

## VARIABLES AND UNITS

This dataset is composed of 68 variables, which
include the subject’s ID (subject\_id), the activity they were executing
when data was collected (activity - walking, walking upstairs, walking
downstairs, sitting, standing, laying) and time and frequency domain
measures of different movement components, data collecting device,
descriptive statistical measure and movement axis.

Variable names are writen based on a code to facilitate comprehension of
the measurements parameters:

        t or f: time or frequency measure. 
        Body or Gravity: Body motion or gravitational movement component.
        Acc or Gyro: Accelerometer or Gyroscope as data collecting device. 
        Mean or std: Mean or Standard Deviation as descriptive statistical measure. 
        X, Y or Z: Direction of the 3-axial signal.

Features, and their respective descriptive statistics, were normalized
and bounded within (-1, 1).

## STUDY DESIGN

The experiments have been carried out with a group of
30 volunteers within an age bracket of 19-48 years. Each person
performed six activities (WALKING, WALKING\_UPSTAIRS,
WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone
(Samsung Galaxy S II) on the waist. Using its embedded accelerometer and
gyroscope, we captured 3-axial linear acceleration and 3-axial angular
velocity at a constant rate of 50Hz.

## DATA CLEANING PROCESS 

The data cleaning process was composed of 7
steps. 
        The first two steps were creating two datasets: one for the test
observations (30% of all observations) and another for the train observation (70% of all observations). 
        The third step was merging these two datasets to form the complete dataset with the total of data observations. 
        The fourth step was to extract, among all the 563 variables, the ones that only expressed as values means or standard deviations of the features. 
        The fifth step was rename the values of the activity variable as descriptively as possible. 
        The sixth step was to rename all the variables as descriptively as possible. 
        And finally, the last step was to group the observation by subject and activity and take the measure of each variable for each group.
