package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import vo.Cliente;

public class ClienteDAO {
	
	private Connection con;
	private PreparedStatement ps;
	
	/*1nome 2logradouro 3numero 4complemento 5bairro 6referencia*/
	
	public boolean cadastrarCliente(Cliente c) throws SQLException {
		
		String sql = " INSERT INTO cliente (nome,logradouro,numero,complemento,bairro,referencia) VALUES(?,?,?,?,?,?); ";
		
		con = ConnectionDB.getConnection();
		
		ps = con.prepareStatement(sql);
		ps.setString(1, c.getNome());
		ps.setString(2, c.getLogradouro());
		ps.setString(3, c.getNumero());
		ps.setString(4, c.getComplemento());
		ps.setString(5, c.getBairro());
		ps.setString(6, c.getReferencia());
		
		return ps.executeUpdate() > 0;
	}
	public Cliente buscarCliente(Integer id)  {
		String sql = " SELECT * FROM cliente AS c INNER JOIN telefone AS t ON c.cliente_id = t.cliente_id WHERE c.cliente_id = ?; ";
		
		con = ConnectionDB.getConnection();
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			Cliente c = new Cliente();
			List<String> tel = new ArrayList<>();
			while(rs.next()) {
				c.setId(rs.getInt("cliente_id"));
				c.setNome(rs.getString("nome"));
				c.setLogradouro(rs.getString("logradouro"));
				c.setNumero(rs.getString("numero"));
				c.setComplemento(rs.getString("complemento"));
				c.setBairro(rs.getString("bairro"));
				c.setReferencia(rs.getString("referencia"));
				String telefone = rs.getString("telefone");
				tel.add(telefone);	
			}
			c.setTelefones(tel);
			return c;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}	
	}
	
	public List<Cliente> listarTodos() throws SQLException {
		
		String sql = " SELECT * FROM cliente ORDER BY nome; ";
		
		con = ConnectionDB.getConnection();
		
		ps = con.prepareStatement(sql);
		
		List<Cliente> cli = new ArrayList<Cliente>();
		
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			Cliente c = new Cliente();
			
			c.setId(rs.getInt("cliente_id"));
			c.setNome(rs.getString("nome"));
			c.setLogradouro(rs.getString("logradouro"));
			c.setNumero(rs.getString("numero"));
			c.setComplemento(rs.getString("complemento"));
			c.setBairro(rs.getString("bairro"));
			c.setReferencia(rs.getString("referencia"));
			
			cli.add(c);
		}
		return cli;
	}
}
