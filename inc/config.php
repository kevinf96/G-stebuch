<?PHP
	$mainConfig = array(
		"baseUrl" => "https://website.com", //Link zur Webseite wo das Script ausgeführt wird
		"database" => array("localhost","root","pw","database"), //MySQL Verbindung (Host/IP,Benutzer,Passwort,Datenbank)
		"websiteTitle" => "Gästebuch", //Titel der Webseite
		"cacheFolder" => "/www/cache"  //Pfad zum Cache Ordner
	);

	//Hier können Seiten hinzugefügt werde
	//Beispiel: https://webseite.com/page/admin lädt adminpanel.php/.tpl
	$pages = array(
		"guestbook" => "guestbook",
		"admin" => "adminpanel",
		"logout" => "logout",
		"info" => "information",
		"ajax" => "ajax"
	);
?>
