<?php

namespace App\Models;

use PDO;
use \App\Auth;

/*
    Advisor Model
*/
class AdvisorList extends \Core\Model {

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
        gets all advisements for the department the advisor is in
    */
    public static function getListByDept() {
        
        $sql = "
            SELECT * 
            FROM advisement
            JOIN semester USING (semester_id)
            JOIN student ON (advisement.student = student.user_id)
            JOIN Advisor ON (advisement.advisor = advisor.user_id)
            JOIN program USING (program_id)
            WHERE is_open = 1 AND program.dept_id = :dept_id
            ORDER BY student, is_dirty DESC";
        
        $db = static::getDB();
        $stmt = $db->prepare($sql);
        
        
        $user = Auth::getUser();
        $stmt->bindValue(':dept_id', static::getDeptID($user), PDO::PARAM_INT);

        
        $stmt->execute();
        
        return $stmt->fetchAll();
                    
    }
    
    
    public static function getDeptID($user) {
        
        $sql = "
            SELECT dept_id from advisor where user_id = :user_id";
        
        $db = static::getDB();
        $stmt = $db->prepare($sql);
        
        $stmt->bindValue(':user_id', $user->user_id, PDO::PARAM_STR);
            
        $stmt->execute();
        
        if ($row = $stmt->fetch()) {
            return $row['dept_id'];
        }
        
        return false;
    }
    
    
    
   
    
}// end class

?>