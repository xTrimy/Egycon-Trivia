<?php
include_once "../config/DB.php";
class Question
{
    private $conn;
    private $table_name = "questions";


    public $id;
    public $name;
    public $description;
    public $image;
    public $created;
    public $selected;

    function __construct($db)
    {
        $this->conn = $db;
    }

    function read()
    {
        $query = "SELECT  q.*
        FROM " . $this->table_name . " q 
        WHERE selected=1";
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        if($stmt->rowCount() == 0){
            $query = "UPDATE questions
            SET q_order=FLOOR(1 + rand() * 1000)";
            $stmt = $this->conn->prepare($query);
            $stmt->execute();
        }
        $query = "SELECT  q.*
        FROM " . $this->table_name . " q 
        ORDER BY
        q_order ASC LIMIT 100";
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }

    function readOne()
    {
        $query = "SELECT q.*
                  FROM " . $this->table_name . " q 
                  WHERE q.id = ? LIMIT 0,1";
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $this->id);
        $stmt->execute();
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        $this->name = $row['name'];
        $this->price = $row['price'];
        $this->description = $row['description'];
        $this->image = $row['image'];
        $this->selected = $row['selected'];
    }

    function select()
    {
        $query = "UPDATE " . $this->table_name . " q 
                  SET selected = 1
                  WHERE q.id = ?";
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $this->id);
        $stmt->execute();
    }
    function removeSelect()
    {
        $query = "UPDATE " . $this->table_name . " q 
                  SET selected = 0";
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
    }
}
?>