<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Credentials: true");
header('Content-Type: application/json');
include_once '../config/database.php';
include_once '../models/question.php';
$database = new Database();
$db = $database->getConnection();
// prepare product object
$question = new Question($db);
// set ID property of record to read
$question->id = isset($_GET['id']) ? $_GET['id'] : die();
// read the details of question to be edited
$question->readOne();
if($question->name!=null){
// create array
$question_arr = array(
"id" =>  $question->id,
"name" => $question->name,
"description" => $question->description
);
// set response code - 200 OK
http_response_code(200);
// make it json format
echo json_encode($question_arr);
}
else{
// set response code - 404 Not found
http_response_code(404);
// tell the user question does not exist
echo json_encode(array("message" => "Question does not exist."));
}
