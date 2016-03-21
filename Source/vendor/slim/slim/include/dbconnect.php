<?php 
class dbconnect
{
    public function Connect() 
    {
        require_once 'include/config.php';
        
        /*
         * check if database not exists, create a new one
         */
        try {
            $pdo = new PDO("mysql:host=" .DB_HOST, DB_USERNAME, DB_PASSWORD);
            $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $dbname = DB_NAME;

            $dbname = "`".str_replace("`","``",$dbname)."`";
            $pdo->query("CREATE DATABASE IF NOT EXISTS $dbname");
            $pdo->query("use $dbname");
        } catch(PDOException $e) {
          //  echo $e->getMessage();//Remove in production code
        }
        /*
         * check if table not exists, create a new one
         */
        try {
            $pdo = new PDO(DB_HOST_PDO, DB_USERNAME, DB_PASSWORD);
            $pdo->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );//Error Handling
            $sql ="CREATE table " .CHAR_TABLE."(
            guid INT( 11 )  AUTO_INCREMENT PRIMARY KEY UNIQUE KEY,
            name VARCHAR( 50 ) NOT NULL, 
            health INT( 11 ) NOT NULL,
            score INT( 11 ) NOT NULL);" ;
            $pdo->exec($sql);
            print("Created ".CHAR_TABLE." Table.\n");

        } catch(PDOException $e) {
           // echo $e->getMessage();//Remove in production code
        }
        
        /*
         * check if table not exists, create a new one
         */
        try {
            $pdo = new PDO(DB_HOST_PDO, DB_USERNAME, DB_PASSWORD);
            $pdo->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );//Error Handling
            $sql ="CREATE table " .LEADERBOARD_TABLE."(
            guid INT( 11 )  AUTO_INCREMENT PRIMARY KEY UNIQUE KEY,
            gameid INT( 11 ) NOT NULL,
            playerid INT( 11 ) NOT NULL,
            score INT( 11 ) NOT NULL);" ;
            $pdo->exec($sql);
            print("Created ".LEADERBOARD_TABLE." Table.\n");

        } catch(PDOException $e) {
           // echo $e->getMessage();//Remove in production code
        }
        
        
        /*
         * finally return a connection
         */
        
        $pdo = new PDO(DB_HOST_PDO, DB_USERNAME, DB_PASSWORD);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION  );  
        return $pdo;
    }
}
 
?>