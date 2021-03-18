<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Credentials: true");
header('Content-Type: application/json');
include_once '../config/database.php';
include_once '../models/answer.php';
$database = new Database();
$db = $database->getConnection();
// prepare product object
$answer = new Answer($db);
// set ID property of record to read
$answer->id = isset($_GET['id']) ? $_GET['id'] : die();
// read the details of answer to be edited
$answer->readOne();
if($answer->name!=null){
// create array
$answer_arr = array(
"id" =>  $answer->id,
"answer" => $answer->answer,
"question_id" => $answer->question_id,
"is_right" => $answer->right_answer
);
// set response code - 200 OK
http_response_code(200);
// make it json format
echo json_encode($answer_arr);
}
else{
// set response code - 404 Not found
http_response_code(404);
// tell the user answer does not exist
echo json_encode(array("message" => "answer does not exist."));
}
