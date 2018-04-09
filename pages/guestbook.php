<?PHP
require_once __DIR__ . "/../inc/guestbook.php";

$Guestbook = new Guestbook;
if(isset($_POST["commentSubmit"])){
	if(!empty($_POST["message"]) && !empty($_POST["nickname"])){
		if(strlen($_POST["nickname"])>=3 && strlen($_POST["nickname"]) <= 30){
			$insertComment = $Guestbook->insertComment($_POST["message"],$_POST["nickname"]);
			if($insertComment){
				$returnArray = array("success" => true,"text" => "Das Kommentar wurde erfolgreich eingetragen");
				$InstanceCache->deleteItem("getComments");
			}
			else{
				$returnArray = array("success" => false,"text" => "Fehler beim Eintragen in die Datenbank.");
			}
		}
		else{
			$returnArray = array("success" => false,"text" => "Der Benutzername muss zwischen 3 und 30 Zeichen liegen");
		}
	}
	else{
		$returnArray = array("success" => false,"text" => "Es müssen alle Felder ausgefüllt werden");
	}
	$renderArray["formResult"] = $returnArray;
}

$commentCache = $InstanceCache->getItem("getComments");
if (is_null($commentCache->get())) {
	$getComments = $Guestbook->getComments();
	
	$commentCache->set($getComments)->expiresAfter(60*60*24);
	$InstanceCache->save($commentCache);
	$renderArray["comments"] = $getComments;
}
else{
	$renderArray["comments"] = $commentCache->get();
}
?>