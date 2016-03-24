<?php 
	/*
		UserPie Version: 1.0
		http://userpie.com
		

	*/
	require_once("../models/config.php");

	/*
	* Uncomment the "else" clause below if e.g. userpie is not at the root of your site.
	*/
	if (!isset($loggedInUser)) {
    header('Location: ../login.php');
       exit();
   }
//	else
//		header('Location: /');
?>

<?php

/*
 * This file is part of the CRUD Admin Generator project.
 *
 * Author: Jon Segador <jonseg@gmail.com>
 * Web: http://crud-admin-generator.com
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

require_once __DIR__.'/controllers/base.php';
