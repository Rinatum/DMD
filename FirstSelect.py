import main
date = '2018-09-23'
username = 'Gfycyd'
color = 'red'


data = main.call_procedure('select_query_1', username, date, color)
print(data)

#PURE SQL
# CREATE DEFINER=`katya`@`%` PROCEDURE `select_query_1`(IN usename VARCHAR(45), IN indata VARCHAR(45), IN color VARCHAR(45), IN plate VARCHAR(5))
# BEGIN
# 	SELECT Vehicle.LicencePlate, Vehicle.Color, Vehicle.idCarModel FROM Customer JOIN `Order` ON `Order`.StartTime between indata and CONCAT(indata, ' ', '23:59:59') AND Customer.Username=username JOIN Vehicle WHERE Vehicle.Color = color AND SUBSTRING(Vehicle.LicensePlate, 1, 2) = plate;
# END