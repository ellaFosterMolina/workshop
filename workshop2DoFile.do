/* Do file for Second Introduction to Stata workshop
Graphing and exploring variables, probability distributions

Date: September 20, 2018 
Creator: Ella Foster-Molina  
Modified by: (insert your name here)
*/

clear

//this command prints the location your computer is currently using to find
//		files and other data. It's also the place your do file will be saved by default.
//		This is called your working directory
pwd

//cd changes the working directory. This should appear at the top of most of your
//		do files
cd "/Users/mfoster1/Documents/2018 Fall/stata 2"

//closes any log files that are still open
capture log close  

//creates log and starts recording output
log using introStata2.log, replace 


// IMPORT SURVEY DATA FROM INTERNET
copy https://raw.githubusercontent.com/DrEllaSwat/stataWorkshops/master/voters2012.csv votingData.csv
import delimited votingData.csv, clear

		/*Your task:
				describe and summarize the data, making sure to put the code in this do file
		*/

set more off

//LABELLING VARIABLES
label define partisanship -3 "Strong Dem" -2 "Democrat" -1 "Weak Dem" ///
					0 "Independent" 1 "Weak Rep" 2 "Republican" 3 "Strong Rep" 
label values partyid partisanship


		/*Your task: define a class that assigns the code "No vote for an MC" to 0 and 
						"voted for an MC" to 1
		*/


		/*Your task: assign that class to the variable votedforcong */


		/*Your task: Create a histogram of
					yrsedu (years of education), approveofbusiness, approve of conservatives
		*/

		
// SCATTERPLOTS AND REGRESSION LINES

//Basic scatterplot 
twoway (scatter approveofbusiness approveofconservatives)

//	Basic regression line
graph twoway lfit approveofbusiness approveofconservatives

//	Jittering the data
help jitter

//	creating a jitter in the data
//   using /// to tell the computer to execute both lines as one command. Must highlight both lines to run
twoway (scatter approveofbusiness approveofconservatives, ///
		msize(vsmall) jitter(10) mcolor(%50))

		/*Your task: Play with the values in jitter. Do you have a better value that produces a more legible graph? */


		/* Google "add regression line scatter plot stata"
					click on the stats.idre.ucla.edu link
		Your task: In groups of 2-3, write the code that will produce a scatterplot with the 
					regression line and a confidence interval all in one graph
		*/



		/*Your task: In groups of 2-3, come up with two other variables that you want to look at
					Come up with at least one hypothesis for what the relationship will be
					Write that in the space for a comment below this line

		Your hypothesis: _________________________


		Your task: In groups of 2-3
					Create a scatterplot with a regression line and confidence interval for those two variables
		*/
			
			
//CALCULATING CDF VALUE for NORMAL and TTEST
// http://www.stat.columbia.edu/~regina/W1111S09/tutorial5.pdf  for t distribution

display normal(1.67)   // this generates the percent of the normal distribution below 1.67 standard devations
					// above the mean value
					
display 1- 2*(1-normal(1.67))  // this generates the percent of the normal distribution between -1.67 std deviations and 1.67 std deviations
display normal(1.67) - normal(-1.67) // what does this do? 
					
			
//Graphing multiple box plots
hist approveofbusiness
summarize approveofbusiness, detail
graph hbox approveofbusiness

graph hbox approveofbusiness, over(isrepublican, descending) 

graph hbox approveofbusiness, over(isrepublican, descending) by(votedforcong)


//STD ERRORS and 95% CONFIDENCE INTERVALS
sort isrepublican
by isrepublican: summarize approveofbusiness, detail

by isrepublican: tabstat approveofbusiness, stats(mean sd semean min max n)
//		Note: semean, the standard error = sd/squareroot(n) = 1.683654/squareroot(3579) = 0.0281431


help(ci)
ci means approveofbusiness

display 49.18343- 1.96*.3210645

ttest approveofbusiness, by(isrepublican)

clear
cd "/Users/mfoster1/Documents/2018 Fall/stata 2"

import excel pointEstimatesCIs.xls , firstrow


list
label define republican  0 "Democrat" 1 "Republican" 
label values aprvbusiness_republican republican

list


//plotting the standard error for the mean
//		this shows the expected middle 95% of sample means

serrbar mean se aprvbusiness_republican, scale (1.96)

//plotting the standard deviation of the population
// this shows how many years of education the middle 95% of the population obtained

serrbar mean sd aprvbusiness_republican, scale (1.96)


// close log file
log close

