#find a user with query string
require "rubygems"
require "rest_client"
require "json"

#you can also use apikey instead of user/passwd

params = URI.escape("query=name is john")
puts "#{params}"
site = RestClient::Resource.new("http://yourcompany.freshdesk.com/contacts.json?state=all&#{params}","sample@freshdesk.com","test")
#you can do the same for attributes like eg: external_id, email. you can also use "email like john"
#'state' attribute defines either the user is verified or not,if not specified only verified users will be displayed.

#to view all contacts
# site = RestClient::Resource.new("http://yourcompany.freshdesk.com/contacts.json?state=all","sample@freshdesk.com","test")

#to view specify contact uncomment
# site = RestClient::Resource.new("http://yourcompany.freshdesk.com/contacts/[id].json","sample@freshdesk.com","test")

#avatar_attributes is the property to set the image file.
response = site.get(:accept=>"application/json")

puts "response: #{response.code} \n #{response.body}"

