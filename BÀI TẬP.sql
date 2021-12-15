--CHUNG
SELECT TOP 10* FROM Sau
-- TOP NGUỒN
	--KIA
		--CHUNG
SELECT "NGUỒN", 
	(CASE 
		WHEN "Nguồn" LIKE '%BÁO%' 
			THEN N'KÊNH TRUYỀN THỐNG'
		ELSE
			N'MẠNG XÃ HỘI'
		END ) AS NGUON
	INTO "TOP NGUỒN KIA" 
	FROM "Sau"
	WHERE "Thương hiệu" LIKE '%KIA%'

SELECT "NGUON" , COUNT ("NGUON") 
FROM [TOP NGUỒN KIA]
	GROUP BY "NGUON"

		--MẠNG XÃ HỘI
SELECT "NGUỒN" , COUNT (NGUỒN) 'ĐẾM NGUỒN'
FROM Sau
	WHERE "Thương hiệu" LIKE '%KIA%' AND Nguồn <> '%BÁO%'
	GROUP BY "NGUỒN"
	
--TOP NGUỒN
	--KIA

UPDATE Sau
	SET PHẦN = REPLACE (PHẦN , ',', '')
		--BÁO CHÍ
SELECT top 10 "TÊN MIỀN" , COUNT("TÊN MIỀN") 'lượng thảo luận'
FROM "Sau" 
	WHERE PHẦN = '' AND "Nguồn" LIKE '%BÁO%'
	GROUP BY [Tên miền]
	ORDER BY COUNT("TÊN MIỀN") DESC
		
		--DIỄN ĐÀN
SELECT top 10 "TÊN MIỀN" , COUNT("TÊN MIỀN") 'lượng thảo luận'
FROM "Sau" 
	WHERE PHẦN = '' AND Nguồn LIKE N'%DIỄN ĐÀN%'
	GROUP BY [Tên miền]
	ORDER BY [lượng thảo luận] DESC
		
		--FACEBOOK
SELECT top 10 "TIÊU ĐỀ" , SUM ("LIKE"+"COMMENT"+"SHARE") 'lượng thảo luận'
FROM "Sau" 
	WHERE PHẦN='' AND [Tên miền] LIKE '%FACEBOOK%'
	GROUP BY [Tiêu đề]
	ORDER BY "lượng thảo luận" DESC

		--YOUTUBE
SELECT top 10 "TIÊU ĐỀ" , SUM ("LIKE"+"COMMENT"+"SHARE") 'lượng thảo luận'
FROM "Sau" 
	WHERE PHẦN='' AND [Tên miền] LIKE '%YOUTUBE%'
	GROUP BY [Tiêu đề]
	ORDER BY "lượng thảo luận" DESC
		
--TOP ĐỀ CẬP
--CHUNG
SELECT TOP 10* FROM "LABEL"
	--KIA
		--CHÂN DUNG ĐỀ CẬP
			--SEDAN
SELECT TOP 4 "KHÍA CẠNH" , COUNT ("KHÍA CẠNH") 'LƯỢNG ĐỀ CẬP' INTO "KHÍA CẠNH"
FROM "LABEL"
	WHERE PHẦN LIKE '%SEDAN%'
	GROUP BY "KHÍA CẠNH"
	ORDER BY "LƯỢNG ĐỀ CẬP" DESC

INSERT INTO "KHÍA CẠNH"
VALUE ('NỘI DUNG CÒN LẠI', COUNT ("KHÍA CẠNH") FROM "LABEL" WHERE PHẦN LIKE '%SEDAN%'-SUM ("LƯỢNG ĐỀ CẬP") FROM "KHÍA CẠNH")

--
