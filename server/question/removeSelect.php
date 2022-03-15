<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
header('Content-Type: application/json');
include_once '../config/DB.php';
include_once '../models/question.php';
$database = new Database();
$db = $database->getConnection();
// prepare product object
$question = new Question($db);
// set ID property of record to read
// read the details of question to be edited
$question->removeSelect();
echo json_encode(
    array("message" => "Removed.")
);