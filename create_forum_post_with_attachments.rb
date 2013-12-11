#comment/reply to topic with attachments

require "rubygems"
require "rest_client"
require "json"

# Need to specify forum_id,category_id,topic_id in url
# eg:
#site = RestClient::Resource.new("http://domain.freshdesk.com/posts.json?forum_id=11&category_id=4&topic_id=1","sample@freshdesk.com","test")

site = RestClient::Resource.new("https://dummyone.freshdesk.com/posts.json?category_id=17264&forum_id=68248&topic_id=15483","sample@freshdesk.com","test")

response=site.post({:post=>{:body_html=>"testing",:attachments=>{''=>[{:resource=>File.new("tommy.jpg", 'rb')}]}}},:content_type=>"application/json")

puts "response: #{response.code} \n #{response.body}"
