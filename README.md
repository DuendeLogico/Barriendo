Barriendo
=========

Coursera Getting and Cleaning Data Course Project

The "CodeBook" file contains

1. The original codebook (the original description of the variables by the original authors), which is quite difficult to understand. The units are not clear, and apparently are normalized vectors.

2. A summary of all the modifications that I made to the raw data to transform them into the processed data.

The "run_analysis" file contains a R script that transforms the raw data into the processed data. This includes a more detailed account of the transformation process than the one in the "CodeBook" file, via the comments embedded in the script.
The script is intended to run in the working directory, not necessarily with the raw data already in it. That is, the script includes commands to download the raw data from the Internet, and unzip them.
The result is the creation of a new file in the working directory, called "Final_table.txt", that contains the processed data.

The script needs the "dplyr" package to be installed in order to run properly !!!
If dplyr is not installed, then type

install.packages("dplyr")

before running the script.
