Given /^there is a ticket called "([^"]*)" with a description of "([^"]*)" and number "([^"]*)"$/ do |subject, description, number|
  Ticket.new(:number      => number,
             :subject     => subject,
             :description => description).save!
end
