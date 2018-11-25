
import sqlite3
import config
import main
import pymysql
import random as rm
import config
j = 0
license_plates = [4, 5]

for i in range(0, 24):
    time = pymysql.Timestamp(2018, 9, 3, i, 5)
    num = rm.choice(license_plates)
    main.execute('INSERT INTO ChargingHistory(LicencePlate, StartTime, FinishTime, ChargingStation_idBuilding) '
                 'VALUES (%(p)s, %(p)s, %(p)s, 2);', rm.choice(license_plates), time, time.replace(minute=time.minute + 50), commit=True)
