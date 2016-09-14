# AAOS-Abstract-Database-Schema
- Uses SQLServer (MSSQL)

*TODO:* Needs to go under the process of Normalization

[Click here for SQL Script of Database](https://github.com/austinvernsonger/AAOS-Abstract-Database-Schema/blob/master/ABS.sql)

## Database Name

### Spec_web

- - Tables
	- dbo.ABS
		- Call_Control
		- Call_FileUpload
		- Call_Questions
		- Call_SubQuestions
		- Disclosure_Tracking
		- Presentation_types
		- Presenter
		- Schedule
		- Scoring
		- Scoring_control
		- Scoring_types
		- Session
		- Static_Questions
		- Static_subQuestions
		- Submission_CoAuthor
		- Submission_Questions_Results 
		- Submissions
		- 
		
## Aspects of the Abstract Submission Process
- Call for submissions – Abstracts are submitted
- Grading of Abstracts – Completed submissions are graded by grading committees
- Acceptance – If the grading committee accepts the submission for presentation, the submitter has the opportunity to accept it
- Revision – Submitters can revise their previously submitted abstract
- An accepted submission can be scheduled for presentation at the society’s meeting. In many cases, they use the scheduling component of the software.


## Common Issues or requests

### Need to set up the meeting
- Ensure that the meeting details have been entered into Personify. If not, see Bridget
- A spreadsheet has been prepared for the society to enter the meeting information, based on the spreadsheet, the module can be set up.
- A pdf with submission questions should be prepared by the society.
 - Sometimes, the society simply wants a copy of last year’s submission questions. They can be copied by Maria’s group

### Submitter has updated their disclosure, but is still not allowed to submit.
 - The table which correlates the submitters AAOS mastercustomerid and their corresponding society mastercustomerid must be updated.

### A grading committee member cannot access the grading link
 - Is the committee member set up in the society’s Personify application and they do not have an expired end date
 - Is the grading module set up

### Co-author has disclosed, but their disclosure is not reflected in the application
 - Does the table for coauthors contain the correct AAOS master customer id
 - Does the table for coauthors contain an AAOS master customer id at all

### Co-Authors name needs to be changed
 - Should the name be changed in AAOS Personify?
 - Ensure that the name is changed in the coauthor table
