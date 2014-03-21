
#@author : John Paul.H
#Update an user profile image.
require "rubygems"
require "rest_client"
require "json"

#To update an existing  contact with image....
# site = RestClient::Resource.new("http://yourcompany.freshdesk.com/contacts/[id].json","<apiKey>","X")

site = RestClient::Resource.new("http://yourcompany.freshdesk.com/contacts/174862.json","1awe23sadfacDSAED","X")

#The image file exists in the current directory. 
response = site.put({:user=>{"avatar_attributes"=>{:content=>File.open("tommy.jpg")}},:content_type=>"application/json"})

puts "response: #{response.code} \n #{response.body}"
