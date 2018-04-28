<?php

namespace App\Controllers;

use Core\View;


class Admin extends Authenticated {

    
       
    public function viewAction() {
        
        // logic?
        
        View::render("Advisement/main.html", []);
    }
    

}// end class

?>