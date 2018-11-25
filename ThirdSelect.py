


#Pure SQL
#SELECT COUNT(*)  AS Count, 'Morning' AS 'Time' FROM Vehicle JOIN `Order`
# WHERE `Order`.StartTime >= '2018-09-23 7:00:00' and `Order`.FinishTime <= '2018-09-23 10:00:00'
# 		or
# 	  `Order`.StartTime >= '2018-09-24 7:00:00'+1 and `Order`.FinishTime <= '2018-09-23 10:00:00'+1
#
# 		or
# 	  `Order`.StartTime >= '2018-09-24 7:00:00'+2 and `Order`.FinishTime <= '2018-09-23 10:00:00'+2
#
# 		or
# 	  `Order`.StartTime >= '2018-09-24 7:00:00'+3 and `Order`.FinishTime <= '2018-09-23 10:00:00'+3
#
# 		or
# 	  `Order`.StartTime >= '2018-09-24 7:00:00'+4 and `Order`.FinishTime <= '2018-09-23 10:00:00'+4
#
# 		or
# 	  `Order`.StartTime >= '2018-09-24 7:00:00'+5 and `Order`.FinishTime <= '2018-09-23 10:00:00'+5
#
# 		or
# 	  `Order`.StartTime >= '2018-09-24 7:00:00'+6 and `Order`.FinishTime <= '2018-09-23 10:00:00'+6
#
# UNION
# SELECT COUNT(*)  AS Count, 'Afternoon' AS 'Time' FROM Vehicle JOIN `Order` WHERE `Order`.StartTime >= '2018-09-23 12:00:00' and `Order`.FinishTime < '2018-09-23 14:00:00'
# UNION
# SELECT COUNT(*)  AS Count, 'Evening' AS 'Time' FROM Vehicle JOIN `Order` WHERE `Order`.StartTime >= '2018-09-23 17:00:00' and `Order`.FinishTime < '2018-09-23 18:00:00'
