import main
date = '2018-09-23'
username = 'Gfycyd'
color = 'red'


data = main.call_procedure('select_query_1', username, date, color)
print(data)