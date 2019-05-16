<%@page import="vo.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="dao.ClienteDAO"%>
<%@page import="dao.Mensagem"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<style>
	#batata{
	margin-left:100px;
	text-align:left;
	padding-left:70px;
	}
	
	</style>
	
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>JooJ's Pizzas</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css">

</head>
<body>
	<div class="jumbotron jumbotron-fluid"
		style="padding: 0px;  background-color: #c4ffd8;">
		<img alt="Logo" src="img/pizza_slice.png" width="100%" />
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark"
			style="border-bottom: 6px solid #c92a1c;"> <a
			class="navbar-brand" href="inicial.jsp">Início</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link"
					href="novo_cadastro.jsp">Novo Cadástro</a></li>
				<li class="nav-item"><a class="nav-link" href="buscar.jsp">Buscar</a></li>
				<li class="nav-item"><a class="nav-link" href="cardapio.jsp">Cardápio</a></li>
			</ul>
			<hr>
				<input class="form-control col-md-2" type="search" id="buscar"
					placeholder="Search" aria-label="Search">
		</div>
		</nav>
		<div class="container" style="margin-top: 30px"></div>
		
		
		<div class="container col-md-12" style="margin-top: 30px">
		<br/>
			<table id="dtVerticalScrollExample"
					class="table table-hover table-sm table-striped ">
					<thead class="thead-dark">
				    <tr>
				      <th  scope="col">Nome completo</th>
				      <th scope="col">Endereço</th>
				      <th scope="col">Ações</th>
				    </tr>
				  </thead>
				  <tbody id="tabelaClientes">
				    <% 
					ClienteDAO cDAO = new ClienteDAO();
				    List<Cliente> cli = cDAO.listarTodos();
					//percorre a lista preenchendo as opções do select
					for (Cliente c : cli) {				    
				    %>
				    <tr>
				     <th scope="row" id="batata"><%out.print(c.getNome());%></th> </center>
				     <td id="batata"><%out.print("Bairro"+" "+c.getBairro() + " ," + c.getLogradouro() +" ," +"Nº"+" "+c.getNumero());%></td>
				      
				      <td>
				      </td>
				    </tr>
				    <%
				    	} %>
				  </tbody>
				</table>
			
		</div>
	</div>
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/scripts.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script>
		$(document).ready(function(){
		  $("#buscar").on("keyup", function() {
		    var value = $(this).val().toLowerCase();
		    $("#tabelaClientes tr").filter(function() {
		      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		    });
		  });
		});
		function excluir(codContato) {
			$("#codContato").val(codContato);
			$("#acao-table").val("excluir");
		}

		function cancelar() {
			//limpa os campos
			$("#codContatoEditar").val("");
			$("#nome").val("");
			$("#telefone").val("");
			$('#operadoras').val("");

			//retorna para o modo inserir
			$('#codContatoEditar').val("inserir");
		}
		function editar(codContato, nome, telefone, operadora) {
			$("#codContatoEditar").val(codContato);
			$("#nome").val(nome);
			$("#telefone").val(telefone);
			$('#operadoras').val(operadora);

			//outros meios de selecionar option no select
			//document.getElementById('operadoras').options[operadora].selected = true;
			//$('#operadoras option[value="' + operadora + '"]').attr({ selected : "selected" });

			$('#acaoForm').val("editar");
		}
		function novaOperadora() {
			window.open("nova-operadora.jsp");
		}
	</script>
	
	
</body>
</html>