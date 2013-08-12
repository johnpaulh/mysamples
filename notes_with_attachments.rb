#@author : John Paul.H
#Create a private note with attachments. I had my attachments in the current directory.
#You can use body or body_html to set the note content.
#You can also pass the user_id if you want to add the note by that particular user.
require 'rubygems'
require "rest_client"
require 'json'

#Specify your ticket id instead of the '62' in the below URL with your ticket id for which you wish to add note.
site = RestClient::Resource.new('http://yourcompany.domain.com/helpdesk/tickets/62/notes.json',"sample@freshdesk.com","test")

#attachments should be of the form array of Hash with files mapped to the key 'resource'.
temp = {:body_html=>"<strong>Hi there</strong>Notes with attachment",:source=>2,:attachments=>{''=>[{:resource=>File.new("tommy.jpg", 'rb')},{:resource=>File.new("tommy1.jpg", 'rb')}]}}

response = site.post({:helpdesk_note=>temp},:content_type=>"application/json")


puts "#{response} ::: #{response.code}"
