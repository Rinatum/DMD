import pymysql

DB_HOST = 'dmdproject.c6oqyq6orxxy.us-east-1.rds.amazonaws.com'
DB_USER = 'katya'
DB_PASSWORD = 'princess123'
DB_NAME = 'mydb'
DB_PORT = '3306'
paramstyle = '%s'


def connect():
    return pymysql.connect(DB_HOST, DB_PORT, DB_USER, DB_PASSWORD, DB_NAME, use_unicode=True, charset="utf8")


def execute(sql, *args, commit=False):
    db = connect()
    cur = db.cursor()
    cur.execute(sql % {"p": paramstyle}, args)
    if commit:
        db.commit()
        db.close()
    else:
        ans = cur.fetchall()
        db.close()
        return ans
