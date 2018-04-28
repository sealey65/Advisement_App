<?php

namespace App\Models;

use PDO;
//use \App\Auth;

/*
    Advisement Model
*/
class Advisement extends \Core\Model {

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
        gets all advisements for this user
    */
    public static function getAdvisements($user_id) {
        
        $sql = "
            SELECT * 
            FROM advisement
            JOIN advised_course USING (advisement_id)
            JOIN post USING (advisement_id)
            WHERE student = :user_id";
        
        $db = static::getDB();
        $stmt = $db->prepare($sql);
        
        $stmt->bindParam(':user_id', $user_id, PDO::PARAM_STR);
        
        //$stmt->setFetchMode(PDO::FETCH_CLASS, get_called_class());
            
        $stmt->execute();
        
        $advisements = []; 
        
        // loop through results and section data for each course into 
        // associated arrays from related table data
        while($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            
            // check if this advisement was created and create if not
            if (!isset($advisements[$row['advisement_id']]))
                $advisements[$row['advisement_id']] = [
                    'advisement_id' => $row['advisement_id'],
                    'student' => $row['student'],
                    'posts' => [],
                    'advised_courses' => [] 
                ];
            // now that the advisement has been ensured as created, add the post and advised course data
            // if not already in there 
            if (!isset($advisements[$row['advisement_id']]['posts'][$row['post_id']])){
                $advisements[$row['advisement_id']]['posts'][$row['post_id']] = [
                    'user_id' => $row['user_id'],
                    'content' => $row['content']
                ];
            }
            if (!isset($advisements[$row['advisement_id']]['advised_courses'][$row['advised_course_id']])){
                $advisements[$row['advisement_id']]['advised_courses'][$row['advised_course_id']] = [
                    'course_code' => $row['course_code'],
                    'status' => $row['status']
                ];
            }
            
        }
        
        return $advisements;
        //return $stmt->fetchall();
        
        
    }
    
    
    
    
}// end class

?>