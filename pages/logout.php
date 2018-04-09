<?PHP
$sessions = array("userid","username");
foreach ($sessions as &$session) {
	if(!empty($_SESSION[$session])){
		unset($_SESSION[$session]);
	}
}
?>