<?PHP
require_once __DIR__ . "/../inc/guestbook.php";

if(isset($_POST["loginSubmit"])){
	if(!empty($_POST["username"]) && !empty($_POST["password"])){
		$param = array(
			":username" => $_POST["username"],
			":password" => $_POST["password"]
		);
		$selAccount = $Database->get("SELECT id,username FROM account WHERE username=:username AND password=PASSWORD(:password) LIMIT 1;",$param);
		if(count($selAccount) == 1){
			$getAccount = $selAccount[0];
			$_SESSION['userid'] = $getAccount->id;
			$_SESSION['username'] = $getAccount->username;
			$returnArray = array("success" => true,"text" => "Sie haben sich erfolgreich angemeldet und werden nun weitergeleitet");
			$InstanceCache->deleteItem("getComments");
		}
		else{
			$returnArray = array("success" => false,"text" => "Benutzername oder Passwort falsch");
		}
	}
	else{
		$returnArray = array("success" => false,"text" => "Alle Felder müssen ausgefüllt werden");
	}
	$renderArray["formResult"] = $returnArray;
}

if(!empty($_SESSION['userid'])){
	$Guestbook = new Guestbook;
	$renderArray["comments"] = $Guestbook->getComments();
	$renderArray["commentCount"] = count($renderArray["comments"]);
	
	if(!empty($_GET["delete"]) && is_numeric($_GET["delete"])){
		$deleteComment = $Guestbook->deleteComment($_GET["delete"]);
		$jsonArray = array("boolean" => $deleteComment);
		if($deleteComment){
			$jsonArray["message"] = "Das Kommentar wurde erfolgreich entfernt";
		}
		else{
			$jsonArray["message"] = "Das Kommentar konnte nicht entfernt werden";
		}
		echo json_encode($jsonArray,JSON_PRETTY_PRINT);
	}
	
}

?>