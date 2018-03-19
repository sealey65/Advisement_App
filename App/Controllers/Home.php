<?php

namespace App\Controllers;

use Core\View;

class Home extends \Core\Controller {

    
    /*
        Before and After methods
        Action filters
    */
    
    protected function before() {
        //echo "before ";
        //return false;
    }
    
    protected function after() {
        //echo " after";
    }
    
    public function indexAction() {
        // when views are rendered, you pass an assoc array with data the template engine will need
        // like user name, and so on
        // :: is used to call static methods.
        View::render("Home/index.html", []);
    }
    

}// end class

?>