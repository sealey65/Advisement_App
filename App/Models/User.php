<?php

namespace App\Models;

use PDO;
use \App\Token;
use \App\Auth;

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
	
	public static function getCampus(){
		$user_temp = Auth::getUser();
			
		if($user_temp){
			$db = static::getDB();
			$stmt = $db->query("SELECT * FROM campus");
				
			return $stmt->fetchAll(PDO::FETCH_ASSOC);
		}
        return false;
	}
	public static function getDept(){
		$user_temp = Auth::getUser();
			
		if($user_temp){
			$db = static::getDB();
			$stmt = $db->query("SELECT * FROM department");
				
			return $stmt->fetchAll(PDO::FETCH_ASSOC);
		}
        return false;
	}
	public static function getProgramme(){
		$user_temp = Auth::getUser();
			
		if($user_temp){
			$db = static::getDB();
			$stmt = $db->query("SELECT * FROM program ORDER BY program_level, program_name, year_issued");
				
			return $stmt->fetchAll(PDO::FETCH_ASSOC);
		}
        return false;
	}
    public static function getSemester(){
		$user_temp = Auth::getUser();
			
		if($user_temp){
			$db = static::getDB();
			$stmt = $db->query("SELECT * FROM semester ORDER BY semester_id DESC");
				
			return $stmt->fetchAll(PDO::FETCH_ASSOC);
		}
        return false;
	}
	
	public function addProfileImg(){		
		
		$user_temp = $_SESSION['user_id'];
		
			$sql = 'UPDATE student SET profile_img = :profile_img WHERE user_id = '.$user_temp.';';		            	
          
		 $db = static::getDB();
         $stmt = $db->prepare($sql);
		
		$stmt->bindValue(':profile_img', $this->profile_img, PDO::PARAM_STR);  
		$stmt->execute();
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
			

            $sql = 'INSERT INTO user ( user_id, user_email, password_hash, role_name ) 
                            VALUES ( :user_id, :email, :pword, :role);';
            
			if($this->role == "Advisor"){
				$sql .= 'INSERT INTO advisor(user_id, adv_fname, adv_lname, dept_id, campus_id)
							VALUES(:user_id, :fname, :lname, :dept, :campus);';
				
			}else if($this->role == "Student"){
				$sql .= 'INSERT INTO student(user_id, stu_fname, stu_lname, status, program_id, campus_id)
							VALUES(:user_id, :fname, :lname, :status, :program, :campus);';
			}
            $db = static::getDB();
            $stmt = $db->prepare($sql);

            $stmt->bindValue(':user_id', $this->user_id, PDO::PARAM_STR);
            $stmt->bindValue(':email', $this->email, PDO::PARAM_STR);
            $stmt->bindValue(':pword',$password_hash, PDO::PARAM_STR);
            $stmt->bindValue(':role', $this->role, PDO::PARAM_STR);				
			
			if($this->role == "Advisor"){
				$stmt->bindValue(':dept',  $this->dept, PDO::PARAM_INT);
				
			}else if($this->role == "Student"){
				$stmt->bindValue(':program',  $this->program, PDO::PARAM_INT);
				$stmt->bindValue(':status',  $this->status, PDO::PARAM_STR);
			}
			if($this->role == "Advisor" || $this->role == "Student"){
				$stmt->bindValue(':fname', $this->fname, PDO::PARAM_STR);
				$stmt->bindValue(':lname', $this->lname, PDO::PARAM_STR);
				$stmt->bindValue(':campus', $this->campus, PDO::PARAM_STR);
			}
			
			
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
    
	
	 public function addSemester(){
		$this->semesterValidate();
		
		if(empty($this->errors)){
			$sql = 'INSERT INTO semester(semester_id, date_begin, date_end, is_open)
						VALUES(:semester_id, :begin_date, :end_date, :status)';
			
			$db = static::getDB();
			$stmt = $db->prepare($sql);
			
			$stmt->bindValue(':semester_id', $this->semester_id, PDO::PARAM_STR);
			$stmt->bindValue(':begin_date', $this->begin_date, PDO::PARAM_STR);
			$stmt->bindValue(':end_date', $this->end_date, PDO::PARAM_STR);
			$stmt->bindValue(':status', $this->status, PDO::PARAM_INT);
			
			return $stmt->execute();
		}
		return false;
	}
	public function semesterValidate(){
		if(strlen($this->semester_id) < 6 || strlen($this->semester_id) > 6){
			$this->errors[] = 'Semester ID must contain 6 characters';
		}
		if (static::semesterExists($this->semester_id)) {
            $this->errors[] = 'The semester id specified is already in the system.';
        }  
	}
	
	
	
       /*
        Given a semester, get a user class containing a semester's information
    */
    public static function findBySemester($semester_id) {
        
        $sql = 'SELECT * FROM semester WHERE semester_id = :semester_id';
        $db = static::getDB();
        $stmt = $db->prepare($sql);
        
        $stmt->bindParam(':semester_id', $semester_id, PDO::PARAM_STR);
        
        $stmt->setFetchMode(PDO::FETCH_CLASS, get_called_class());
            
        $stmt->execute();
        
        return $stmt->fetch();
    }
	/*
        find if semester exits in database 
    */
    public static function semesterExists($semester) {
        return static::findBySemester($semester)  !== false;        
    }
    /*
        Given an email address, get a user class containing a user's information
    */
    public static function findByEmail($email) {
        $sql = 'SELECT * FROM user WHERE user_email = :email';
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
        
        $sql = 'SELECT * FROM user WHERE user_id = :user_id';
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
        
        $sql = 'SELECT * FROM user WHERE username = :username';
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