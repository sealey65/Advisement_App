<?php

namespace App\Controllers;

use Core\View;


class Home extends \Core\Controller extends Authenticated {

    
       
    public function viewAction() {
        
        // logic?
        
        View::render("Advisement/main.html", []);
    }
    

}// end class

?>