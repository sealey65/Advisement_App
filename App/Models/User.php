<?php

namespace App\Models;

use PDO;
use \App\Token;

/*
    User Model
*/
class User extends \Core\Model {

    /*
        list of validation errors
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
        Save the user info as a record in the DBMS
    */
    public function save() {
        
        // perform validation first.
        $this->validate();
        
        if (empty($this->errors)) {
            
            // hash the password, with salt etc. php password_hash does this for us
            $password_hash = password_hash($this->pword, PASSWORD_DEFAULT);

            $sql = 'INSERT INTO users ( user_id, user_email, password_hash, role_name ) 
                            VALUES ( :user_id, :email, :pword, :role)';
            
            $db = static::getDB();
            $stmt = $db->prepare($sql);

            $stmt->bindValue(':user_id', $this->user_id, PDO::PARAM_STR);
            $stmt->bindValue(':email', $this->email, PDO::PARAM_STR);
            $stmt->bindValue(':pword',$password_hash, PDO::PARAM_STR);
            $stmt->bindValue(':role', $this->role, PDO::PARAM_STR);
            return $stmt->execute();
        }
        return false;
    }
    
   public function validate() {       
        
        // username minlength = 6, required, not taken
        if (strlen($this->user_id) < 8) {
             $this->errors[] = 'The username must be at least 8 characters.';
        }
                
        if (static::userIDExists($this->user_id)) {
            $this->errors[] = 'The user id specified is already in the system.';
        }       
          
        if ($this->role == '') {
            $this->errors[] = 'Please specify a role.';
        }      
        
        // email is valid email, required and not taken
        if (filter_var($this->email, FILTER_VALIDATE_EMAIL) === false) {
            $this->errors[] = 'Invalid email';
        }

        if (static::emailExists($this->email)) {
            $this->errors[] = 'The email specified is already taken';
        }
        
        
        // password length, required, matches reg
        if(strlen($this->pword)<6){
			$this->errors[] = 'Please enter at least 6 characters for the password';
		}
		if(preg_match('/.*[a-z]+.*/i',$this->pword) == 0){
			$this->errors[] = 'Password require at least one letter';
		}
		if(preg_match('/.*\d+.*/i', $this->pword) == 0){
			$this->errors[] = 'Password require at least one number';
		}	
    }
    
    
    /*
        Given an email address, get a user class containing a user's information
    */
    public static function findByEmail($email) {
        $sql = 'SELECT * FROM users WHERE user_email = :email';
        $db = static::getDB();
        $stmt = $db->prepare($sql);
        $stmt->bindParam(':email', $email, PDO::PARAM_STR);
        
        /* 
            fetch normally returns an array, however we will set 
            fetch mode toa class instead, the class returned will be 
            this class (User).
            You can then access the data via User->email and so on
        */
        $stmt->setFetchMode(PDO::FETCH_CLASS, get_called_class());
            
        $stmt->execute();
        
        return $stmt->fetch();
    }
    
    /*
        Given an id, get a user class containing a user's information
    */
    public static function findByID($user_id) {
        
        $sql = 'SELECT * FROM users WHERE user_id = :user_id';
        $db = static::getDB();
        $stmt = $db->prepare($sql);
        
        $stmt->bindParam(':user_id', $user_id, PDO::PARAM_INT);
        
        $stmt->setFetchMode(PDO::FETCH_CLASS, get_called_class());
            
        $stmt->execute();
        
        return $stmt->fetch();
    }
    
    /*
        Given a username, get a user class containing a user's information
    */
    public static function findByUsername($username) {
        
        $sql = 'SELECT * FROM users WHERE username = :username';
        $db = static::getDB();
        $stmt = $db->prepare($sql);
        
        $stmt->bindParam(':username', $username, PDO::PARAM_STR);
        
        $stmt->setFetchMode(PDO::FETCH_CLASS, get_called_class());
            
        $stmt->execute();
        
        return $stmt->fetch();
    }
    
    
    
    /*
        find if email exits in database 
    */
    public static function emailExists($email) {
        return static::findByEmail($email)  !== false;        
    }
    
    /*
        find if username exits in database 
    */
    public static function userNameExists($username) {
        return static::findByUsername($username) !== false;
    }
    
    /*
        find if user_id exits in database 
    */
    public static function userIDExists($user_id) {
        return static::findByID($user_id) !== false;
    }
    
    
    
    /*
        authenticate a user, using username and password
    */
    public static function authenticate($user_id, $password) {
        
        $user = static::findByID($user_id);
        
        if ($user) {
            if(password_verify($password, $user->password_hash)) {
                return $user;
            }
        }
        return false;
    }
    
    
    
    /*
        Saves a token to the remember_me table
    */
    public function rememberLogin() {
        $token = new Token();
        $hashed_token = $token->getHash();
        $this->remember_token = $token->getValue();
        
        // 30 days from now, 30 days x 24 hours x 60 mins x 60 secs
        $this->expires = time() + (60 * 60 * 24 * 30);
        $expire_str = date('Y-m-d H:i:s', $this->expires);
        
        $sql = 'INSERT INTO remember_me (token_hash, user_id, expires_at) VALUES (:token_hash, :user_id, :expires_at)';
        
        $db = static::getDB();
        $stmt = $db->prepare($sql);
        
        $stmt->bindParam(':token_hash', $hashed_token, PDO::PARAM_STR);
        $stmt->bindParam(':user_id', $this->user_id, PDO::PARAM_INT);
        $stmt->bindParam(':expires_at', $expire_str, PDO::PARAM_STR);
        
        return $stmt->execute();
    }
    
    
}// end class

?>