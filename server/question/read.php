<?php

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
header("Content-Type: application/json; charset=UTF-8");
include_once '../config/DB.php';
include_once '../models/question.php';

$database = new Database();
$db = $database->getConnection();
$Question = new Question($db);

$stmt = $Question->read();
$num = $stmt->rowCount();
if ($num > 0) {
    $questions_arr = array();
    $questions_arr["records"] = array();
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        extract($row);
        $question_item = array(
            "id" => $id,
            "name" => $name,
            "description" => html_entity_decode($description),
            "image" => html_entity_decode($image),
        );
        array_push($questions_arr["records"], $question_item);
    }
    http_response_code(200);
    echo json_encode($questions_arr);
} else {
    http_response_code(404);
    echo json_encode(
        array("message" => "No questions found.")
    );
}

?>