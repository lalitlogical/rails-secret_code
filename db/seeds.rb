# Seed admin user
admin = User.find_or_initialize_by(email: 'lalitkumarkat@gmail.com')
admin.attributes = {first_name: 'Lalit', last_name: 'Maurya', password: 'admin1234'}
admin.save!

admin.add_role :admin
