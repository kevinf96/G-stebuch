{% extends "index.tpl" %}
{% block javascript %}
<script>
	$( ".deleteBtn" ).click(function() {
		var id = $(this).attr("data-src");
		$(this).parent().parent().fadeOut(500);
		$.ajax("{{ baseUrl }}/index.php?s=ajax&delete="+id, {
			success: function(data) {
				$(this).parent().parent().fadeOut(500);
			},
			error: function() {
				alert("Die Ajax-Abfrage konnte nicht ausgeführt werden");
			}
		});		
	});
</script>
{% endblock %}
{% block content %}
		<div class="container">	
			<div class="row justify-content-md-center">
				{% if loggedIn %}
				<div class="col-md-4">
					<div class="card">
						<div class="card-header">Adminpanel</div>
						<div class="card-body">
							<div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
								<a class="nav-link active" id="overview-tab" data-toggle="pill" href="#overview" role="tab" aria-controls="overview" aria-selected="true">Übersicht</a>
								<a class="nav-link" id="manageComments-tab" data-toggle="pill" href="#manageComments" role="tab" aria-controls="manageComments" aria-selected="false">Kommentare verwalten</a>
								<a class="nav-link" href="{{ baseUrl }}/page/logout/" >Abmelden</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-8">
					<div class="card">
						<div class="card-body">
							<div class="tab-content" id="v-pills-tabContent">
								<div class="tab-pane fade show active" id="overview" role="tabpanel" aria-labelledby="overview-tab">
									<div class="alert alert-info" role="alert">
										Es wurden insgesamt {{ commentCount }} Kommentare abgegeben
									</div>									
								</div>
								<div class="tab-pane fade" id="manageComments" role="tabpanel" aria-labelledby="manageComments-tab">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>Benutzername</th>
												<th>Nachricht</th>
												<th>Datum</th>
												<th>Aktion</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												{% for comment in comments %}
												<tr>
													<td>{{ comment.nickname }}</td>
													<td>{{ comment.message }}</td>
													<td>{{ comment.createtime|date("d.m.Y") }}</td>
													<td><button type="button" class="btn btn-danger deleteBtn" aria-label="Left Align" data-src="{{ comment.id }}">Löschen</button>
												</tr>
												{% endfor %}
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>				
				</div>
				{% else %}
				<div class="col-md-4">
					<div class="card">
						<div class="card-header">Admin-Login</div>
						<div class="card-body">
						{% if formResult is defined %}
							{% if formResult.success %}
								<div class="alert alert-success" role="alert">{{ formResult.text }}</div>
								<meta http-equiv="refresh" content="2"/>
							{% else %}
								<div class="alert alert-danger" role="alert">{{ formResult.text }}</div>
							{% endif %}
						{% endif %}						
							<form method="POST" action="{{ baseUrl }}/page/admin/">
								<div class="form-group">
									<label for="userInput">Benutzername</label>
									<input type="text" class="form-control" id="userInput" placeholder="Benutzername" name="username">
								</div>				
								<div class="form-group">
									<label for="passwordInput">Passwort</label>
									<input type="password" class="form-control" id="passwordInput" placeholder="Passwort" name="password">
								</div>
								<button type="submit" class="btn btn-primary" name="loginSubmit">Login</button>
							</form>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card">
						<div class="card-header">Daten für den Adminbereich</div>
						<div class="card-body">
							Benutzername: admin <br>
							Passwort: admin	<br>
						</div>
					</div>
				</div>				
				{% endif %}
			</div>
		</div>
{% endblock %}				