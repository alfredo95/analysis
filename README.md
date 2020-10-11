### Information
There are two data sets: training and test containing motion data, extracted and derived from smart watches.

##### Data:
  * Data set X: actual smartphone data, captured in 66 different variables
  * Data set Y: type of activity carried out (a number from 1 to 6)
  * The subject who does the activity (a number from 1 to 30)
  * Two sets of data that label the variables with the characteristics of the clock and activities   performed.

The purpose of the project is to read the data from activities X, Y, and Subject to combine it into the test and train directories.
Subsequently, the X data will be ordered and only the columns containing mean or STD will be extracted and assigned a more descriptive label as well as replacing the activity numbers with activity descriptions.

The result will be a new data set created from the previous ones and we add the set merged by topic and activity, calculating the mean for each one and then ordering by topic and activity