USE [NTUB_DB]
GO


-- 第一題
SELECT
	[stdID] AS StudentID,
	[stdName] AS 'Student Name',
	修課科目數 = (
		SELECT COUNT(*)
		FROM [dbo].[studentCourse]
		WHERE [studentCourse].[studentID] = [StudentData].[stdID]
	)
FROM [dbo].[StudentData]
ORDER BY 1


-- 第二題
CREATE PROCEDURE SP_Q1_10256039
	@std_id char(4)
AS
	SELECT
		[stdID] AS StudentID,
		[stdName] AS 'Student Name',
		修課科目數 = (
			SELECT COUNT(*)
			FROM [dbo].[studentCourse]
			WHERE [studentCourse].[studentID] = [StudentData].[stdID]
		)
	FROM [dbo].[StudentData]
	WHERE [StudentData].[stdID] = @std_id
	ORDER BY 1
GO

-- procedure test
EXEC SP_Q1_10256039 '001'
EXEC SP_Q1_10256039 '031'
EXEC SP_Q1_10256039 '081'


-- 第三題
SELECT
	[courseBasicData].[courseID] AS 課號,
	[courseName] AS 課名,
	MAX([midScore]) AS 期中最高,
	MIN([midScore]) AS 期中最低,
	AVG([midScore]) AS 期中均分
FROM 
	[dbo].[studentCourse] JOIN [dbo].[courseBasicData]
	ON [studentCourse].[courseID] = [courseBasicData].[courseID]
GROUP BY [courseBasicData].[courseID], [courseName]
ORDER BY [courseBasicData].[courseID]


-- 第四題
CREATE PROCEDURE SP_Q3_10256039
	@courseID nvarchar(10)
AS
	SELECT
		[courseBasicData].[courseID] AS 課號,
		[courseName] AS 課名,
		MAX([midScore]) AS 期中最高,
		MIN([midScore]) AS 期中最低,
		AVG([midScore]) AS 期中均分
	FROM 
		[dbo].[studentCourse] JOIN [dbo].[courseBasicData]
		ON [studentCourse].[courseID] = [courseBasicData].[courseID]
	WHERE [studentCourse].[courseID] = @courseID
	GROUP BY [courseBasicData].[courseID], [courseName]
	ORDER BY [courseBasicData].[courseID]
GO

-- procedure test
EXEC SP_Q3_10256039 '50311011'
EXEC SP_Q3_10256039 '50336431'
EXEC SP_Q3_10256039 '50346700'