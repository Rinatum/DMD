import main

data = main.call_procedure('select_query_7')
print(data)

#PURE SQL
# CREATE DEFINER=`katya`@`%` PROCEDURE `select_query_7`()
# BEGIN
# 	DECLARE count INT default 0;
#     SET count = (SELECT COUNT(*) FROM Vehicle);
#     SET count = count * 10 DIV 100;
# 	SELECT * FROM
# 	(SELECT Vehicle.licensePlate, COUNT(*) AS Orders
# 	FROM `Order` JOIN Vehicle ON `Order`.idVehicle = Vehicle.idVehicleP
#     WHERE `Order`.StartTime >= MONTH(DATE_SUB(NOW(), INTERVAL 3 MONTH))
#     group by Vehicle.licensePlate) AS A
# 	ORDER BY A.Orders limit count;
#
# END