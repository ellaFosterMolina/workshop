/* Do file for Introduction to Stata workshop
*Variable labelling and dropping data


Date: April 03, 2018
Creator: Ella Foster-Molina  
Modified by: (insert your name here)
*/


//this command prints the location your computer is currently using to find
//		files and other data. It's also the place your do file will be saved by default.
//		This is called your working directory
pwd

//cd changes the working directory. This should appear at the top of most of your
//		do files
cd "/Users/mfoster1/Documents/2018Spring"

//closes any log files that are still open
capture log close  

//creates log and starts recording output
log using introStata1.log, replace 

//this command tells your computer to use the .dta file called surveydata.dta
use surveydata, clear

//we've seen this before
describe

//inserting descriptive titles into the data descriptions

//labelling/describing the variable name hpbooks 
label variable hpbooks "number of Harry Potter books participant read"

describe
	/*Answer Q1*/

	/* On the line below, write and run the command to 
	label the variable 'cyear' with the text "Class year".
	This is a modification of the previous line that beings "label" */


//labeling each value of the Class year with the English equivalent
label define class 1 "Freshman" 2 "Sophomore" 3 "Junior" 4 "Senior"
label values cyear class

describe
codebook cyear

	/*uncomment (remove the '//' marks) the next line and run it. What error do you get? */
//label define class 1 "Freshman" 2 "Sophomore" 3 "Junior" 4 "Senior"
	/*comment out (insert '//') the previous line */
	
label define class 1 "Freshman" 2 "Sophomore" 3 "Junior" 4 "Senior", replace

codebook cyear
histogram cyear
	/*Answer Q2*/
	
	
//NOTE: Always create histograms, scatterplots, and summary statistics of
//		any variable you are using in an analysis 


	/* Uncomment and modify the line below so it adds a class called "Supersenior" for the value 5 */ 
//label define class 1 "Freshman" 2 "Sophomore" 3 "Junior" 4 "Senior"

codebook cyear

//if statements
count if cyear ==2
count if cyear <2
count if cyear >2

	/*Write a command to find how many people had a happiness level greater than
	"slightly happy". Refer to the survey and dataset to determine what number corresponds
	to "slightly happy". */
	
	/*Answer Q3*/

//Saves data to your own machine using a different name for the dataset
//		NOTE: This will save it to the directory you specified by the cd command on line 18
save "surveydataModified.dta"

//Saves the data to a .csv. 
//		This contains less information than .dta, but can be opened with excel or Google sheets
outsheet using surveydataModified.csv, comma replace


	/*Answer Q4*/


// close log file
log close

	/*Email everything to yourself! Congrats on getting through your first Stata program!!*/

//EXTRA plots 

//BOXPLOTS: look at mean, median, and extremes of a variable
graph box happy
hist happy

