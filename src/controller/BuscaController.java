package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class BuscaController
 */
@WebServlet("/BuscaController")
public class BuscaController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BuscaController() {
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
		// TODO Auto-generated method stub
		String acao = request.getParameter("acao");
		if (acao.equals("historico")) {
			HttpSession session = request.getSession();
			session.setAttribute("usuarioID", request.getParameter("codCliente"));
			response.sendRedirect("historico.jsp");
		} else if(acao.equals("pedido")) {
			HttpSession session = request.getSession();
			session.setAttribute("usuarioID", request.getParameter("codCliente"));
			response.sendRedirect("pedido.jsp");
		}
	}

}
