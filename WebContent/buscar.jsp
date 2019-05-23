<%@page import="vo.Mensagem"%>
<%@page import="vo.MensagemVO"%>
<%@page import="dao.MensagemDao"%>
<%@page import="vo.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="dao.ClienteDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>JooJ's Pizzas</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css">
<style>
#batata {
	margin-left: 100px;
	text-align: left;
	padding-left: 70px;
}
</style>

</head>
<body>
<div class="container col-md-12"
		style="margin: 0; padding: 0; margin-top: 85px">

		<div class="jumbotron jumbotron-fluid"
			style="padding: 0px; margin: 0;">
			<img alt="Logo" src="img/pizza_slice.png" width="100%" />
		</div>

		<nav class="navbar fixed-top navbar-expand-sm bg-dark navbar-dark"
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
				<li class="nav-item"><a class="nav-link" href="buscar.jsp">Clientes</a></li>
				<li class="nav-item"><a class="nav-link" href="cardapio.jsp">Cardápio</a></li>
			</ul>
		</div>
		</nav>
	<%
			if (!MensagemDao.getMensagens().isEmpty()) {
				Mensagem m = new Mensagem(MensagemDao.getMensagem());
		%>
		<div class="card text-white bg-<%=m.getAlerta()%> mb-3" id="mensagem"
			style="max-width: 25rem; align:center">
			<div class="card-body">
				<h5 class="card-title">Erro</h5>
				<p class="card-text"><%=m.getMsg()%></p>
			</div>

			<script>
					setTimeout(() => {
						$("#mensagem").toggle(250);
					}, 4000);
				</script>
		</div>
	</div>
	<%
		}
	%>
	<div class="container col-md-12" style="margin: 0px; padding: 0;background-color: #c4ffd8;">

		<form action="BuscaController" method="post">
			<input type="hidden" name="acao" id="acao-table" value="inserir" />
			<input type="hidden" name="codCliente" id="codCliente" />
			<table id="dtVerticalScrollExample"
				class="table table-hover table-sm table-striped " style="margin: 0;">
				<thead class="thead-dark">
					<tr>
						<th scope="col" style="text-align: left; padding-left: 70px">Nome
							completo</th>
						<th scope="col" style="text-align: left; padding-left: 70px">Endereço</th>
						<th scope="col" style="text-align: left; padding-left: 70px">Ações</th>
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
						<th scope="row" id="batata">
							<%
								out.print(c.getNome());
							%>
						</th>
						</center>
						<td id="batata">
							<%
								out.print(
											c.getLogradouro() + " , " + "Nº" + " " + c.getNumero() + " ," + "Bairro" + " " + c.getBairro());
							%>
						</td>
						<td>
							<button type="submit" class="btn btn-success"
								onclick="pedido(<%out.print(c.getId());%>)">Novo pedido</button>
							<button type="submit" class="btn btn-secondary"
								onclick="historico(<%out.print(c.getId());%>)">Histórico
								de pedidos</button>
						</td>
					</tr>
					<%
						}
					%>

				</tbody>
			</table>
		</form>
	</div>
	<a href="novo_cadastro.jsp" class="list-group-item-success">Sem
		resultados? Clique para cadastrar novo cliente.</a>
	</div>
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script>
		$(document)
				.ready(
						function() {
							$("#buscar")
									.on(
											"keyup",
											function() {
												var value = $(this).val()
														.toLowerCase();
												$("#tabelaClientes tr")
														.filter(
																function() {
																	$(this)
																			.toggle(
																					$(
																							this)
																							.text()
																							.toLowerCase()
																							.indexOf(
																									value) > -1)
																});
											});
						});
		function historico(codCliente) {
			$("#codCliente").val(codCliente);
			$("#acao-table").val("historico");
		}
		function pedido(codCliente) {
			$("#codCliente").val(codCliente);
			$("#acao-table").val("pedido");
		}
	</script>
</body>
</html>