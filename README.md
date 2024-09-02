# Healthcare Database Design
I developed a database to help manage patient records, doctor information, and other related data in a healthcare setting. The goal was to build a simple and efficient system to store and access this information, making it easier to manage patients and improve the overall care they receive.


## Tools and Technologies Used
- SQL Server: The main software used to create and manage the database.
-	SQL Language: A programming language used to set up the database, create tables, and run queries to get information.
-	Stored Procedures and Views: Special tools within the database that help retrieve and update data easily.
-	Error Handling: Built-in checks to make sure the system runs smoothly without errors.

  
## Project Steps
1.	Creating the Database:
- I set up a database to hold all the necessary information for managing healthcare data.
2.	Setting Up Tables:
-	Patient Table: This table stores details about each patient, like their ID, name, age, gender, doctor, and state.
-	Doctor Table: This table lists all the doctors, along with their names and specialties.
-	StateMaster Table: This table holds information about different states where patients live.
-	Department Table: This table categorizes doctors and patients by medical departments, like cardiology or neurology.
3.	Adding Data:
-	Filled the tables with initial data, including patient details, doctor information, and department classifications, to test how everything works together.
4.	Creating Queries:
-	Finding Patient Ages: We developed tools to find patients with the same age and to identify the second oldest patient along with their doctor and department.
-	Working with Patient Names: We created tools to pull out just the first name of a patient and add their age, and to find patients with odd-numbered ages.
-	Making Views and Procedures:
-	Patient View: We created a special view that shows details of patients over 50 years old.
-	Stored Procedures: We made tools to update patient ages under certain conditions and to retrieve detailed patient information while catching any errors that might happen.

  
## Project Impact on Business
-	Better Data Management: The new system makes it easier to store and access important healthcare data, keeping everything organized and reliable.
-	Improved Patient Care: By connecting patients with their specific doctors and departments, the system helps ensure that patients get the right care more efficiently.
-	Increased Efficiency: The ability to quickly run reports and find detailed information helps in making decisions and managing resources more effectively.
-	Room to Grow: The system is built to handle more data as the organization grows, so it will continue to be useful in the future.

  
## Next Steps
-	Integration: Look into connecting this database with other hospital systems to share information in real-time.
-	Advanced Analysis: Add tools to analyze the data and find patterns that can help improve care and operations.
-	Training: Teach staff how to use the new system effectively.
-	Continuous Improvement: Keep updating and improving the database to meet new needs and stay current with healthcare practices.

