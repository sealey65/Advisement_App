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
            JOIN semester USING (semester_id)
            LEFT JOIN student USING (user_id)
            LEFT JOIN advisor USING (user_id)
            WHERE student = :user_id
            ORDER BY semester_id DESC, post_date DESC";
        
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
                    'advisor' => $row['advisor'],
                    'semester_id' => $row['semester_id'],
                    'date_begin' => $row['date_begin'],
                    'date_end' => $row['date_end'],
                    'posts' => [],
                    'advised_courses' => [] 
                ];
            // now that the advisement has been ensured as created, add the post and advised course data
            // if not already in there 
            if (!isset($advisements[$row['advisement_id']]['posts'][$row['post_id']])){
                $advisements[$row['advisement_id']]['posts'][$row['post_id']] = [
                    'user_id' => $row['user_id'],
                    'content' => $row['content'],
                    'post_id' => $row['post_id'],
                    'post_date' => $row['post_date'],
                    'stu_fname' => $row['stu_fname'],
                    'stu_lname' => $row['stu_lname'],
                    'adv_fname' => $row['adv_fname'],
                    'adv_lname' => $row['adv_lname']
                ];
            }
            if (!isset($advisements[$row['advisement_id']]['advised_courses'][$row['advised_course_id']])){
                $advisements[$row['advisement_id']]['advised_courses'][$row['advised_course_id']] = [
                    'course_code' => $row['course_code'],
                    'status' => $row['status'],
                    'type' => $row['type'],
                    'grade' => $row['grade']
                ];
            }
            
        }
        
        return $advisements;
        //return $stmt->fetchall();
        
        
    }
    
    
    
    
}// end class

?>