import random, string

def generate_string(length):
   letters = string.ascii_lowercase
   return ''.join(random.choice(letters) for i in range(length))

def generate_number(length):
        letters = string.digits
        return ''.join(random.choice(letters) for i in range(length))

Customer = {'username': generate_string(8),
            'payment_Info': generate_number(16),
            'Location': [-1] } #get_location() }


personal_info = {'ssn': generate_number(8),
                 'name': ['Joo', 'Hui', 'Anna', 'Kate' , 'Admin'],
                  'surname': ['Lee','Sasay','Blanshet','Loh'],
                  'e-mail': ['']
                 }