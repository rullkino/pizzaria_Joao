<%@page import="vo.Mensagem"%>
<%@page import="dao.MensagemDao"%>
<%@page import="vo.Pedido"%>
<%@page import="java.util.List"%>
<%@page import="dao.PedidoDAO"%>
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
		<div class="container " style="margin-top: 30px">
			<%
				if (!MensagemDao.getMensagens().isEmpty()) {
					Mensagem m = new Mensagem(MensagemDao.getMensagem());
			%>
			<div class="card text-white bg-<%=m.getAlerta()%> mb-3" id="mensagem"
				style="max-width: 25rem; align: center">
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

	</div>
	<div class="jumbotron text-center" style="margin-bottom: 0">


	</div>
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/scripts.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script>
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