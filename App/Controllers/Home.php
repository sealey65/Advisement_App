<?php

namespace App\Controllers;

use Core\View;
use \App\Models\User;
use \App\Models\Advisement;
use \App\Auth;
use \App\Flash;

class Home extends Authenticated {
    
    public function indexAction() {	
		$user = Auth::getUser();
		if($user){	
			$advisements = Advisement::getAdvisements($user->user_id);
			View::render("Home/index.html", ['advisements' => $advisements]);
		}else{
			View::render('Login/index.html');	
		}
	}
	
	public function newAction() {
        View::render("Admin/addUser.html", []);
    }
	public function deleteUserAction(){
		View::render("Admin/deleteUser.html");
	}
	public function semesterAction() {
        View::render("Admin/semester.html", []);
    }
	public function profileAction(){
		View::render("Home/profile.html");
	}
	public function advisementAction(){
		$user = Auth::getUser();
		if($user->role_name == "Advisor"){
			View::render("Advisor/advisement.html");
		}else if($user->role_name == "Student"){
			View::render("Student/advisement.html");
		}
	}
	public function degreeAction(){
		View::render("Student/degree.html");
	}
	public function successAction(){			
		View::render("Home/success.html");
		header("Refresh:5; url=/");
	}
      /**
	  * Log out the user
	  * 
	  * @return void
	 **/
	public function destroyAction(){			
		Auth::logout();			
			
		$this->redirect('/');
	}

}// end class

?>