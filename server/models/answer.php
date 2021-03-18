<?php
include_once "../config/DB.php";
class Answer
{
    private $conn;
    private $table_name = "answers";

    public $id;
    public $question_id;
    public $answer;
    public $is_right;

    function __construct($db)
    {
        $this->conn = $db;
    }

    function read()
    {
        $query = "SELECT  a.*
        FROM " . $this->table_name . " a 
        WHERE a.question_id = ?
        ORDER BY
        RAND() DESC LIMIT 4";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $this->question_id);
        $stmt->execute();
        return $stmt;
    }

    function readOne()
    {
        $query = "SELECT a.*
                  FROM " . $this->table_name . " a 
                  WHERE a.id = ? LIMIT 0,1";
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $this->id);
        $stmt->execute();
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        $this->id = $row['id'];
        $this->answer = $row['answer'];
        $this->is_right = $row['right_answer'];
        $this->question_id = $row['question_id'];
    }
}
?>