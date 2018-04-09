<?PHP
class Database extends PDO {
	private $db;
	/*
	*
	* Construct
	* 
	* @param string $host  MySQL Ip-Adresse
	* @param string $user  MySQL Benutzer
	* @param string $passwd  MySQL Passwort
	* @param string $database  MySQL Datenbank
	* @param string $port  MySQL Port (Optional)
	*/		
	public function __construct($host,$user,$passwd,$database,$port = 3306) {
		try
		{
			$this->db = new PDO("mysql:host=$host;port=$port;charset=utf8;dbname=$database", $user, $passwd);
			$this->db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			$this->db->exec("set names utf8");
		}
		catch (PDOException $e)
		{
			exit( "Verbindung zur Datenbank konnte nicht hergestellt werden");
		}	
	}
	/*
	*
	* Query ausführen
	* 
	* @param string $query  Query Text
	* @param array $param  Prepared statements array
	* @return boolean
	*/	
	public function query($query, $param = array()) {
		if(empty($query))
			return;	
		return $this->db->prepare($query)->execute($param);
	}
	/*
	*
	* Auslesen
	* 
	* @param string $query  Query Text
	* @param array $param  Prepared statements array
	* @return object
	*/		
	public function get($query, $param = array()) {
		if(empty($query))
			return array();
		$result = $this->db->prepare($query);
		$result->execute($param);
		$result = $result->fetchAll(PDO::FETCH_OBJ);
		return $result;
	}
	/*
	*
	* MySQL Verbindung schließen
	*/		
	public function delete(){
		$this->db = null;
	}	
}
?>