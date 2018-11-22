import random, string


def generate_string(length):
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(length))


def generate_number(length):
    letters = string.digits
    return ''.join(random.choice(letters) for i in range(length))


""" ***************** Cars ***************** """

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

personal_info = {'ssn': generate_number(8),
                 'name': ['Joo', 'Hui', 'Anna', 'Kate', 'Admin'],
                 'surname': ['Lee', 'Sasay', 'Blanshet', 'Loh'],
                 'e-mail': ['']
                 }
