<?php

namespace App\Controllers;

use Core\View;
use App\Models\Advisement;
use App\Auth;
use App\Flash;

class Advisements extends Authenticated {


    
       
    public function viewAction() {
        $advisements = Advisement::getAdvisements(Auth::getUser()->user_id);
        View::render('advisements.html', ['advisements' => $advisements]);
    }
    
    
    
    public function chequingAction() {
        
    }
    

}// end class

?>