Rails.application.configure do
  config.hosts = Rails.application.config_for(:hosts)
end
