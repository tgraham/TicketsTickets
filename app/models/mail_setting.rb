class MailSetting
  MAIL_AUTH = ['none', 'plain', 'login', 'cram_md5']
  SECURE_CONNECTION_TYPES = ['None','SSL','TLS']
  
  include Mongoid::Document
  field :environment, :type => String
  
  field :name, type: String
  field :enable_mail_delivery, type: Boolean, default: false
  field :mail_host, type: String, default: 'localhost'
  field :mail_domain, type: String, default: 'localhost'
  field :mail_port, type: Integer, default: 25
  field :mail_auth_type, type: String, default: MailSetting::MAIL_AUTH[0]
  field :smtp_username, type: String
  field :smtp_password, type: String
  field :secure_connection_type, type: String, default: MailSetting::SECURE_CONNECTION_TYPES[0]
  field :mails_from, type: String, default: "no-reply@example.com"
  field :mail_bcc, type: String, default: "no-reply@example.com"
end
