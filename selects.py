import main


def query_select_1(user, date, color, plate):
    print(main.call_procedure('select_query_1', user, date, color, plate))


def query_select_2(date):
    default = '2018-09-03'
    if date == None:
        print(main.call_procedure('select_query_2', default))
    else:
        print(main.call_procedure('select_query_2', date))


def query_select_3():
    print(main.call_procedure('select_query_3'))


def query_select_4():
    print(main.call_procedure('select_query_4'))


def query_select_5():
    print(main.call_procedure('select_query_5'))


def query_select_6():
    print(main.call_procedure('select_query_6'))


def query_select_7():
    print(main.call_procedure('select_query_7'))


def query_select_8():
    print(main.call_procedure('select_query_8'))


def query_select_9():
    print(main.call_procedure('select_query_9'))


def query_select_10():
    print(main.call_procedure('select_query_10'))
