# Constants
# =========
PASSWORD='papapa33'

# Companies
# =========
company = Company.create!(
  name: 'Acme Inc',
  country: 'es',
  sector: 'information_technology',
  size: 'medium'
)

# Users
# =====
user = User.create!(
  email: 'paco@merlo.com',
  first_name: 'Paco',
  last_name: 'Merlo',
  password: PASSWORD,
  company: company
)

# Signups
# =======
Signup.create!(
  email: 'paco@merlo.com',
  first_name: 'Paco',
  last_name: 'Merlo',
  user: user
)
