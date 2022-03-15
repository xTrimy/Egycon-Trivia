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
$question->id = isset($_GET['id']) ? $_GET['id'] : die();
// read the details of question to be edited
$question->select();
echo json_encode(
    array("message" => "Selected.")
);