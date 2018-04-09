{% extends "index.tpl" %}
{% block javascript %}
<script>
$(document).ready( function () {
    $('#commentTable').DataTable( {
		responsive: true,
        "language": {
			"search": "Suche:",
            "lengthMenu": "_MENU_ Einträge pro Seite",
            "zeroRecords": "Es sind keine Einträge vorhanden",
            "info": "Seite _PAGE_ von _PAGES_",
            "infoEmpty": "Es sind keine Einträge vorhanden",
            "infoFiltered": "(Gefiltert aus _MAX_ Einträgen)",
            "paginate": {
                first: "Erste",
                last: "Letzte",
                next: "Weiter",
                previous: "Zurück"
            },			
        }
    } );	
} );
</script>
{% endblock %}
{% block content %}
		<div class="container">	
			<div class="row justify-content-md-center">
				<div class="col">
					<div class="card">
					  <div class="card-header">
						Kommentar verfassen
					  </div>
					  <div class="card-body">
						{% if formResult is defined %}
							{% if formResult.success %}
								<div class="alert alert-success" role="alert">{{ formResult.text }}</div>
							{% else %}
								<div class="alert alert-danger" role="alert">{{ formResult.text }}</div>
							{% endif %}
						{% endif %}
						<form method="POST" action="{{ baseUrl }}/page/guestbook/">
							<div class="form-group">
								<label for="nameInput">Name:</label>
								<input type="text" class="form-control" id="nameInput" placeholder="Name" name="nickname">
							</div>			
							<div class="form-group">
								<label for="messageInput">Nachricht:</label>
								<textarea class="form-control" id="messageInput" rows="3" name="message"></textarea>
							</div>
							<button type="submit" class="btn btn-primary" name="commentSubmit" >Absenden</button>
						</form>
					  </div>
					</div>			
				</div>
			</div>
			<div class="row">
				<div class="col">
					<div class="card">
						<div class="card-header">Kommentare</div>
						<div class="card-body">
							<table class="table" id="commentTable">
								<thead>
									<tr>
										<th>Benutzername</th>
										<th>Kommentar</th>
										<th>Zeitpunkt</th>
									</tr>
								</thead>
								<tbody>
									{% for comment in comments %}
									<tr>
										<td>{{ comment.nickname }}</td>
										<td>{{ comment.message }}</td>
										<td>{{ comment.createtime|date("d.m.Y") }}</td>
									</tr>
									{% endfor %}								
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
{% endblock %}