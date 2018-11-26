import base


def test1(username, date, color, plate):
    data = base.call_procedure('select_query_1', username, date, color,plate)
    answ = 'LicensePlate:\n'
    for i in data:
        answ += str(i[0]) + '\n'
    return answ


def test2(date):
    data = base.call_procedure('select_query_2', date)
    answ = ''
    for i in data:
        answ += str(i[0]) + ' --- ' + str(i[1]) + '\n'
    return answ


def test3(date):
    data = base.call_procedure('select_query_3', date)
    answ = ''
    for i in data:
        answ += str(i[0]) + ' --- ' + str(i[1]) + '\n'
    return answ


def test4():
    t_tuple = 1, 0, 'test4', 'test'
    return str(t_tuple)


def test5(date):
    data = base.call_procedure('select_query_5', date)
    answ = ''
    for i in data:
        answ += str(i[0]) + '\n'
    return answ

def test6():
    data = base.call_procedure('select_query_6_start')
    answ = 'OrdersAmount#1  PickUpPoint  Time  OrderAmount#2  Destination  Time#2'
    for i in data:
        answ += str(i[0]) + '   -----    ' + str(i[1]) + '   -----   ' + str(i[2]) + '   -----   ' + str(
            i[3]) + '   -----   ' + str(i[4]) + '   -----   ' + str(i[5]) + '\n'
    return answ

def test7():
    data = base.call_procedure('select_query_7')
    data = base.call_procedure('select_query_7')
    answ = ''
    for i in data:
        answ += str(i[0]) + ' --- ' + str(i[1]) + '\n'
    return answ



def test9(weeks):
    data = base.call_procedure('select_query_9',weeks)
    #answ = 'WID   Detail   Amount \n'
    answ  =''
    for i in data:
        answ += 'Worhsop ' + str(i[0]) +' most often requires '+str(i[1])+' (about '+str(i[2])+' every week on average). \n'
        #answ += str(i[0]) + '   -----    ' + str(i[1]) + '   -----   ' + str(i[2]) +'\n'
    return answ
