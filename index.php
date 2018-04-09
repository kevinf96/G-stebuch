<?PHP
	ini_set('display_errors', 1);
	ini_set('display_startup_errors', 1);
	error_reporting(E_ALL);
	
	//Session für den Login
	session_name("hp");
	session_start();
	
	//Config einlesen
	require_once "inc/config.php";
	
	//Database Class (selbst geschrieben)
	require_once "inc/database.php";
	$Database = new Database($mainConfig["database"][0],$mainConfig["database"][1],$mainConfig["database"][2],$mainConfig["database"][3]);
	
	//Cache Class (phpFastCache)
	require_once "inc/phpFastCache/vendor/autoload.php";
	use phpFastCache\CacheManager;
	CacheManager::setDefaultConfig([
		"path" => $mainConfig["cacheFolder"],
	]);
	$InstanceCache = CacheManager::getInstance('files');
	
	//Template Class (Twig)
	require_once "inc/Twig/vendor/autoload.php";
	$loader = new Twig_Loader_Filesystem("tpl");
	$twig = new Twig_Environment($loader, array(
		'debug' => false ,
		"cache" => $mainConfig["cacheFolder"],
	));
	$renderArray = array(
		"baseUrl" => $mainConfig["baseUrl"],
		"websiteTitle" => $mainConfig["websiteTitle"],
		"loggedIn" => !empty($_SESSION['userid']) ? true : false
	);
	
	//Seite laden per GET-Parameter "s"
	$actualPage = "guestbook";
	if(!empty($_GET['s']) && isset($pages[$_GET['s']])){
		$actualPage = $pages[$_GET['s']];
	}
	if (file_exists("pages/".$actualPage.".php")){
		require "pages/".$actualPage.".php";
	}
	if (file_exists("tpl/".$actualPage.".tpl")){
		$template = $twig->load($actualPage.".tpl");
		echo $template->render($renderArray);
	}
		
?>