package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Mensagem;
import dao.PizzaDAO;
import vo.MensagemVO;

/**
 * Servlet implementation class CardapioController
 */
@WebServlet("/CardapioController")
public class CardapioController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CardapioController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("acao").equals("excluir")&& !request.getParameter("pizzaID").equals("")) {
			Integer pizzaID = Integer.valueOf(request.getParameter("pizzaID"));
			PizzaDAO pDao = new PizzaDAO();
			try {
				if(pDao.excluirPizza(pizzaID)) {
					MensagemVO m = new MensagemVO();
					m.setAlerta("sucesso");
					m.setMsg("Pizza cadastrada com sucesso");
					Mensagem.addMensagem(m);
					response.sendRedirect("cardapio.jsp");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				
				MensagemVO m = new MensagemVO();
				m.setAlerta("sucesso");
				m.setMsg("Erro ao registrar Pizza");
				Mensagem.addMensagem(m);
				response.sendRedirect("cardapio.jsp");
			}
		}else {
			response.sendRedirect("cardapio.jsp");
		}
	}

}
