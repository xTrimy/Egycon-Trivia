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

    function __construct($db)
    {
        $this->conn = $db;
    }

    function read()
    {
        $query = "SELECT  q.*
        FROM " . $this->table_name . " q 
        ORDER BY
        RAND() DESC LIMIT 50";

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
    }
}
?>