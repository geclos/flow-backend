# Constants
# =========
PASSWORD='papapa33'

# Companies
# =========
puts "creating companies"
first_company = Company.create!(
  name: 'Acme Inc',
  country: 'es',
  sector: 'information_technology',
  size: 'medium'
)

second_company = Company.create!(
  name: 'Flow Inc',
  country: 'es',
  sector: 'information_technology',
  size: 'medium'
)

# Users
# =====
puts "creating users"
paco = User.create!(
  email: 'paco@merlo.com',
  first_name: 'Paco',
  last_name: 'Merlo',
  password: PASSWORD,
  company: first_company
)

hellen = User.create!(
  email: 'hellen@flow.com',
  first_name: 'Hellen',
  last_name: 'The Admin',
  password: PASSWORD,
  company: second_company
)

# Signups
# =======
puts "creating signups"
Signup.create!(
  email: 'paco@merlo.com',
  first_name: 'Paco',
  last_name: 'Merlo',
  host: 'localhost:3000',
  user: paco
)

Signup.create!(
  email: 'hellen@flow.com',
  first_name: 'Hellen',
  last_name: 'The Admin',
  host: 'localhost:3000',
  user: hellen
)

# Employees
# =========
puts "creating employees"
Core::Employee.create!(user: paco)
Core::Employee.create!(user: hellen)
