/* Base code for all .do files. Put a description of which homework
and what the topic is here.

Date: insert date here
Creator:  your name here
*/

//This command clears out any prior data you had loaded into Stata. It is a 
//		"just in case" command that you should always include.
clear

//You should have a folder on your computer/on the cloud for each of your Stata homework sets
//		The command cd changes the working directory to match the folder that you have all you homework 
//		documents saved in. This command should appear at the top of all of your
//		do files. Change what is in quotes to match where you have saved your stata homework
// 		files.
cd "myDirectory/myFolder"

//closes any log files that are still open. This is a "just in case" line of code
//		that you should always include.
capture log close  

//creates a log file that records output from all subsequent commands in the .do file
log using usefulLogFileName.log, replace 


/*
PUT YOUR COMMANDS TO ANSWER THE HOMEWORK BELOW the next star slash symbol.
Note which question you are answering with a comment above the command/commands.

Play with commands and create all the errors you want while experimenting.
The final .do file you turn in can NOT contain commands with errors. 

When you have a clean .do file with all the commands needed for the homework, run
the entire .do file from top to bottom. This will create a .log file with all the 
information created by the .do file: 
	question numbers, commands, and the output from those commands
This only works if you have no errors in your .do file when you run it for the final
time.
*/


// close log file
log close

