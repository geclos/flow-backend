# server-based syntax
# ======================
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:

server "flow.production", user: "deploy", roles: %w{app web}
# server "example.com", user: "deploy", roles: %w{app web}, other_property: :other_value
# server "db.example.com", user: "deploy", roles: %w{db}


# Configuration
# =============
# You can set any configuration variable like in config/deploy.rb
# These variables are then only loaded and set in this stage.
# For available Capistrano configuration variables see the documentation page.
# http://capistranorb.com/documentation/getting-started/configuration/
# Feel free to add new variables to customise your setup.
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets}
set :linked_files, %w{config/database.yml .env.production}

# Puma config
set :puma_threads,    [4, 16]
set :puma_workers,    2


# Custom SSH Options
# ==================
 set :ssh_options, {
    keys: %w(~/.ssh/id_rsa),
    forward_agent: true,
    auth_methods: %w(publickey)
 }
