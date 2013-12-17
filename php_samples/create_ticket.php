<?php 
echo 'Hi John!!!';


$email="sample@freshdesk.com";
$password="test";


//For normal ticket creation without attachments
//==================================================================

// $datafields =  array (
//      "helpdesk_ticket" =>array("subject"=>"test me 2","description"=>"Hi there how are you","email"=>"me@abc.com"
//     ) );
//  $jsondata= json_encode($datafields);
//  $header[] = "Content-type: application/json";

//==================================================================


//ticket create with attachments. need to pass data as multipart/form-data
//==================================================================
$jsondata = array (
	'helpdesk_ticket[email]' => 'john@freshdesk.com',
	'helpdesk_ticket[subject]' => 'test',
	'helpdesk_ticket[description]' => 'testing description content',
	'helpdesk_ticket[attachments][][resource]' =>  "@" . "/Users/johnpaul/Examples/tommy1.jpg"
);
 $header[] = "Content-type: multipart/form-data";
//==================================================================
//end for with attachment change

$url = 'http://yourcompany.freshdesk.com/helpdesk/tickets.json';
 $ch = curl_init ($url);

curl_setopt($ch, CURLOPT_POST, true);
curl_setopt($ch, CURLOPT_POSTFIELDS,$jsondata);

curl_setopt($ch, CURLOPT_USERPWD, "$email:$password");
curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
curl_setopt($connection, CURLOPT_HEADER, false);
// receive server response ...
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
 curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
 curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
$server_output = curl_exec ($ch);

$response = json_decode($server_output);
echo "RESPONSE:<br/>".var_dump($response);

curl_close ($ch);

 ?>
