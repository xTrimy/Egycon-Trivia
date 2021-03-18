<?php

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Credentials: true");
header('Content-Type: application/json');

include_once '../config/DB.php';
include_once '../models/answer.php';
$database = new Database();
$db = $database->getConnection();

$Answer = new Answer($db);
$Answer->question_id = isset($_GET['question_id']) ? $_GET['question_id'] : die();

$stmt = $Answer->read();
$num = $stmt->rowCount();
if ($num >= 4) {
    $answers_arr = array();
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        extract($row);
        $answer_item = array(
            "id" => $id,
            "answer" => $answer,
            "question_id" => html_entity_decode($question_id),
            "is_right" => html_entity_decode($right_answer),
        );
        array_push($answers_arr, $answer_item);
    }
    http_response_code(200);
    echo json_encode($answers_arr);
} else {
    http_response_code(404);
    echo json_encode(
        array("message" => "No answers found.")
    );
}

?>