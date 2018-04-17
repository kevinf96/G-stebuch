<?PHP
class Pagination{
	private $pageLimit = 10;
	private $data;
	public $totalPages;
	public $page;

	/*
	*
	* Construct
	* 
	* @param object $data  MySQL Objekt oder Array
	* @param integer $pageLimit  Einträge pro Seite (optional)
	*/		
	public function __construct($data,$pageLimit = null){
		if(!is_null($pageLimit)){
			$this->pageLimit = $pageLimit;
		}
		$this->data = $data;
		$this->totalPages = ceil(count($this->data) / $this->pageLimit);
	}

	/*
	*
	* Inhalt einer Seite auslesen
	* 
	* @param integer $page  Aktuelle Seite
	* @return array
	*/		
	public function getPage($page){
		$this->page = $page > $this->totalPages ? $this->totalPages : $page;
		$this->page = $this->page <= 0 ? 1 : $this->page;
		$offset = ($this->page - 1)  * $this->pageLimit;	
		$pageArray = array();
		for($i = $offset;$i < $this->pageLimit*$this->page;$i++){
			if(isset($this->data[$i])){
				$pageArray[] = $this->data[$i];
			}
		}
		return $pageArray;
	}

	/*
	*
	* Start und End-Offsets liefern
	* 
	* @param integer $page  Aktuelle Seite
	* @return array
	*/		
	public function getLimit($page){
		$this->page = $page > $this->totalPages ? $this->totalPages : $page;
		$this->page = $this->page <= 0 ? 1 : $this->page;
		$offset = ($this->page - 1)  * $this->pageLimit;
		return array($offset,$this->pageLimit*$this->page);
	}
}
?>