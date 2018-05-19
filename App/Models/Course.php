<?php

namespace App\Models;

use PDO;
//use \App\Auth;

/*
    Semester Model
*/
class Course extends \Core\Model {

    /*
        list of errors
    */
    public $errors = [];
    
    /*
        contructor, accepts post data
        creates a new User object where
        you will be able to access the post values
        via dot notation, e.g. User.first_name
    */ 
    public function __construct($data = []) {
        foreach ($data as $key => $value) {
            // creates User.whateverpostvalue = whatever was sent
            $this->$key = $value;
        }
    }
    
    
    /*
        get semester for advisement
    */
    public static function findCourse($course_code) {
        
        $sql = "
            SELECT * 
            FROM course
            WHERE course_code = :course_code";
        
        $db = static::getDB();
        $stmt = $db->prepare($sql);
        
        $stmt->bindParam(':course_code', $course_code, PDO::PARAM_STR);
        
        $stmt->setFetchMode(PDO::FETCH_CLASS, get_called_class());
            
        $stmt->execute();
        
        return $stmt->fetch();
        
    }
    
    
    
    
    
    
    
    
}// end class

?>