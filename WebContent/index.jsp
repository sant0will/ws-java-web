<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html lang="pt-br">
	<head>
		<meta charset="UTF-8">
		<title>Projeto Web</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
		<link rel="stylesheet" href="css/style.css">
		<link href="css/animate.css" rel="stylesheet">
		<style type="text/css">
			@import url('https://fonts.googleapis.com/css?family=Open+Sans:400,800');
			@import url('https://fonts.googleapis.com/css?family=Chela+One');			
			
			.header{
			background-image: url('https://www.fcinq.com/v3/wp-content/uploads/home.jpg');
			background-repeat: no-repeat;
			background-attachment: fixed;
			height: 800px;
			}
			.top-title{
				text-align: center;
				color: #fff;
				text-transform: uppercase;
				margin-top: 150px;
			}
			.top-title h1{
			font-family: 'Chela One', cursive;
			}
			.menu{
			padding: 50px;
			padding-top: 200px;
			box-sizing: border-box;
			-webkit-box-sizing: border-box;
			-moz-box-sizing: border-box;
			background: #d83f87;
			height: 510px;
			opacity:1;
			position: relative;
			z-index: 5;
			transition: background .2s linear;
			-webkit-transition: background .2s linear;
			-moz-transition: background .2s linear;
			-ms-transition: background .2s linear;
			-o-transition: background .2s linear;
			}
			.menu a:hover{
			text-decoration: none;
			}
			.menu li{
			list-style: none;
			}
			.menu li a{
			color: #fff;
			display: block;
			font-family: 'Open Sans', sans-serif;
			font-weight:800;
			font-size: 25px;
			position: relative;
			text-transform: uppercase;
			}
			.mh-1:hover .menu{
			background: #ddd;
			z-index: 12;
			overflow: hidden;
			}
			.menu a:hover::before {
			left: -20px;
			width: 15px;
			}
			.menu a::before{
			background: #fff;
			bottom: 6px;
			content: "";
			display: block;
			left: 5px;
			height: 1px;
			position: absolute;
			transition: all .2s ease-out;
			-webkit-transition: all .2s ease-out;
			-moz-transition: all .2s ease-out;
			-ms-transition: all .2s ease-out;
			-o-transition: all .2s ease-out;
			width: 0;
			}
			/* EFFECTS
			***************/
			
			.glow {
			  text-shadow: 0 0 0 rgba(0, 0, 0, 0);
			    -webkit-transition: text-shadow 1s linear;
			       -moz-transition: text-shadow 1s linear;
			         -o-transition: text-shadow 1s linear;
			            transition: text-shadow 1s linear;
			}
			
			.glow.in {
			  text-shadow: 
			    0.025em 0.025em 0.025em rgba(0, 0, 0, 0.8),
			    0 0 0.5em rgba(255, 255, 255, 0.3);
			}
			
			.fade {
			  opacity: 0;
			    -webkit-transition: opacity 1s linear;
			       -moz-transition: opacity 1s linear;
			         -o-transition: opacity 1s linear;
			            transition: opacity 1s linear;
			}
			
			.fade.in {
			  opacity: 1;
			}		
		</style>
	</head>
	<body>
		<div class="header">
			<div class="container">
				<div class="row">
					<div class="col-md-8">
						<div class="top-title">
							<h1 class="animated infinite bounceInDown">Projeto Web Service</h1>
							<h6 class="logo-title animated pulse">Cadastro e listagem de usuários</h6>
						</div>
					</div>
					<div class="col-md-4">
						<div class="menu">
							<li class="f-item-1"><a href="create_user.jsp">Cadastro</a></li>
							<li class="f-item-2"><a href="show_users.jsp">Visualização</a></li>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script>
		<script>
			$(document).ready(function(){
				$( ".f-item-1" ).hover(function() {
					$('.menu').css("background-color", "#8165a6");
					}, function(){
					$('.menu').css("background-color", "#d83f87");
					});
				// f-item-2
				$( ".f-item-2" ).hover(function() {
					$('.menu').css("background-color", "#735ed5");
					}, function(){
					$('.menu').css("background-color", "#d83f87");
					});
			});
		</script>
	</body>
<footer></footer>
</html>