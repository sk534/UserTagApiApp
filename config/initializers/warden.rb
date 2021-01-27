
Rails.application.config.middleware.use RailsWarden::Manager do |manager|
  manager.default_strategies :authentication_token
  manager.failure_app = UnauthenticatedController
end