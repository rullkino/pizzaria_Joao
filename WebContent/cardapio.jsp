<%@page import="dao.PizzaDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.Pizza"%>
<%@page import="java.util.List"%>
<%@page import="dao.Mensagem"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>JooJ's Pizzas</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css">

</head>
<body>
	<div class="container col-md-12"
		style="margin: 0; padding: 0; margin:0px">

		<div class="jumbotron jumbotron-fluid"
			style="padding: 0px; margin: 0;">
			<img alt="Logo" src="img/pizza_slice.png" width="100%" />
		</div>

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

			<input class="form-control col-md-2" id="myInput" type="search"
				placeholder="Pesquisar">
			<hr>
			<button type="button" class="btn btn-outline-success"
				data-toggle="modal" data-target="#novaPizzaModal">Nova
				Pizza</button>
		</div>
		</nav>


		<div class="modal fade" id="novaPizzaModal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header modal-lg">
						<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body modal-lg">
						<form action="NovoCadastroController" method="post">

							<div class="form-row">
								<div class="form-group col-md-12" style="text-align: left;">
									<label for="inputName" style="padding-left: 30%;">Nome</label>
									<input type="text" required class="form-control" name="nome"
										placeholder="Nome">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-8">
									<label for="inputAddress">Logradouro</label> <input type="text"
										required class="form-control" name="logradouro"
										placeholder="Rua / Alameda / Avenida /etc...">
								</div>
								<div class="form-group col-md-4">
									<label for="inputNumber">Número</label> <input type="number"
										class="form-control" name="numero" min="0">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-8">
									<label for="inputComplement">Complemento</label><input
										type="text" class="form-control" name="complemento"
										placeholder="Apto. / Lado A">
								</div>
								<div class="form-group col-md-4">
									<label for="inputBairro">Bairro</label> <input type="text"
										class="form-control" name="bairro">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-12">
									<label for="input">Referência</label> <input type="text"
										class="form-control" name="referencia"
										placeholder="Ao lado da padaria ....">
								</div>
							</div>
					</div>
					<div class="modal-footer ">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Cancelar</button>
						<button type="submit" class="btn btn-outline-success">Salvar
							Nova Pizza</button>
					</div>
				</div>
			</div>
		</div>
		<div class="container col-md-12"
			style="padding: 0px; margin: 0px; background-color: #c4ffd8;">
			<form id="form-table" action="CardapioController" method="post">
				<input type="hidden" name="acao" id="acaoForm" value="excluir" />

				<table id="dtVerticalScrollExample"
					class="table table-hover table-sm table-striped ">
					<thead class="thead-dark">
						<tr>
							<th scope="col">ID</th>
							<th scope="col">Nome</th>
							<th scope="col">Descrição</th>
							<th scope="col">Preço</th>
							<th scope="col"></th>
						</tr>
					</thead>
					<tbody id="myTable">
						<%
							PizzaDAO pDao = new PizzaDAO();
							List<Pizza> lista = pDao.retornaCardapio();

							if (lista.isEmpty()) {
								out.print("<tr><td colspan=3>Não há contatos</td></tr>");
							}
							for (Pizza p : lista) {
						%>
						<tr>
							<td><%=p.getPizzaID()%></td>
							<td><%=p.getNome()%></td>
							<td><%=p.getDescricao()%></td>
							<td>R$ <%=p.getValor()%></td>
							<td><input type="hidden" name="pizzaID" id="pizzaID" /> <input
								type="submit" value="Excluir"
								onclick="return excluirItem(<%out.print(p.getPizzaID());%>)" /></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
			</form>


		</div>
	</div>
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/scripts.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script>
	$(document).ready(function(){
		  $("#myInput").on("keyup", function() {
		    var value = $(this).val().toLowerCase();
		    $("#myTable tr").filter(function() {
		      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		    });
		  });
		});
	function excluirItem(pizzaID){
		if(confirm("Deseja realmente excluir?")){
			$("#pizzaID").val(pizzaID);
			$("#acaoForm").val("excluir");
			$("#form-table").submit();	
		}
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