import main

data = main.connect()
print(data)

date = '2018-04-12'
username = 'keksik'
lp_begin = 'AN'

select = "SELECT * FROM " \
         "Cars C JOIN " \
         "Custimer Cu JOIN Order O ON " \
         "Cu.username = '" + username + "' and O.StartTime between '" + date + "' and '" + date + " 23:59:59'" \
                                                                                                  "WHERE C.color = 'red' and SUBSTRING(c.LicensePlate,1,2)='" + lp_begin + "'"
