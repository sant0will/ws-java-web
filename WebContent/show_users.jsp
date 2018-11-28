<%@page import="org.json.*"%>
<%@page import="java.net.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

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
	.custab{
	    border: 1px solid #ccc;
	    padding: 5px;
	    margin: 5% 0;
	    box-shadow: 3px 3px 2px #ccc;
	    transition: 0.5s;
	}
	table{
		background-color: transparent;
	}
	</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="http://localhost:8080/ProjetoWeb/"> 
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
				<a class="nav-link" href="http://localhost:8080/ProjetoWeb/show_users.jsp"> Vsualização </a>
			</li>
		
		    </ul>
	  	</div>
	</nav>
	<div class="container">	
        <div class="row centered-form">
	        <div class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4">
			    <table class="table table-bordered">
				    <thead class="thead-dark">
				        <tr>
				            <th>Nome</th>
				            <th>Sobrenome</th>
				            <th>Email</th>
				            <th>Telefone</th>
				        </tr>
				    </thead>
				    <tbody>
				    <%
				    	final int HTTP_COD_SUCESSO = 200;
			    		URL url = new URL("https://apicadastro.herokuapp.com/api/users");
			            HttpURLConnection con = (HttpURLConnection) url.openConnection();
			 
			            if (con.getResponseCode() != HTTP_COD_SUCESSO) {
			                throw new RuntimeException("HTTP error code : "+ con.getResponseCode());
			            }
			 
			            BufferedReader br = new BufferedReader(new InputStreamReader((con.getInputStream())));			            
			            StringBuilder sb = new StringBuilder();	
			            
			            String line;
			            while ((line = br.readLine()) != null) {
			            	sb.append(line);
			            }				           
			            
			            String[] exploded = sb.toString().replace("[", "").replace("]", "").split("},");
			            System.out.println (exploded[0]); 
			            ArrayList<JSONObject> arrays = new ArrayList<JSONObject>();
			            for (int i = 0; i < exploded.length; i++) {
			            	if(i != exploded.length-1) {
								arrays.add(new JSONObject(exploded[i]+"}"));
			            	}else {
			            		arrays.add(new JSONObject(exploded[i]));
			            	}							
						}
			            
						String result = "";
						for (int i = 0; i < arrays.size(); i++) {
							JSONObject object = arrays.get(i);
							
							%>
					            <tr class="table-light">
					                <td><%= object.getString("first_name") %></td>
					                <td><%= object.getString("last_name") %></td>                
					                <td><%= object.getString("phone") %></td>
					                <td><%= object.getString("email") %></td>
					            </tr>
					            
					        <% 					
						}		
	            
	            		con.disconnect(); 
	            	%>			            
			       </tbody>
			    </table>
			   </div>
    	</div>    	
    </div>
</body>
</html>    