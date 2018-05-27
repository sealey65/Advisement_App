<?php

namespace App\Models;

use PDO;
//use \App\Auth;

/*
    Advisement Model
*/
class Chat extends \Core\Model {

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
    public static function getMessages($user_id) {
        
        $sql = "
            SELECT * FROM post        
            LEFT JOIN student USING (user_id)
            LEFT JOIN advisor USING (user_id)
            WHERE user_id = :user_id
            ORDER BY post_date DESC";
        
        $db = static::getDB();
        $stmt = $db->prepare($sql);
        
        $stmt->bindParam(':user_id', $user_id, PDO::PARAM_STR);
        
        //$stmt->setFetchMode(PDO::FETCH_CLASS, get_called_class());
            
        $stmt->execute();
        
        $advisements = []; 
        
        // loop through results and section data for each course into 
        // associated arrays from related table data
        while($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
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
                    'adv_lname' => $row['adv_lname'],
					'adv_id' => $row['advisement_id'],
					'is_new' => $row['is_new']
                ];
            }
            
        }
        
        return $advisements;
        //return $stmt->fetchall();        
    }   
    
}// end class

?>