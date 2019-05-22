<%@page import="dao.PizzaDAO"%>
<%@page import="vo.Pizza"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="dao.ItemPedidoDAO"%>
<%@page import="vo.ItemPedido"%>
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
			class="navbar-brand" href="inicial.jsp">In�cio</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link"
					href="novo_cadastro.jsp">Novo Cad�stro</a></li>
				<li class="nav-item"><a class="nav-link" href="buscar.jsp">Clientes</a></li>
				<li class="nav-item"><a class="nav-link" href="cardapio.jsp">Card�pio</a></li>
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
			PizzaDAO pzDao = new PizzaDAO();
			ItemPedidoDAO iDao = new ItemPedidoDAO();
			Cliente cliente = cDao.buscarCliente(codCliente);
			List<Pedido> pedidos;

			pedidos = pDao.listarPedidos(codCliente);
			SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
			SimpleDateFormat hf = new SimpleDateFormat("hh:mm a");
	%>

	<div class="row" style="border-top: 6px solid #c92a1c;">
		<div class="jumbotron-fluid col-sm-3"
			style="margin-bottom: 0px; padding: 2%; background-color: #baddba; text-align: left; font-size: 90%">
			<h3 style="font-weight: bold; color: #6d0606">
				Cliente n�
				<%=cliente.getId()%>
			</h3>
			<h5 style="font-weight: bold"><%=cliente.getNome()%></h5>
			<hr>
			<p class="lead">
			<h5 style="font-weight: bold; color: #6d0606">Informa��es do
				cliente</h5>
			<hr class="my-4">
			<h5 style="color: #6d0606">Endere�o</h5>
			&nbsp;&nbsp;&nbsp;&nbsp;<%=cliente.getLogradouro()%><br>
			&nbsp;&nbsp;&nbsp;&nbsp;<strong style="font-weight: bold">n�:</strong><%=cliente.getNumero()%><br>
			&nbsp;&nbsp;&nbsp;&nbsp;<strong style="font-weight: bold">Complemento:</strong><%=cliente.getComplemento()%><br>
			&nbsp;&nbsp;&nbsp;&nbsp;<strong style="font-weight: bold">Bairro:</strong><%=cliente.getBairro()%><br>
			&nbsp;&nbsp;&nbsp;&nbsp;<strong style="font-weight: bold">Refer�ncia:</strong><%=cliente.getReferencia()%><hr
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
			<a class="btn btn-warning btn-lg" style="font-color: #000000;"
				href="#" role="button">Novo Pedido</a>
		</div>
		<div class="containner col-sm-9">
			<div class="row" style="margin: 0; background-color: #d8ffd8;">
				<%
					DecimalFormat format = new DecimalFormat("###,##0.00");
						if (!pedidos.isEmpty()) {
							for (Pedido p : pedidos) {
								List<ItemPedido> itens = iDao.listarTodods(p.getPedidoID());
				%>
				<div class="modal fade" id="exampleModal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalScrollableTitle"
					aria-hidden="true">
					<div class="modal-dialog modal-dialog-scrollable modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalScrollableTitle">Detalhes
									do pedido</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body" style="text-align: left">
								<%
									for (ItemPedido i : itens) {

													Pizza pizza = pzDao.buscarPizza(i.getPizzaID());
													Double precoPizzas = pizza.getValor() * i.getQuantidade();
													Double desconto = (i.getValor() * i.getQuantidade()) - precoPizzas;
								%>
								<p>
									<b style="font-weight: bold"><%=pizza.getNome()%></b>&nbsp;&nbsp;-&nbsp;&nbsp;Qtde: <%=i.getQuantidade()%>&nbsp;&nbsp;&nbsp;R$<%
										out.print(format.format(precoPizzas));
									%>&nbsp;&nbsp;&nbsp;<b style="font-weight: bold; color: red">R$<%
										out.print(format.format(desconto));
									%>(desconto)
									</b><br> <b style="font-weight: bold; color: #079e00">Valor:
										R$<%out.print(format.format(precoPizzas));%></b>
								</p>
								<hr>
								<%
									}
								%>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Fechar</button>
							</div>
						</div>
					</div>
				</div>
				<div class="card border-success mb-3 "
					style="width: 19rem; margin: 15px;">
					<div class="card-header bg-transparent">
						Pedido
						<%=p.getPedidoID()%></div>
					<div class="card-body">
						<h5 class="card-title"></h5>
						<p class="card-text">
							Pizzas:
							<%=itens.size()%><br> Total:
							<%=format.format(p.getTotal())%>
						</p>
						<p class="card-text">
							<small class="text-muted">Pedido realizado em <%
								out.print(df.format(p.getData()));
							%> <br> as <%=hf.format(p.getHora())%></small>
						</p>
					</div>
					<div class="card-footer bg-transparent">
						<button type="button" class="btn btn-success" data-toggle="modal"
							data-target="#exampleModal">Exibir Pedido</button>
					</div>
				</div>


				<%
					}
						} else {
				%>
				<div class="jumbotron jumbotron-fluid"
					style="margin: 25%; margin-top: 10px; margin-bottom: 10px; background-color: #d8ffd8;">
					<div class="container">
						<h2 class="display">Este cliente ainda n�o possui pedidos!</h2>
						<p class="lead">
							<a href="pedido.jsp">Clique aqui para fazer o primeiro
								pedido.</a>
						</p>
					</div>
				</div>
				<%
					}
				%>
			</div>
		</div>
	</div>



	<%
		}
	%>
	<script src="js/jquery-3.3.1.min.js"></script>
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