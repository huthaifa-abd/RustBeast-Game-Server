<?php

class CharacterController extends AbstractController
{

    public function GetCharacter($character) { // $character = name or id
        $db = NULL;
        if (is_numeric($character)) {
            $this->GetCharacterById($character);
        } else {
            $this->GetCharacterByName($character);
        }
    }

    private function GetCharacterById($guid) {
        try {
            $db = $this->connection;
            $qry = "SELECT * FROM `characters` WHERE `guid` = :guid ";
            $stmt = $db->prepare($qry);
            $stmt->bindValue(':guid', $guid, PDO::PARAM_INT);
            $stmt->execute();
            $rows = $stmt->fetch(PDO::FETCH_ASSOC);
            if ($stmt->rowCount() > 0) { // character exists!
                //$this->ReturnStatusCode(true, "CHARACTER_FOUND", json_encode($rows, JSON_PRETTY_PRINT));
                echo json_encode($rows, JSON_PRETTY_PRINT);
            } else {
                $db = NULL;
                $this->ReturnStatusCode(true, "CHARACTER_NOT_FOUND", "CHARACTER_NOT_FOUND");
            }
        } catch (Exception $ex) {
            $db = NULL;
            echo $ex;
            $this->ReturnStatusCode(true, "CHARACTER_GET_ERROR", $ex);
        }
         $db = NULL;
    }
    
    private function GetCharacterByName($characterName) {
        try {
            $db = $this->connection;
            $qry = "SELECT * FROM `characters` WHERE `name` = :name ";
            $stmt = $db->prepare($qry);
            $stmt->bindValue(':name', $characterName, PDO::PARAM_STR);
            $stmt->execute();
            $rows = $stmt->fetch(PDO::FETCH_ASSOC);
            if ($stmt->rowCount() > 0) { // character exists!
                //$this->ReturnStatusCode(true, "CHARACTER_FOUND", json_encode($rows, JSON_PRETTY_PRINT));
                echo json_encode($rows, JSON_PRETTY_PRINT);
            } else {
                $db = NULL;
                $this->ReturnStatusCode(true, "CHARACTER_NOT_FOUND", "CHARACTER_NOT_FOUND");
            }
        } catch (Exception $ex) {
            $db = NULL;
            echo $ex;
            $this->ReturnStatusCode(true, "CHARACTER_GET_ERROR", $ex);
        }
        $db = NULL;
    }
    
}



?>