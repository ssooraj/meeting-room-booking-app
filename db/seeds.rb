p admin = Role.where(name: 'admin').first_or_create
p employee =  Role.where(name: 'employee').first_or_create

p Admin.first_or_create(email: 'admin@booking.com', password: 'Password@123',
                        first_name: 'Room', last_name: 'Admin', role_id: 1)
