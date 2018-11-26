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


def test3():
    t_tuple = 1, 0, 'test3', 'test'
    return str(t_tuple)


def test4():
    t_tuple = 1, 0, 'test4', 'test'
    return str(t_tuple)


def test5():
    t_tuple = 1, 0, 'test5', 'test'
    return str(t_tuple)
