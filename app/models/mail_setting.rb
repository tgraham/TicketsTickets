class MailSetting
  MAIL_AUTH = ['none', 'plain', 'login', 'cram_md5']
  SECURE_CONNECTION_TYPES = ['None','SSL','TLS']
  
  include Mongoid::Document
  
  field :name
  field :enable_mail_delivery,    type: Boolean,    default: false
  field :mail_host,                                 default: 'localhost'
  field :mail_domain,                               default: 'localhost'
  field :mail_port,               type: Integer,    default: 25
  field :mail_auth_type,                            default: MailSetting::MAIL_AUTH[0]
  field :smtp_username
  field :smtp_password
  field :secure_connection_type,                    default: MailSetting::SECURE_CONNECTION_TYPES[0]
  field :mails_from,                                default: "no-reply@example.com"
  field :mail_bcc,                                  default: "no-reply@example.com"
  
  validates :name, presence: true
end
