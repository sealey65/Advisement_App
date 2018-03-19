<?php

/*
    !important!
    PHP version 7.1.9

    The Front Controller for our MVC Framework
*/



/*
    Composer autoloader 
    
    - loads Twig (open source templating engine)
    - loads all our required classes (Core/App)
    
    Check composer.json in root directory for settings
    
    Install Composer and run the following command from the application directory: 
        - "Composer install --no-dev"
    
    Run the following commands if composer.json is changed:
        - "Composer update --no-dev"    (to update everything) 
        - "Composer dump-autoload"      (to add new namespaces only)
    
    Composer creates a vendor folder in the root directory which is ignored by Git.

*/
require_once dirname(__DIR__) . '/vendor/autoload.php';



/*
    Error and Exception handling
*/
error_reporting(E_ALL);
set_error_handler('Core\Error::errorHandler');
set_exception_handler('Core\Error::exceptionHandler');


/*
    Create new Router Object
*/
$router = new Core\Router();


/*
    Add Routes
*/ 
$router->add('', ['controller' => 'Home', 'action' => 'index']);
$router->add('{controller}/{action}');
$router->add('{controller}/{id:\d+}/{action}');
//$router->add('admin/{controller}/{action}', ['namespace' => 'Admin']);
// routes for controller without action specifed e.g. Adviseme/login or Adviseme/grades
$router->add('{controller}', ['action' => 'index']);
$router->add('{controller}/', ['action' => 'index']);

/*
    Get URL -> Route to Controller -> Dispatch View
*/ 
$url = $_SERVER['QUERY_STRING'];
$router->dispatch($url);


?>