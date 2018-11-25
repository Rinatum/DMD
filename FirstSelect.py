import main
import pymysql

date = '2018-04-12'
username = 'keksik'
lp_begin = 'AN'
color = 'red'

select = f"SELECT * FROM Customer JOIN PersonalInfo ON PersonalInfo.Usename='{username}' JOIN `Order` ON `Order`.StartTime between '{date}' and '{date} 23:59:59' JOIN Vehicle WHERE Vehicle.Color = '{color}'"

#SELECT * FROM Customer JOIN PersonalInfo ON PersonalInfo.Name='Rinat' JOIN `Order` ON `Order`.StartTime between '2017-01-29 14:54:00' and '2017-01-29 14:54:00' JOIN Vehicle WHERE Vehicle.Color = 'red'

data = main.execute(select)
print(data)

