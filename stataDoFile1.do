/* Do file for Introduction to Stata workshop
Variable description and modification

Locations to answer questions or insert your own code are listed inside the following notation:
	/* Answer here*/


Date: September 06, 2018 
Creator: Ella Foster-Molina  
Modified by: (insert your name here)
*/

//Please paste this link into your browswer and take the survey
// https://swarthmore.az1.qualtrics.com/jfe/form/SV_cHEUe7O3wQejBE9

// importing survey data file from the internet 
copy https://raw.githubusercontent.com/ellaFosterMolina/jobInfo/master/surveydataFall2018.csv surveydata.csv
import delimited surveydata.csv, clear

describe
summarize
	/*Answer Q1 and 2*/

histogram happy
summarize happy, detail
	/*Answer Q3 and Q4*/


//Click on the main window for Stata
//Select Graphics > Histogram from the menu bar
//Click the radio box to check "Data are discrete"
//Click the box next to "Add height labels to bars 
//You will see the following line  appear in the "results" box 

histogram happy, discrete frequency addlabel
	/*Answer Q5*/

	/*Copy the command above and paste it below this comment.
	Remove "addlabel" from the new line. Run the line using the keyboard or the "Do" button
	 */
	 
 
//Adding titles. This is also possible by pointing and clicking 
histogram happy, discrete frequency addlabel title(Happiness distribution of people starting to program)


	/* Make a histogram of the number of Harry Potter books survey respondents have read
	TIP: Copy and paste one of the lines above, and modify them for Harry Potter books 
	TIP: Make a habit of copy and pasting */

	/*Answer Q6, Q7, and Q8*/

//SORT BY COMMAND EXAMPLES
//creating a summary table for each class year separately

sort cyear  //necessary for the next line to run. Without it you get a "unsorted" error
by cyear: summarize //creating summary stats for each class year in the data
help sum

	/* Write and run the commands necessary to create summary tables sorted by gender. 
	I.e. you should see the summary statistics for males and females separately
	*/
//SORT BY COMMAND EXAMPLES

	/*Answer Q9 */
	

//making scatterplots
twoway (scatter happy sleep, jitter(10) msize(small))


	/* Run a scatterplot of exp_gpa (gpa average) against happy. */
 

//GENERATING NEW DATA

//generating a new grades variable
gen gradesModified = grade

replace gradesModified="A" if grade=="A+"
replace gradesModified="A" if grade=="A-"
replace gradesModified="B" if grade=="B+"
replace gradesModified="B" if grade=="B-"
tabulate grade
tabulate gradesModified

	/*Add another line to the above code so that the grade C+ becomes C in gradesModified
	What else would be useful to change?*/
	
	/*Answer Q10*/ 


/*describe the data once more and enter the command to do so below  (not a trick request)*/

//we could now decide that grades is an unnecessary variable, and drop it. Before running this line,
//remove the commenting code (the slashes) in the line below

//drop grades


//It's impossible to reverse this command once it is implemented.
//That variable is now gone from your working data.

	/*
	Why does the do file let us recover this variable if we decide we need it again?
	Write the answer in a comment below the next line.
	*/


//We went over how to locate your files on your computer here 


//SAVING YOUR DATA TO YOUR COMPUTER

***** IMPORTANT ****
//You must replace the text in quotes with a path specific to your computer and your file
//management system 
cd "/Users/mfoster1/Documents/2018 Fall/introduction to stata1"
save surveydata.dta


//EXTRA plots 

//installing a new function (called a library) that will let you do create fun new graphics
ssc install spineplot


spineplot cyear height_in
