<?PHP
require_once __DIR__ . "/../inc/guestbook.php";

if(!empty($_SESSION['userid'])){
	$Guestbook = new Guestbook;
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