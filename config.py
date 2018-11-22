import random, string


def generate_string(length):
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(length))


def generate_number(length):
    letters = string.digits
    return ''.join(random.choice(letters) for i in range(length))


""" ***************** Vehicle ***************** """

cars = {
        'socket_types': [0, 1, 2],
        'models': ['lada', 'bmw', 'mercedes', 'mitsubishi', 'hyundai', 'tesla'],
        'availability': 0,
        'breakdowns': 0,
        'charge_level': range(0, 100),
        'color': ['black', 'white', 'red', 'green', 'blue', 'orange'],
        'manager': '                ',
        }

""" ***************** Customers ***************** """

customers = {'username': generate_string(8),
             'payment_Info': generate_number(16),
             'location': 'id of location'
             }

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

employees = {'id_employee': generate_number(8),
             'id_personal_info': 'id of personal_info',
             'id_employee_class': 'id of employee_class'
             }

""" ***************** Provider ***************** """

provider = {'id_provider': generate_number(8),
            'id_location': 'id of location',
            'id_personal_info': 'id of personal_info'
            }

""" ***************** Provider_has_Detail ***************** """

provider_has_detail = {'id_provider': 'id of provider',
                       'id_detail_list': 'id of detailList',
                       'price': generate_number(3)
                       }

""" ***************** DetailType ***************** """

detail_type = {'id_detail_list': generate_number(3),
               'name': ['bumper', 'battery', 'wheels', 'wipers', 'alternator belt', 'spark plugs', 'fuse']
               }

""" ***************** DetailRequest ***************** """

detail_request = {'id_detail_request': generate_number(4),
                  'id_provider': 'id of provider',
                  'id_employee': 'id of employee',
                  'id_details_list': 'id of id_details_list'
                  }

""" ***************** ProvidingsHistory ***************** """

providing_history = {'idProviding': generate_number(4),
                     'id_provider': 'id of provider',
                     'id_workshop': 'id of workshop',
                     'amount': generate_number(1)
                     }


