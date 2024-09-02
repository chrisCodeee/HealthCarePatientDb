CREATE DATABASE HealthcarePatientDb
USE HealthcarePatientDb

CREATE TABLE Patient(PatientID NVARCHAR(4) PRIMARY KEY, PatientName NVARCHAR(20), Age INT, Gender NVARCHAR(1), DoctorID INT, StateID INT IDENTITY(101,1))
CREATE TABLE Doctor(DoctorID INT IDENTITY(1,1), DoctorName NVARCHAR(20), Specialization NVARCHAR(20))
CREATE TABLE StateMaster(StateID INT IDENTITY(101,1), StateName NVARCHAR(20))
CREATE TABLE Department(DepartmentID INT, DepartmentName NVARCHAR(20))


INSERT INTO Patient
VALUES('PT01', 'John Doe', 45, 'M', 1),
('PT02', 'Jane Smith', 30, 'F', 2),
('PT03', 'Mary Johnson', 60, 'F', 3),
('PT04', 'Michael Brown', 50, 'M', 4),
('PT05', 'Patricia Davis', 40, 'F', 1),
('PT06', 'Robert Miller', 55, 'M', 2),
('PT07', 'Linda Wilson', 35, 'F', 3),
('PT08', 'William Moore', 65, 'M', 4),
('PT09', 'Barbara Taylor', 28, 'F', 1),
('PT10', 'James Anderson', 70, 'M', 2)

INSERT INTO Doctor
VALUES('Dr. Smith', 'Cardiology'),
('Dr. Adams', 'Neurology'),
('Dr. White', 'Orthopedics'),
('Dr. Johnson', 'Dermatology')

INSERT INTO StateMaster
VALUES('Lagos'), ('Abuja'), ('kano'), ('Delta'), ('Edo'), ('Ibadan'), ('Enugu'), ('Kaduna'), ('Ogun'), ('Anambra')

INSERT INTO Department
VALUES(1, 'Cardiology'),
(2, 'Neurology'),
(3, 'Orthopedics'),
(4, 'Dermatology')

--------------------------------- (1) Fetch patients with the same age. -----------------------------------------------------------
SELECT PatientName, Age FROM Patient
WHERE Age IN(
SELECT DISTINCT Age FROM Patient)

---------------------------------- (2) Find the second oldest patient and their doctor and department. --------------------------------
SELECT P.PatientName, P.Age, D.DoctorName, Dept.DepartmentName FROM Patient P
JOIN Doctor D ON P.DoctorID = D.DoctorID
JOIN Department Dept ON P.DoctorID = Dept.DepartmentID
ORDER BY Age DESC
OFFSET 1 ROW
FETCH NEXT 1 ROW ONLY

-------------------------------------- (3) Get the maximum age per department and the patient name.----------------------------------------
SELECT P.PatientName, D.DepartmentName, P.Age AS Max_Age FROM Patient P
JOIN Department D ON P.DoctorID = D.DepartmentID
WHERE P.Age IN(
SELECT MAX(Age) FROM Patient GROUP BY DoctorID)

-------------------------------------- (4) Doctor-wise count of patients sorted by count in descending order. ------------------------------

--------------------------- (5) Fetch only the first name from the PatientName and append the age. ------------------------------------------
SELECT CONCAT(LEFT(PatientName, CHARINDEX(' ', PatientName)-1), '_', Age) AS FirstName_Age FROM Patient

----------------------------- (6) Fetch patients with odd ages. ----------------------------------------------------------------------------
SELECT PatientName, Age FROM Patient
WHERE Age % 2 != 0

------------------------------------------ (7) Create a view to fetch patient details with an age greater than 50. ------------------------
CREATE VIEW VW_Patient_Details AS
SELECT * FROM Patient
WHERE Age > 50

SELECT * FROM VW_Patient_Details

------------------------------------------ (8) Create a procedure to update the patient's age by 10% where the department is 'Cardiology' 
------------------------------------------------ and the doctor is not 'Dr. Smith'. ----------------------------------------------------------
CREATE PROCEDURE Update_Patient_Age

AS
BEGIN
	UPDATE P
	SET Age = Age * 1.1
	FROM Patient P
	JOIN Department D ON P.DoctorID = D.DepartmentID
	JOIN Doctor Doc ON P.DoctorID = Doc.DoctorID
	WHERE D.DepartmentName = 'Cardiology' AND Doc.DoctorName = 'Dr. Smith'
END
GO

EXEC Update_Patient_Age

--------------------------------- (9) Create a stored procedure to fetch patient details along with their doctor, department, 
------------------------------------    and state, including error handling. -------------------------------------------------------------------
CREATE PROCEDURE Fetch_Patient_Details
AS
BEGIN
	BEGIN TRY
		SELECT * FROM Patient P
		JOIN Doctor Doc ON P.DoctorID = Doc.DoctorID
		JOIN Department D ON P.DoctorID = D.DepartmentID
		JOIN StateMaster SM ON P.StateID = SM.StateID
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000);
		SET @ErrorMessage = ERROR_MESSAGE();
		RAISERROR (@ErrorMessage, 16,1);
	END CATCH
END
GO

EXEC Fetch_Patient_Details
