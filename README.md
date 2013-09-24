Ruby Sample Programs to use freshdesk api with RestClient
=========================================================
Overview: 

Sample programs for the fun of it.

1. Create ticket api with cc_emails,custom_fields attribute
2. Create ticket with attachments
3. Create user basic
4. Create user along with avatar image.
5. Create user using(Net::Http)
6. Update user.
7. Update user avatar(image).
8. Update ticket custom fields.
9. Delete ticket
10. Fetch contacts by query string.
11. View ticket.
12. View contact.
13. Restore ticket.
14. Assign ticket.

Troubleshoot:
------------
Freshdesk API's use the Basic Access Authentication.
Refer:
http://en.wikipedia.org/wiki/Basic_access_authentication

So incase if you get "error":"access denied", its possible that you are not using the basic access authentication method ie., check the request Header "Authorization" is passed with Base64 encoded string of  "username:password" or "apiKey:X" [Here X is just a dummy char, you can pass anything instead]

eg:
ruby:
 request.basic_auth("sample@freshdesk.com","test")

Java:

 request.setHeader("Authorization", "Basic " + Base64.encodeBase64String("username:password".getBytes())); //Note the blankspace after "Basic".

Note:
-----
The api's used are in reference from the http://freshdesk.com/api site. Its possible the samples has errors. 
I will try to keep it up to date as much as possible.
