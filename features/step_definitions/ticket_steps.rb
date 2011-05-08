Given /^there is a ticket called "([^"]*)" with a description of "([^"]*)"$/ do |subject, description|
  Ticket.new(:subject => subject,
             :description => description).save!
end
