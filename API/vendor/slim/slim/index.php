<?php
//Load Required Libraries
require 'Slim/Slim.php';
\Slim\Slim::registerAutoloader();
$app = new \Slim\Slim();

// load classes
spl_autoload_register('autoload_class');

function autoload_class($class_name) {
 $directories = array(
 'include/',
 'controller/',
 'model/'
 );
 foreach ($directories as $directory) {
 $filename = $directory . $class_name . '.php';
 if (is_file($filename)) {
 //echo $filename . " ";
 require($filename);
 break;
 }
 }
}


//Say Hello to the user
$app->get('/hello/:name', function ($name) {
    echo "Hello, $name";
});

// get player character by id or name
$app->get('/character/:guidorname', function($guidorname) use($app) {
    
 $cc = new CharacterController();
 $cc->GetCharacter($guidorname);
});

$app->post('/leaderboard/', function() use($app){
    $hsObject = $app->request()->post();
     $lc = new LeaderboardController();
     $lc->AddHighScore($hsObject);
});


// Run the application
$app->run();
?>