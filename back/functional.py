import base


def test1(*args):
    t_tuple = 1, 0, 'test1', 'test'
    return str(t_tuple)


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


def test5():
    t_tuple = 1, 0, 'test5', 'test'
    return str(t_tuple)


def test7():
    data = base.call_procedure('select_query_7')
    answ = ''
    for i in data:
        answ += str(i[0]) + ' --- ' + str(i[1]) + '\n'
    return answ


def test9(weeks):
    data = base.call_procedure('select_query_9',weeks)
    answ = 'WID   Detail   Amount \n'
    for i in data:
        answ += str(i[0]) + '   -----    ' + str(i[1]) + '   -----   ' + str(i[2]) +'\n'
    return answ
