<?php

namespace App\Controllers;

use Core\View;

class Help extends \Core\Controller {

    
    /*
        Help Controller
    */
    
    
    public function indexAction() {
        View::render("Help/help.html");
    }
    

}// end class

?>