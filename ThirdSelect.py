import main
date = '2018-09-23'


data = main.call_procedure('select_query_3', date)
print(data)


#Pure SQL
# CREATE
# DEFINER = `katya` @ ` % ` PROCEDURE `
# select_query_3
# `(IN fist_day_of_the_week VARCHAR(45))
# BEGIN
#
# SELECT
# COUNT(*) * 100
# DIV((SELECT COUNT( *)
# FROM
# Vehicle) *7) AS
# Count, 'Morning'
# AS
# 'Time'
# FROM
# `Order`
# JOIN
# Vehicle
# WHERE((HOUR(StartTime) between 7 and 10)
# OR(HOUR(FinishTime)
# between
# 7 and 10))
# and ((DATE(StartTime) between fist_day_of_the_week and DATE(fist_day_of_the_week) + 7)
# OR(DATE(FinishTime)
# between
# fist_day_of_the_week and DATE(fist_day_of_the_week) + 7))
# GROUP
# BY
# Vehicle.licensePlate
#
# UNION
#
# SELECT
# COUNT(*) * 100
# DIV((SELECT COUNT( *)
# FROM
# Vehicle) *7) AS
# Count, 'Afternoon'
# AS
# 'Time'
# FROM
# `Order`
# JOIN
# Vehicle
# WHERE((HOUR(StartTime) between 12 and 14)
# OR(HOUR(FinishTime)
# between
# 12 and 14))
# and ((DATE(StartTime) between fist_day_of_the_week and DATE(fist_day_of_the_week) + 7)
# OR(DATE(FinishTime)
# between
# fist_day_of_the_week and DATE(fist_day_of_the_week) + 7))
# GROUP
# BY
# Vehicle.licensePlate
#
# UNION
#
# SELECT
# COUNT(*) * 100
# DIV((SELECT COUNT( *)
# FROM
# Vehicle) *7) AS
# Count, 'Evening'
# AS
# 'Time'
# FROM
# `Order`
# JOIN
# Vehicle
# WHERE((HOUR(StartTime) between 17 and 19)
# OR(HOUR(FinishTime)
# between
# 17 and 19))
# and ((DATE(StartTime) between fist_day_of_the_week and DATE(fist_day_of_the_week) + 7)
# OR(DATE(FinishTime)
# between
# fist_day_of_the_week and DATE(fist_day_of_the_week) + 7))
# GROUP
# BY
# Vehicle.licensePlate;
#
# END