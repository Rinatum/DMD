import main

data = main.call_procedure('select_query_9')
print(data)


#PURE SQL
#CREATE DEFINER=`katya`@`%` PROCEDURE `select_query_9`()
# BEGIN
# 	SELECT C.WorkshopID, MAX(C.AvAmount) As Average, C.DetailName
# 		FROM
# 		#3
# 		(SELECT B.WorkshopID, B.DetailID, B.DetailName, (SUM(B.Amount) DIV (((SELECT MAX(YEARWEEK(Date)) FROM mydb.ProvidingsHistory) - (SELECT MIN(YEARWEEK(Date)) FROM mydb.ProvidingsHistory)))) AS AvAmount
# 		 FROM
#
# 			#2
# 			(SELECT A.WorkshopID, A.Week, SUM(A.Amount) AS Amount, A.DetailName, A.DetailID
# 			FROM
#
# 			#1
# 			(SELECT
#
# 				ProvidingsHistory.idBuilding AS WorkshopID, ProvidingsHistory.Amount AS Amount, YEARWEEK(ProvidingsHistory.Date) As Week,
# 				DetailType.idDetailsList AS DetailID, DetailType.Name As DetailName
#
# 				FROM DetailType
# 				JOIN Provider_has_DetailType ON DetailType.idDetailsList = Provider_has_DetailType.idDetailList
# 				JOIN Provider ON Provider.idProvider = Provider_has_DetailType.idProvider
# 				JOIN ProvidingsHistory ON ProvidingsHistory.idProvider = Provider.idProvider
# 				ORDER BY Week) AS A #1
#
# 			GROUP BY A.WorkshopID, A.Week, A.DetailID ORDER BY A.WorkshopID)  AS B #2
# 		GROUP BY B.WorkshopID, B.Week, B.DetailID ORDER BY B.WorkshopID) AS C #3
# 	GROUP BY C.WorkshopID;
# END