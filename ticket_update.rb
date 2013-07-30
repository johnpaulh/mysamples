#@author : John Paul.H
#Update ticket fields like priority, status[only these two properties are allowed to be modified].
require "rubygems"
require "rest_client"
require "json"

#here you need to specify the ticket id as part of the URL "http://yourcompany.domain.com/helpdesk/tickets/ticketid.json" [REST standards for update]
site = RestClient::Resource.new("http://yourcompany.domain.com/helpdesk/tickets/5.json","sample@freshdesk.com","test")

#status property is mandatory.
response = site.put({:helpdesk_ticket=>{:priority=>1,:status=>2}},:content_type=>"application/json")

puts "response: #{response.code} \n #{response.body}"
