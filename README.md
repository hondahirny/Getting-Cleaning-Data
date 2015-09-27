This repository contains data for the class project for
Coursera "Getting & Cleaning Data" course.

The intent of this project was to take in a large data set, which was spread
across numerous files.  It was then combined, then simplified using averages
categorized by subject (person) and type of activity performed.

Included Files:
* CodeBook.md		-This file explains the source data and its variables.
* courseproject.txt	-This is the tidy data set, using spaces as separators.
* README.md			-This is the file you're reading now and is likely the droid you are looking for.
* run_analysis.R		-This is the R script used to perform the analytical magic.

Script Description of run_analysis.R
This R script takes a variety of text files, which contain data on:
* 79 different values, collected from cell phone accelerometer data.  The means of this data
	are included in "courseproject.txt" and are sorted by activity type and subject.
* "Subject" data (column 2), which identifies the individual being evaluated, using a number (no names)
* "Activity" data (column 1), which identifies what a subject was doing when data was collected.

For line-by-line descriptions of the function, see the run_analysis.R file.