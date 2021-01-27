# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
a=User.create(first_name:"Admin",last_name:"Admin",email:"admin@example.com",password:"password",password_confirmation:"password",
    authentication_token:Devise.friendly_token,is_admin:true,username:"admin")

a=User.create(first_name:"Satish",last_name:"Kumar",email:"sk@example.com",password:"password",password_confirmation:"password",
        is_admin:false,username:"sk")