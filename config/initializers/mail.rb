Rails.application.configure do
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = ENV["RAILS_ENV"] == 'development' ? true : false
  config.action_mailer.default_url_options = { :host => ENV["smtp_host"] }
  config.action_mailer.show_previews = true
  config.action_mailer.delivery_method = :smtp

  if ENV["RAILS_ENV"] == 'production' || ENV["smtp_check"].present?
    config.action_mailer.smtp_settings = {
      authentication: :plain,
      enable_starttls_auto: false,
      address: ENV["smtp_address"],
      port: ENV["smtp_port"],
      domain: ENV["smtp_domain"],
      user_name: ENV["smtp_user_name"],
      password: ENV["smtp_password"]
    }
  else
    # MailCatcher
    config.action_mailer.smtp_settings = {
      address: "localhost",
      port: 1025
    }
  end
end
