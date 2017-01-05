USE [NTUB_DB]
GO


-- 第一題
SELECT
	[smtr] AS 開課學期別,
	[courseID] AS 課程編號,
	[deptName] AS 開課科系別,
	[courseYear] AS 開課年級,
	[courseClass] AS 開課班級,
	[teacherID] AS 授課教師,
	[courseCredit] AS 學分數
FROM [dbo].[courseData], [dbo].[DepartmentData]
WHERE [courseDept] = [deptNo]
ORDER BY [courseDept]


-- 第二題
CREATE VIEW V1_2_10256039
AS
	SELECT
		[smtr] AS 開課學期別,
		[courseID] AS 課程編號,
		[deptName] AS 開課科系別,
		[courseYear] AS 開課年級,
		[courseClass] AS 開課班級,
		[teacherID] AS 授課教師,
		[courseCredit] AS 學分數
	FROM [dbo].[courseData], [dbo].[DepartmentData]
	WHERE [courseDept] = [deptNo]
GO

-- TEST VIEW
SELECT * 
FROM V1_2_10256039, [dbo].[courseData]
ORDER BY [courseDept]


-- 第三題
SELECT
	[deptNo] AS 科系別,
	[teacherData].[teacherID],
	[teacherName],
	COUNT([courseID]) AS 課程筆數,
	ISNULL(SUM([courseCredit]), 0) AS 學分總數
FROM 
	[dbo].[teacherData] LEFT JOIN [dbo].[courseData]
	ON [teacherData].[teacherID] = [courseData].[teacherID]
GROUP BY [deptNo], [teacherData].[teacherID], [teacherName]
ORDER BY 1


-- 第四題
CREATE VIEW V3_2_10256039
AS
	SELECT
		[deptNo] AS 科系別,
		[teacherData].[teacherID],
		[teacherName],
		COUNT([courseID]) AS 課程筆數,
		ISNULL(SUM([courseCredit]), 0) AS 學分總數
	FROM 
		[dbo].[teacherData] LEFT JOIN [dbo].[courseData]
		ON [teacherData].[teacherID] = [courseData].[teacherID]
	GROUP BY [deptNo], [teacherData].[teacherID], [teacherName]
GO

-- TEST VIEW
SELECT *
FROM V3_2_10256039
ORDER BY 1


-- 第五題
SELECT
	[smtr] AS 開課學期,
	[courseData].[courseID] AS 課程編號,
	[courseName] AS 課程名稱,
	[deptName] AS 開課科系,
	[courseYear] AS 開課年級,
	[courseClass] AS 開課班別,
	[teacherName] AS 授課教師,
	[courseCredit] AS 學分數
FROM [dbo].[courseData] 
	JOIN [dbo].[courseBasicData]
	ON [courseData].[courseID] = [courseBasicData].[courseID]
	JOIN [dbo].[DepartmentData]
	ON [courseData].[courseDept] = [DepartmentData].[deptNo]
	JOIN [dbo].[teacherData]
	ON [courseData].[teacherID] = [teacherData].[teacherID]
ORDER BY [courseData].[courseID]