<!doctype html>
<html lang="de">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" href="{{ baseUrl }}/tpl/assets/css/main.css">
	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
    <title>{{ websiteTitle }}</title>
	{% block head %}
	{% endblock %}
	
  </head>
  <body>
  
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
      <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="{{ baseUrl }}">{{ websiteTitle }}</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="{{ baseUrl }}/page/info/">Allgemeine Infos</a>
            </li>		  
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="{{ baseUrl }}/page/guestbook/">Gästebuch</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="{{ baseUrl }}/page/admin/">Adminbereich</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" target="_blank" href="https://github.com/kevinf96/G-stebuch">Code ansehen</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <header class="bg-primary text-white">
      <div class="container text-center">
        <h1>{{ websiteTitle }}</h1>
        <p class="lead">Eine Art Gästebuch mit einem zusätzlichen Adminbereich um Kommentare zu löschen.</p>
      </div>
    </header>
	
	<section id="main-wrapper">
		{% block content %}
		{% endblock %}	
	</section>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	{% block javascript %}
	{% endblock %}
  </body>
</html>