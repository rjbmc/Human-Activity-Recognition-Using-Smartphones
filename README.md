# Human-Activity-Recognition-Using-Smartphones
Repo for Cleaning Data Course Project

Before begin, we load the required library "PLYR".

Our first task is to read from the directories "test" and "train" those files containing the subject ("subject_train.txt" and "subject_test.txt"), the activities("y_train.txt" and "y_test.txt") and the values ("X_train.txt" and "X_test.txt") of the observations.  

Once do  that, we merge the data frames "test" and "train" by using the rbind function in subject, activity and measured values.

Then, using "cbind" function, we put together subject, activity and observations into a structured data frame named "obs". Now we can remove unnecessary variables, give names to the two first columns ("Subject" and "Activity") and change the values in "Activity" column from numbers to his label value.

For naming the rest of columns, we read the "features.txt" file and put the second column of this data frame as his labels.

We have got completed now the "obs" data frame, we select only the two first columns and those who containing "mean" or "std" in her names into a new data frame named "obs1".  

To that frame we apply the "ddply" function, grouping by the two first columns and using the "numcolwise(mean)" function, wich calculate the average of each numeric column, giving another data frame (obs2) having the wanted data.
