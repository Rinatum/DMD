import random, string


def generate_string(length):
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(length))


def generate_number(length):
    letters = string.digits
    return ''.join(random.choice(letters) for i in range(length))


""" ***************** Cars ***************** """


def get_random_email():
    return generate_string(2) + generate_number(3) + generate_string(1) + '18'


cars = {'colors': ['black', 'white', 'red', 'green', 'blue', 'orange'],
        'socket_types': [0, 1, 2],
        'models': ['lada', 'bmw', 'mercedes', 'mitsubishi', 'hyundai', 'tesla'],
        'availability': 0,
        'breakdowns': 0,
        'charge_level': range(0, 100),
        'manager': '                ',
        }

""" ***************** Customers ***************** """

customers = {'username': generate_string(8),
             'payment_Info': generate_number(16),
             'Location': [-1]}  # get_location() }

""" ***************** Personal Info ***************** """

personal_info = {'ssn': generate_number(8),
                 'name': ['Joo', 'Hui', 'Anna', 'Kate', 'Admin'],
                 'surname': ['Lee', 'Sasay', 'Blanshet', 'Loh'],
                 'e-mail': [generate_string(6) + '@mail.ru', generate_string(6) + '@gmail.com',
                            generate_string(6) + '@outlook.com'],
                 'phone_number': "+7" + generate_string(10)
                 }

""" ***************** EmployeeClass ***************** """

employee_class = {'id': generate_number(1),
                  'class': ['Manager', 'Director', 'Developer', 'Mechanic']
                  }

""" ***************** Employees ***************** """

employees = {'id': generate_number(8),
             'id_personal_info': 'id of personal_info',
             'id_employee_class': 'id of employee_class'
             }

""" ***************** Provider ***************** """

provider = {'id_provider': generate_number(8),
            'id_location': 'id of location',
            'id_personal_info': 'id of personal_info'
            }

""" ***************** Provider_has_Detail ***************** """

""" ***************** Employers ***************** """

""" ***************** Detail_type ***************** """

detail_type = {''}
""" ***************** Buildings & ChargingStation ***************** """


def get_id():
    return random.randint(0, 1000)


def get_charging_time():
    return random.randint(20, 50)


def get_cost():
    return random.randint(200, 1000)


