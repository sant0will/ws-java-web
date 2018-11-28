<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Projeto Web</title>	
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<style type="text/css">
	body{
	    background-color: #525252;
	}
	.centered-form{
		margin-top: 60px;
	}
	
	.centered-form .panel{
		background: rgba(255, 255, 255, 0.8);
		box-shadow: rgba(0, 0, 0, 0.3) 20px 20px 20px;
	}
	</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="#"> 
			 PROJETO
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar1" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbar1">
			<ul class="navbar-nav ml-auto"> 
			<li class="nav-item active">
				<a class="nav-link" href="http://localhost:8080/ProjetoWeb/">Home</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="http://localhost:8080/ProjetoWeb/create_user.jsp"> Cadastro </a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="http://localhost:8080/ProjetoWeb/show_users.jsp"> Visualização </a>
			</li>
		
		    </ul>
	  	</div>
	</nav>
	<div class="container">	
        <div class="row centered-form">
	        <div class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4">
	        	<div class="panel panel-default">
	        		<div class="panel-heading">
			    		<h3 class="panel-title">Insira as informações necessárias</h3>
			    		<div style="color: #FF0000;">${errorMessage}</div>
						<div style="color: #00FF00;">${successMessage}</div>
			 		</div>
		 			<div class="panel-body">
			    		<form role="form" action="http://localhost:8080/ProjetoWeb/store" method="post">
			    			<div class="row">
			    				<div class="col-xs-6 col-sm-6 col-md-6">
			    					<div class="form-group">
			                			<input type="text" name="first_name" id="first_name" class="form-control input-sm" placeholder="Nome">
			    					</div>
			    				</div>
			    				<div class="col-xs-6 col-sm-6 col-md-6">
			    					<div class="form-group">
			    						<input type="text" name="last_name" id="last_name" class="form-control input-sm" placeholder="Sobrenome">
			    					</div>
			    				</div>
			    			</div>
		
			    			<div class="form-group">
			    				<input type="email" name="email" id="email" class="form-control input-sm" placeholder="Email">
			    			</div>
			    			
			    			<div class="form-group">
			    				<input type="phone" name="phone" id="phone" class="form-control input-sm" placeholder="Telefone">
			    			</div>
			    			
			    			<input type="submit" value="Enviar" class="btn btn-info btn-block">

			    		
			    		</form>
			    	</div>
		    	</div>
	    	</div>
    	</div>
    	
    </div>
</body>
</html>