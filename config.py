import random, string


def generate_string(length):
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(length))


def generate_number(length):
    letters = string.digits
    return ''.join(random.choice(letters) for i in range(length))


def get_licence_plate():
    return generate_string(2) + generate_number(3) + generate_string(1) + '18'


""" ***************** Vehicle ***************** """

vehicle = {
    'licence_plate': get_licence_plate(),
    'id_location': 'id of location',
    'id_socket_type': 'id of socket type',
    'id_car_model': 'id of car_model',
    'id_car_status': 'id of car_stastus',
    'id_employee': 'id of employee',
    'charge_level': range(0, 100),
    'color': ['black', 'white', 'red', 'green', 'blue', 'orange'],
}

""" ***************** Car Status ***************** """

car_status = {
    'id_car_status': generate_number(1),
    'status': ['Ride to Customer', 'Execute order', 'Free', 'Charges', 'Repair', 'Broken']
}

""" ***************** Car Model ***************** """

car_model = {
    'id_car_model': generate_number(3),
    'model': ['lada', 'bmw', 'mercedes', 'mitsubishi', 'hyundai', 'tesla']
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

""" ***************** Buildings & ChargingStation ***************** """


def get_id():
    return random.randint(0, 1000)


def get_charging_time():
    return random.randint(20, 50)


def get_cost():
    return random.randint(200, 1000)


""" ***************** ProvidingsHistory ***************** """

providing_history = {'idProviding': generate_number(4),
                     'id_provider': 'id of provider',
                     'id_workshop': 'id of workshop',
                     'amount': generate_number(1)
                     }

""" ***************** Vending ***************** """
vandings = {'capacity': range(20)}

""" ***************** Product list ***************** """

# get_id()
products = {'name': ['chokolate', 'marmelade', 'coca-cola', 'fanta', 'waflya'],
            'price': 100}
