{% extends "index.tpl" %}
{% block javascript %}
{% endblock %}
{% block content %}
		<div class="container">	
			<div class="row justify-content-md-center">
				<div class="col">
					<div class="card">
					  <div class="card-header">
						Informationen zum Projekt
					  </div>
					  <div class="card-body">
						<table class="table table-striped">
							<tbody>
								<tr><td>PHP Version</td> <td>7.0</td> </tr>
								<tr><td>HTML/CSS Framework</td> <td><a href="https://getbootstrap.com/" target="_blank">Bootstrap 4.0</a></td> </tr>
								<tr><td>Cache-Class</td> <td><a href="https://www.phpfastcache.com/" target="_blank">phpFastCache</a></td> </tr>
								<tr><td>Template-Engine</td> <td><a href="https://twig.symfony.com/" target="_blank">Twig 2.0</a></td> </tr>
								<tr><td>Datenbank</td> <td>MySQL</td> </tr>
							</tbody>
						</table>
						<h2>Features</h2>
							<ul class="list-group list-group-flush">
								<li class="list-group-item">Gäste können Kommentare abgeben</li>
								<li class="list-group-item">Admin kann Kommentare löschen</li>
								<li class="list-group-item">Kommentare werden im Cache gespeichert bis ein neues Kommentar abgegeben wird</li>
								<li class="list-group-item">HTML und PHP voneinander getrennt durch Template-Engine</li>
								<li class="list-group-item">Seiten können manuell leicht angelegt werden</li>
								<li class="list-group-item">Durch Datenbank-Klasse mit "Prepared Statements" keine SQL-Injection möglich</li>
								<li class="list-group-item">Durch Template-Engine spart man sich das Escapen für eine XSS-Injection</li>
								<li class="list-group-item">Mit Bootstrap ist die Seite auch für mobile Geräte angepasst</li>
							</ul>					
					  </div>
					</div>			
				</div>
			</div>
		</div>
{% endblock %}