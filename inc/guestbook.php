<?PHP
class Guestbook {
	private $database;
	
	function __construct() {
		$this->database = $GLOBALS["Database"];
	}	
	
	/*
	*
	* Kommentar eintragen
	* 
	* @param string $message  Text vom Benutzer
	* @param string $nickname  Name vom Benutzer
	* @return boolean
	*/
	public function insertComment($message,$nickname){
		return $this->database->query("INSERT INTO guestbook (message,nickname,createtime) VALUES (:message,:nickname,NOW());",array(":message" => $message,":nickname" => $nickname));
	}
	
	/*
	*
	* Kommentare auslesen
	* 
	* @return array
	*/
	public function getComments(){
		return $this->database->get("SELECT * FROM guestbook ORDER BY createtime DESC;");
	}
	
	/*
	*
	* Adminoption: Kommentar Löschen
	* 
	* @param integer $id  ID vom Eintrag
	* @return boolean
	*/
	public function deleteComment($id){
		$selComment = $this->database->get("SELECT message,nickname FROM guestbook WHERE id=:id LIMIT 1;",array(":id" => $id));
		if(count($selComment) == 1){
			return $this->database->query("DELETE FROM guestbook WHERE id=:id LIMIT 1",array(":id" => $id));
		}
		else{
			return false;
		}
	}	
	
}
?>