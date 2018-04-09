{% extends "index.tpl" %}
{% block content %}
		<div class="container">
			<div class="row justify-content-md-center">
				<div class="col-md-4">
					<div class="card">
						<div class="card-header">Ausloggen</div>
						<div class="card-body">
						{% if loggedIn %}
							<div class="alert alert-success" role="alert">Sie werden nun abgemeldet und zur Startseite weitergeleitet.</div>
							<meta http-equiv="refresh" content="2; URL={{ baseUrl }}" />
						{% else %}
							<div class="alert alert-danger" role="alert">Sie sind nicht angemeldet</div>
						{% endif %}						
						</div>
					</div>
				</div>
			</div>
		</div>
{% endblock %}