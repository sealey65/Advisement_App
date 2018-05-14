<?php

namespace App\Controllers;

use Core\View;
use \App\Auth;
use \App\Flash;
use \App\Models\AdvisorList;

class Advisor extends Authenticated {

    
    public function viewAction() {
        
        // get current logged in user
        $current_user = Auth::getUser();
        
        // check if user is valid
        if ($current_user->role_name != 'Advisor') {
            Flash::addMessage('Permission Denied', Flash::DANGER);
            $this->redirect('/');
        } else {
            $dept_list = AdvisorList::getListByDept();
            
            View::render('advisor.html', ['dept_list' => $dept_list]);
        }
        
    }
    
    
    
}// end class

?>