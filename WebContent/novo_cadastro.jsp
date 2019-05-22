  
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
	<div class="jumbotron jumbotron-fluid"
		style="padding-top: 0px;  background-color: #c4ffd8;">
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
		</div>
		</nav>
		<div class="container" style="padding-top: 50px;">
			<span class="badge badge-pill badge-light" style="font-size: 50px;">Cadastro
				de cliente</span> <br>
			<hr>
			<br>
			<form action="NovoCadastroController" method="post">

				<div class="form-row">
					<div class="form-group col-md-12" style="text-align: left;">
						<label for="inputName" style="padding-left: 30%;">Nome</label> <input
							type="text" required class="form-control" name="nome"
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
						<label for="inputComplement">Complemento</label><input type="text"
							class="form-control" name="complemento"
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
				<button type="submit" class="btn btn-primary">Cadastrar</button>

			</form>

		</div>
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