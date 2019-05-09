package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ClienteDAO;
import dao.Mensagem;
import vo.Cliente;
import vo.MensagemVO;

/**
 * Servlet implementation class NovoCadastroController
 */
@WebServlet("/NovoCadastroController")
public class NovoCadastroController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NovoCadastroController() {
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
		Cliente c = new Cliente();
		c.setNome(request.getParameter("nome"));
		c.setLogradouro(request.getParameter("logradouro"));
		c.setNumero(request.getParameter("numero"));
		c.setBairro(request.getParameter("bairro"));
		c.setComplemento(request.getParameter("complemento"));
		c.setReferencia(request.getParameter("referencia"));
		
		System.out.print(c.getNome()+c.getBairro()+c.getLogradouro()+c.getNumero());
		
		
		if(c.getNome().equals("")) {
			MensagemVO m = new MensagemVO();
			m.setAlerta("erro");
			m.setMsg("Erro ao cadastrar");
		}else {
			ClienteDAO cDao = new ClienteDAO();
			
			try {
				if(cDao.cadastrarCliente(c)) {
					MensagemVO m = new MensagemVO();
					m.setAlerta("sucesso");
					m.setMsg("Cadastro efetuado com sucesso");
					Mensagem.addMensagem(m);
					response.sendRedirect("inicial.jsp");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
