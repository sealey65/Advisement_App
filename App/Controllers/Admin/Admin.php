<?php

namespace App\Controllers\Admin;

/*
    Admin Controller
    
    This exists to show that controllers should be placed in directories to keep code organized.
*/
class Admin extends \Core\Controller {

    
    /*
        Before and After methods
        Action filters
    */
    
    protected function before() {
        echo "before ";
        //return false;
    }
    
    protected function after() {
        //echo " after";
    }
    
    public function indexAction() {
        echo 'Admin IndexAction...';
    }
    

}// end class

?>