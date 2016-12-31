-- 使用資料庫 [練習09]
USE 練習09
GO


/* ---------------- 1 ------------------- */

-- 邀請函

-- sql command
SELECT 姓名 AS 邀請名單, 地址
FROM 員工
UNION
SELECT 聯絡人, 地址
FROM 客戶
UNION
SELECT 聯絡人, 地址
FROM 合作廠商

-- store procedure
CREATE PROCEDURE InvitationList
AS
  SELECT 姓名 AS 邀請名單, 地址
  FROM 員工
  UNION
  SELECT 聯絡人, 地址
  FROM 客戶
  UNION
  SELECT 聯絡人, 地址
  FROM 合作廠商
GO

EXEC InvitationList

-- view
CREATE VIEW InvitationList_VIEW
AS
  SELECT 姓名 AS 邀請名單, 地址
  FROM 員工
  UNION
  SELECT 聯絡人, 地址
  FROM 客戶
  UNION
  SELECT 聯絡人, 地址
  FROM 合作廠商
GO

SELECT * FROM InvitationList_VIEW


/* ---------------- 2 ------------------- */

-- 訂單總數

-- sql command
SELECT 訂單編號, 下單日期, 客戶名稱,
       總數量 = (
         SELECT SUM(數量)
         FROM 訂購項目
         WHERE 訂單.訂單編號 = 訂購項目.訂單編號
       )
FROM 訂單, 客戶
WHERE 訂單.客戶編號 = 客戶.客戶編號
ORDER BY 1

-- store procedure
CREATE PROCEDURE OrdersReport
AS
  SELECT 訂單編號, 下單日期, 客戶名稱,
         總數量 = (
           SELECT SUM(數量)
           FROM 訂購項目
           WHERE 訂單.訂單編號 = 訂購項目.訂單編號
         )
  FROM 訂單, 客戶
  WHERE 訂單.客戶編號 = 客戶.客戶編號
  ORDER BY 1
GO

EXEC OrdersReport

-- view
CREATE VIEW OrdersReport_VIEW
AS
  SELECT 訂單編號, 下單日期, 客戶名稱,
         總數量 = (
           SELECT SUM(數量)
           FROM 訂購項目
           WHERE 訂單.訂單編號 = 訂購項目.訂單編號
         )
  FROM 訂單, 客戶
  WHERE 訂單.客戶編號 = 客戶.客戶編號
GO

SELECT *
FROM OrdersReport_VIEW
ORDER BY 1


/* ---------------- 3 ------------------- */

-- 共同產品

-- sql command
SELECT 產品名稱 AS 共同產品
FROM 旗旗公司
WHERE 產品名稱 IN (
  SELECT 產品名稱
  FROM 標標公司
)

-- store procedure
CREATE PROCEDURE BothProduct
AS
  SELECT 產品名稱 AS 共同產品
  FROM 旗旗公司
  WHERE 產品名稱 IN (
    SELECT 產品名稱
    FROM 標標公司
  )
GO

EXEC BothProduct

-- view
CREATE VIEW BothProduct_VIEW
AS
  SELECT 產品名稱 AS 共同產品
  FROM 旗旗公司
  WHERE 產品名稱 IN (
    SELECT 產品名稱
    FROM 標標公司
  )
GO

SELECT * FROM BothProduct_VIEW


/* ---------------- 4 ------------------- */

-- 書籍銷售量報表

-- sql command
SELECT 書籍名稱,
       ISNULL((
         SELECT SUM(數量)
         FROM 訂購項目
         WHERE 書籍編號 = 書籍.書籍編號), 0
       ) AS 銷售數量
FROM 書籍
ORDER BY 2 desc

-- store procedure
CREATE PROCEDURE BookSalesVolume
AS
  SELECT 書籍名稱,
         ISNULL((
           SELECT SUM(數量)
           FROM 訂購項目
           WHERE 書籍編號 = 書籍.書籍編號), 0
         ) AS 銷售數量
  FROM 書籍
  ORDER BY 2 desc
GO

EXEC BookSalesVolume

-- view
CREATE VIEW BookSalesVolume_VIEW
AS
  SELECT 書籍名稱,
         ISNULL((
           SELECT SUM(數量)
           FROM 訂購項目
           WHERE 書籍編號 = 書籍.書籍編號), 0
         ) AS 銷售數量
  FROM 書籍
GO

SELECT *
FROM BookSalesVolume_VIEW
ORDER BY 2 desc


/* ---------------- 5 ------------------- */

-- 兩公司相同產品價格比較 (使用 join)

-- sql command
SELECT 旗.產品名稱,
       旗.價格 AS 旗旗公司產品價格,
       標.價格 AS 標標公司產品價格
FROM 旗旗公司 AS 旗 JOIN 標標公司 AS 標 ON 旗.產品名稱 = 標.產品名稱

-- store procedure
CREATE PROCEDURE BookPriceComparison_JOIN
AS
  SELECT 旗.產品名稱,
         旗.價格 AS 旗旗公司產品價格,
         標.價格 AS 標標公司產品價格
  FROM 旗旗公司 AS 旗 JOIN 標標公司 AS 標 ON 旗.產品名稱 = 標.產品名稱
GO

EXEC BookPriceComparison_JOIN

-- view
CREATE VIEW BookPriceComparison_JOIN_VIEW
AS
  SELECT 旗.產品名稱,
       旗.價格 AS 旗旗公司產品價格,
       標.價格 AS 標標公司產品價格
  FROM 旗旗公司 AS 旗 JOIN 標標公司 AS 標 ON 旗.產品名稱 = 標.產品名稱
GO

SELECT * FROM BookPriceComparison_JOIN_VIEW


/* ---------------- 6 ------------------- */

-- 兩公司相同產品價格比較 (使用 where)

-- sql command
SELECT 旗.產品名稱,
       旗.價格 AS 旗旗公司產品價格,
       標.價格 AS 標標公司產品價格
FROM 旗旗公司 AS 旗, 標標公司 AS 標
WHERE 旗.產品名稱 = 標.產品名稱

-- store procedure
CREATE PROCEDURE BookPriceComparison_WHERE
AS
  SELECT 旗.產品名稱,
         旗.價格 AS 旗旗公司產品價格,
         標.價格 AS 標標公司產品價格
  FROM 旗旗公司 AS 旗, 標標公司 AS 標
  WHERE 旗.產品名稱 = 標.產品名稱
GO

EXEC BookPriceComparison_WHERE

-- view
CREATE VIEW BookPriceComparison_WHERE_VIEW
AS
  SELECT 旗.產品名稱,
         旗.價格 AS 旗旗公司產品價格,
         標.價格 AS 標標公司產品價格
  FROM 旗旗公司 AS 旗, 標標公司 AS 標
  WHERE 旗.產品名稱 = 標.產品名稱
GO

SELECT * FROM BookPriceComparison_WHERE_VIEW


/* ---------------- 7 ------------------- */

-- 計算各客戶出貨次數，並列出大於 1 的

-- sql command
SELECT 客戶名稱, COUNT(*) AS 出貨次數
FROM 出貨記錄
GROUP BY 客戶名稱
HAVING COUNT(*) >= 1

-- store procedure
CREATE PROCEDURE ShipmentsTimes
AS
  SELECT 客戶名稱, COUNT(*) AS 出貨次數
  FROM 出貨記錄
  GROUP BY 客戶名稱
  HAVING COUNT(*) >= 1
GO

EXEC ShipmentsTimes

-- view
CREATE VIEW ShipmentsTimes_VIEW
AS
  SELECT 客戶名稱, COUNT(*) AS 出貨次數
  FROM 出貨記錄
  GROUP BY 客戶名稱
  HAVING COUNT(*) >= 1
GO

SELECT * FROM ShipmentsTimes_VIEW


/* ---------------- 8 ------------------- */

-- 列出客戶的總訂購量，以及每次出貨平均數量

-- sql command
SELECT 客戶名稱,
       SUM(數量) AS 總數量,
       AVG(數量) AS 平均量
FROM 出貨記錄
GROUP BY 客戶名稱

-- store procedure
CREATE PROCEDURE ShipmentsSumAndAvg
AS
  SELECT 客戶名稱,
         SUM(數量) AS 總數量,
         AVG(數量) AS 平均量
  FROM 出貨記錄
  GROUP BY 客戶名稱
GO

EXEC ShipmentsSumAndAvg

-- view
CREATE VIEW ShipmentsSumAndAvg_VIEW
AS
  SELECT 客戶名稱,
         SUM(數量) AS 總數量,
         AVG(數量) AS 平均量
  FROM 出貨記錄
  GROUP BY 客戶名稱
GO

SELECT * FROM ShipmentsSumAndAvg_VIEW


/* ---------------- 9 ------------------- */

-- 列出所有有上級主管的員工，並顯示上級主管是誰

-- sql command
SELECT 員工.姓名,
       員工.職位,
       長官.姓名 AS 主管
FROM 員工 LEFT JOIN 員工 AS 長官 ON  員工.主管編號 = 長官.編號
WHERE 長官.姓名 IS NOT NULL
ORDER BY 3

-- store procedure
CREATE PROCEDURE SupervisorOfEmployee
AS
  SELECT 員工.姓名,
         員工.職位,
         長官.姓名 AS 主管
  FROM 員工 LEFT JOIN 員工 AS 長官 ON  員工.主管編號 = 長官.編號
  WHERE 長官.姓名 IS NOT NULL
  ORDER BY 3
GO

EXEC SupervisorOfEmployee

-- view
CREATE VIEW SupervisorOfEmployee_VIEW
AS
  SELECT 員工.姓名,
         員工.職位,
         長官.姓名 AS 主管
  FROM 員工 LEFT JOIN 員工 AS 長官 ON  員工.主管編號 = 長官.編號
  WHERE 長官.姓名 IS NOT NULL
GO

SELECT *
FROM SupervisorOfEmployee_VIEW
ORDER BY 3


/* ---------------- 10 ------------------- */

-- 列出前 3 貴的書籍

-- sql command
SELECT TOP 3 ROW_NUMBER() OVER(ORDER BY 價格 DESC) AS 價格排名,
       書籍名稱,
       價格,
       出版公司
FROM 書籍
ORDER BY 價格排名

-- store procedure
CREATE PROCEDURE BookPriceRank
AS
  SELECT TOP 3 ROW_NUMBER() OVER(ORDER BY 價格 DESC) AS 價格排名,
         書籍名稱,
         價格,
         出版公司
  FROM 書籍
  ORDER BY 價格排名
GO

EXEC BookPriceRank

-- view
CREATE VIEW BookPriceRank_VIEW
AS
  SELECT TOP 3 ROW_NUMBER() OVER(ORDER BY 價格 DESC) AS 價格排名,
         書籍名稱,
         價格,
         出版公司
  FROM 書籍
GO

SELECT *
FROM BookPriceRank_VIEW
ORDER BY 價格排名
