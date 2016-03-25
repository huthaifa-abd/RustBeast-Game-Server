<?php

class LeaderboardController extends AbstractController
{

//Insert highscore to the database
       public function AddHighScore($hsObject)
       {
           try {
            $hsObj = json_decode($hsObject['data']);
            $db = $this->connection;
            $qry = "INSERT INTO `rustbeastdb`.`leaderboards` (`guid`, `gameid`, `playerid`, `score`) VALUES (NULL, :gameid, :playerid, :score); ";
            $stmt = $db->prepare($qry);
            $stmt->bindValue(':gameid', $hsObj->gameid, PDO::PARAM_INT);
            $stmt->bindValue(':playerid', $hsObj->playerid, PDO::PARAM_INT);
            $stmt->bindValue(':score', $hsObj->score, PDO::PARAM_INT);
            $stmt->execute();
            echo json_encode("HIGHSCORE_INSERT_SUCCESS", JSON_PRETTY_PRINT);
        } catch (Exception $ex) {
            $db = NULL;
            echo $ex;
            $this->ReturnStatusCode(true, "HIGHSCORE_INSERT_ERROR", $ex);
        }
         $db = NULL;
       }
       
    
}



?>