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
            $password_hash = password_hash($this->password, PASSWORD_DEFAULT);

            $sql = 'INSERT INTO users ( first_name, last_name, addr_street, addr_city, phone, username, password_hash, email ) 
                            VALUES ( :first_name, :last_name, :addr_street, :addr_city, :phone, :username, :password_hash, :email)';

            
            $db = static::getDB();
            $stmt = $db->prepare($sql);

            $stmt->bindValue(':first_name', $this->first_name, PDO::PARAM_STR);
            $stmt->bindValue(':last_name', $this->last_name, PDO::PARAM_STR);
            $stmt->bindValue(':addr_street', $this->addr_street, PDO::PARAM_STR);
            $stmt->bindValue(':addr_city', $this->addr_city, PDO::PARAM_STR);
            $stmt->bindValue(':phone', $this->phone, PDO::PARAM_STR);
            $stmt->bindValue(':username', $this->username, PDO::PARAM_STR);
            $stmt->bindValue(':password_hash', $password_hash, PDO::PARAM_STR);
            $stmt->bindValue(':email', $this->email, PDO::PARAM_STR);

            return $stmt->execute();
        }
        return false;
    }
    
    
    
    public function validate() {
        
        
        
        // username minlength = 6, required, not taken
        if (strlen($this->username)< 6) {
             $this->errors[] = 'The username must be at least 8 characters.';
        }
                
        if (static::userNameExists($this->username)) {
            $this->errors[] = 'The username specified is already taken.';
        }
        
        
        // fname, lname, address st and city, required
        if ($this->first_name == '') {
            $this->errors[] = 'A First Name is required.';
        }
        
        if ($this->last_name == '') {
            $this->errors[] = 'A Last Name is required.';
        }
        
        if ($this->addr_street == '') {
            $this->errors[] = 'A street for address is required.';
        }
        
        if ($this->addr_city == '') {
            $this->errors[] = 'A city for address is required.';
        }
        
        
        // email is valid email, required and not taken
        if (filter_var($this->email, FILTER_VALIDATE_EMAIL) === false) {
            $this->errors[] = 'Invalid email';
        }

        if (static::emailExists($this->email)) {
            $this->errors[] = 'The email specified is already taken';
        }
        
        
        // password length, required, matches reg
        if(strlen($this->password)< 8) {
            $this->errors[] = 'The password must be at least 8 characters';
        }
        
        if(preg_match('/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*(_|[^\w])).+$/', $this->password) == 0) {
            $this->errors[] = 'The password needs one of each: lowercase, uppercase, number and symbol.';   
        }
        
        
        // phone number requred and matches reg
        if(preg_match('/^[0-9]{3}[-][0-9]{4}$/', $this->phone) == 0) {
            $this->errors[] = 'The phone number does not seem valid.';   
        }
        
        
    }
    
    
    /*
        Given an email address, get a user class containing a user's information
    */
    public static function findByEmail($email) {
        $sql = 'SELECT * FROM users WHERE email = :email';
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
    public static function authenticate($username, $password) {
        
        $user = static::findByUsername($username);
        
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