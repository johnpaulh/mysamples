#@author : John Paul.H
#find a user with query string
require "rubygems"
require "rest_client"
require "json"

#you can also use apikey instead of user/passwd
url = CGI.escape("query=name is john")
#you can do the same for attributes like eg: external_id, email. you can also use "email like john"
#'state' attribute defines either the user is verified or not,if not specified only verified users will be displayed.
site = RestClient::Resource.new("http://localhost:3000/contacts.xml?state=all&#{url}","sample@freshdesk.com","test")

#avatar_attributes is the property to set the image file.
response = site.get(:accept=>"application/xml")

puts "response: #{response.code} \n #{response.body}"

