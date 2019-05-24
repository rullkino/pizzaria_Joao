package controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.org.apache.xml.internal.security.utils.JavaUtils;
import com.sun.org.apache.xml.internal.utils.IntVector;

import dao.ClienteDAO;
import dao.ItemPedidoDAO;
import dao.MensagemDao;
import dao.PedidoDAO;
import vo.ItemPedido;
import vo.MensagemVO;
import vo.Pedido;

/**
 * Servlet implementation class PedidoController
 */
@WebServlet("/PedidoController")
public class PedidoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PedidoController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String clienteId = request.getSession().getAttribute("usuarioID").toString();
		String[] valor = request.getParameterValues("valor");
		String[] quantidade = request.getParameterValues("quantidade");
		String[] pizzaID = request.getParameterValues("codpizza");
		Double totalPedido = 0.0;
		
		
		

		Pedido p = new Pedido();
		Date data = new Date(System.currentTimeMillis());
		Time hora = new Time(System.currentTimeMillis());
		p.setClienteID(Integer.valueOf(clienteId));
		p.setTotal(totalPedido);
		p.setData(data);
		p.setHora(hora);

		List<ItemPedido> itens = new ArrayList<ItemPedido>();
		System.out.println("valor:"+ valor.length+" quantidade :"+ quantidade.length+" pizza_id:"+pizzaID.length +"val:"+itens.size());
		for (int i = 0; i < pizzaID.length; i++) {
			if(Integer.valueOf(quantidade[i]) > 0){
				ItemPedido item = new ItemPedido();
				item.setPizzaID(Integer.valueOf(pizzaID[i]));
				item.setQuantidade(Integer.valueOf(quantidade[i]));
				item.setValor(Double.valueOf(valor[i]));
				itens.add(item);
				totalPedido += Double.valueOf(valor[i]);
			}
		}
		System.out.println("valor:"+ valor.length+" quantidade :"+ quantidade.length+" pizza_id:"+pizzaID.length +"val:"+itens.size());
		PedidoDAO pDao = new PedidoDAO();
		ItemPedidoDAO iDao = new ItemPedidoDAO();
		try {
			int codPedido = pDao.novoPedido(p);
			if (codPedido >0) {
				
				if (iDao.inseriPedido(itens,codPedido)) {
					MensagemDao.addMensagem(new MensagemVO("success", "Pedido inserido com sucesso!"));
					response.sendRedirect("historico.jsp");
				} else
					MensagemDao.addMensagem(new MensagemVO("danger", "erro ao salvar!"));
			} else {
				MensagemDao.addMensagem(new MensagemVO("danger", "erro ao salvar!"));
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			MensagemDao.addMensagem(new MensagemVO("danger", "erro ao salvar!"));
			response.sendRedirect("pedido.jsp");
			e1.printStackTrace();
		}
	}
}
