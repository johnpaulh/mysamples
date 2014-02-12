#find a agent with query string
require "rubygems"
require "rest_client"
require "json"

#you can also use apikey instead of user/passwd

params = URI.escape("query=phone is 987654321")
puts "#{params}"
site = RestClient::Resource.new("http://yourcompany.freshdesk.com/agents.json?#{params}","sample@freshdesk.com","test")
#you can do the same for attributes like eg: email. you can also use "email like john@abc.com"

#to view all agents
# site = RestClient::Resource.new("http://yourcompany.freshdesk.com/agents.json","sample@freshdesk.com","test")

#to view specify agent uncomment and replace the id
# site = RestClient::Resource.new("http://yourcompany.freshdesk.com/agents/[id].json","sample@freshdesk.com","test")

#avatar_attributes is the property to set the image file.
response = site.get(:accept=>"application/json")

puts "response: #{response.code} \n #{response.body}"
