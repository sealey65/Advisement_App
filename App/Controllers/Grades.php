<?php

namespace App\Controllers;

use Core\View;
use App\Models\Post;

class Grades extends \Core\Controller {

    public function indexAction() {
        // perform login???
        View::render('Grades/grades.html', ['gpa'=>'3.0']);
    }

    
}// end class

?>