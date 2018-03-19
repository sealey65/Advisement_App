<?php

namespace App\Models;

use PDO;

/*
    Auth Model
*/
class Post extends \Core\Model {

    /*
        example function --- remove this....    
    */
    public static function getAll() {
        
        try {
            
            $db = static::getDB();
            
            $stmt = $db->query('SELECT id, title, content FROM posts ORDER BY created_at');
            
            $results = $stmt->fetchAll(PDO::FETCH_ASSOC);
            
            return $results;
        
        } catch (PDOException $e) {
            echo "serious PDO error";
            echo $e->getMessage();
        }
    }
    
    /*
        Authenticate a user...
    */
    public static function authenticate(){
                
    }
    
}// end class

?>