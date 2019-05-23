<%@page import="vo.Pizza"%>
<%@page import="dao.PizzaDAO"%>
<%@page import="dao.ItemPedidoDAO"%>
<%@page import="vo.ItemPedido"%>
<%@page import="jdk.nashorn.internal.runtime.ListAdapter"%>
<%@page import="javax.swing.text.MaskFormatter"%>
<%@page import="dao.ClienteDAO"%>
<%@page import="vo.Cliente"%>
<%@page import="dao.MensagemDao"%>
<%@page import="vo.Mensagem"%>
<%@page import="vo.MensagemVO"%>
<%@page import="java.text.SimpleDateFormat"%>
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
<style>
.lista {
	border: 1px solid red;
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
			if (request.getSession().getAttribute("usuarioID") == null) {
				MensagemDao.addMensagem((new MensagemVO("danger", "Pagina bloqueada")));
			}
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
	<%
		if (request.getSession().getAttribute("usuarioID") != null) {
			Integer codCliente = Integer.valueOf(request.getSession().getAttribute("usuarioID").toString());
			ClienteDAO cDao = new ClienteDAO();
			PedidoDAO pDao = new PedidoDAO();
			ItemPedidoDAO iDao = new ItemPedidoDAO();
			Cliente cliente = cDao.buscarCliente(codCliente);
			List<Pedido> pedidos;
			List<ItemPedido> itens;
			pedidos = pDao.listarPedidos(codCliente);
			SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
			SimpleDateFormat hf = new SimpleDateFormat("hh:mm a");
	%>

	<div class="row" style="border-top: 6px solid #c92a1c;">
		<div class="jumbotron-fluid col-sm-3"
			style="margin-bottom: 0px; padding: 2%; background-color: #baddba; text-align: left; font-size: 90%">
			<h3 style="font-weight: bold; color: #6d0606">
				Cliente nº
				<%=cliente.getId()%>
			</h3>
			<h5 style="font-weight: bold"><%=cliente.getNome()%></h5>
			<hr>
			<p class="lead">
			<h5 style="font-weight: bold; color: #6d0606">Informações do
				cliente</h5>
			<hr class="my-4">
			<h5 style="color: #6d0606">Endereço</h5>
			&nbsp;&nbsp;&nbsp;&nbsp;<%=cliente.getLogradouro()%><br>
			&nbsp;&nbsp;&nbsp;&nbsp;<strong style="font-weight: bold">nº:</strong><%=cliente.getNumero()%><br>
			&nbsp;&nbsp;&nbsp;&nbsp;<strong style="font-weight: bold">Complemento:</strong><%=cliente.getComplemento()%><br>
			&nbsp;&nbsp;&nbsp;&nbsp;<strong style="font-weight: bold">Bairro:</strong><%=cliente.getBairro()%><br>
			&nbsp;&nbsp;&nbsp;&nbsp;<strong style="font-weight: bold">Referência:</strong><%=cliente.getReferencia()%><hr
				class="my-4">
			<h5 style="color: #6d0606">Telefones:</h5>
			<%
				MaskFormatter formatar = new MaskFormatter();

					for (String tel : cliente.getTelefones()) {
						out.print("&nbsp;&nbsp;&nbsp;&nbsp;" + "(" + tel.substring(0, 2) + ")"
								+ tel.substring(2, (tel.length() - 4)) + "-"
								+ tel.substring((tel.length() - 4), tel.length()));
			%><br>
			<%
				}
			%>
			</p>
			<hr class="my-4">
			<button class="btn btn-warning btn-lg" style="font-color: #000000;"
				 data-toggle="modal" data-target="#exampleModal">Novo Pedido</button>
				 <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
		</div>
		<div class="containner col-sm-9">
			<div class="row" style="margin: 0; background-color: #d8ffd8;">


				<script>
	var i = 1;
    function escreve(){
		var txt_pre_definido = document.getElementById('x').value;
        var t= document.getElementById("texto").innerHTML += "<div class='lista' id='" +i+ "' onclick='apaga(" +i+ ")'>" + txt_pre_definido+"</div>";
        i++;
     }
                   
  function apaga(v){
    t.pop(v);
    document.getElementById(t).innerHTML="";
    }
</script>

				<input type="text" id="x" /> <input type="button" value="OK"
					onclick="escreve()" />

				<div id="texto" onclick="apaga();"></div>
			</div>
		</div>
	</div>
	<%
		}
	%>
	<div class="modal fade bd-example-modal-lg" id="exampleModal"
		tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<table id="dtVerticalScrollExample"
						class="table table-hover table-sm table-striped ">
						<thead class="thead-dark" data-spy="affix" data-offset-top="205">
							<tr>
								<th scope="col">ID</th>
								<th scope="col" style="text-align: left; padding-left: 50px">Nome</th>
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
								<th style="text-align: left; padding-left: 50px"><%=p.getNome()%></th>
								<td><%=p.getDescricao()%></td>
								<td>R$ <%=p.getValor()%></td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>


				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script>
		function novoitem(){
			var pizzaID = document.getElementById('x').value;
			var pizzaNome = document.getElementById('x').value;
			var quantidade = document.getElementById('x').value;
			var valor = document.getElementById('x').value;
			var t= document.getElementById("texto").innerHTML += "<div class='lista' id='" +i+ "' onclick='apaga(" +i+ ")'>" +pizzaID +"</div>";
			i++;
		}
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