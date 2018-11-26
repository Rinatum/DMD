from back import base


def select1(username, date, color, plate):
    data = base.call_procedure('select_query_1', username, date, color, plate)
    answ = 'LicensePlate:\n'
    for i in data:
        answ += str(i[0]) + '\n'
    return answ


def select2(date):
    data = base.call_procedure('select_query_2', date)
    answ = ''
    for i in data:
        answ += str(i[0]) + ' --- ' + str(i[1]) + '\n'
    return answ


def select3(date):
    data = base.call_procedure('select_query_3', date)
    answ = ''
    for i in data:
        answ += str(i[0]) + ' --- ' + str(i[1]) + '\n'
    return answ


def select4():
    username, certain_year, certain_month = data.split(' ')[:3]
    orders = base.call_procedure('select_query_4', username, certain_year, certain_month)
    answ = 'username --- StartTime --- OrderId\n'
    for i in orders:
        answ += str(i[0]) + ' --- ' + str(i[1]) + ' --- ' + str(i[2]) + '\n'
    return 'Duplicated orders:' + '\n' + answ


def select5(date):
    data = base.call_procedure('select_query_5', date)
    answ = ''
    for i in data:
        answ += str(i[0]) + '\n'
    return answ


def select6():
    data = base.call_procedure('select_query_6_start')
    data2 = base.call_procedure('select_query_6_destination')
    answ = 'OrdersAmount  PickUpPoint  Time \n'
    for i in data:
        answ += str(i[0]) + '   -----    ' + str(i[1]) + '   -----   ' + str(i[2]) + '\n'
    answ += '\nOrdersAmount  Destination  Time \n'
    for i in data2:
        answ += str(i[0]) + '   -----    ' + str(i[1]) + '   -----   ' + str(i[2]) + '\n'

    return answ


def select7():
    data = base.call_procedure('select_query_7')
    data = base.call_procedure('select_query_7')
    answ = ''
    for i in data:
        answ += str(i[0]) + ' --- ' + str(i[1]) + '\n'
    return answ


def select8(date):
    data = base.call_procedure('select_query_8', date)
    answ = ''
    for i in data:
        answ += str(i[0]) + ' --- ' + str(i[1]) + '\n'
    return answ


def select9(weeks):
    data = base.call_procedure('select_query_9', weeks)
    answ = ''
    for i in data:
        answ += 'Worhsop ' + str(i[0]) + ' most often requires ' + str(i[1]) + ' (about ' + str(
            i[2]) + ' every week on average). \n'
        # answ += str(i[0]) + '   -----    ' + str(i[1]) + '   -----   ' + str(i[2]) +'\n'
    return answ


def select10(date1, date2):
    data = base.call_procedure('select_query_10', date1, date2)
    answ = ''
    for i in data:
        answ += str(i[0]) + ' --- ' + str(i[1]) + '\n'
    return answ
