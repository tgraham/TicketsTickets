require 'mail'

if MailSetting.exists?
  TicketsTickets::MailSetting.init
end
