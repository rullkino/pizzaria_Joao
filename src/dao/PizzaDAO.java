package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import vo.Pizza;

public class PizzaDAO {
	
	private Connection con;
	private PreparedStatement ps;
	
	private boolean novaPizza(Pizza p) throws SQLException {
		String sql = " INSERT INTO pizza VALUES(0,?,?,?) ";
		con = ConnectionDB.getConnection();
		ps = con.prepareStatement(sql);
		ps.setString(1, p.getNome());
		ps.setString(2, p.getDescricao());
		ps.setDouble(3, p.getValor());
		
		return ps.executeUpdate() >0;
	}
	
	public List<Pizza> retornaCardapio() throws SQLException{
		String sql = " SELECT * FROM pizza ORDER BY nome ";
		con = ConnectionDB.getConnection();
		ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery(sql);
		List<Pizza>pizza = new ArrayList<Pizza>();
		while(rs.next()) {
			Pizza p = new Pizza();
			p.setPizzaID(rs.getInt("pizza_id"));
			p.setNome(rs.getString("nome"));
			p.setDescricao(rs.getString("descricao"));
			p.setValor(rs.getDouble("valor"));
			pizza.add(p);
		}
		return pizza;
		
	}
	
	public List<Pizza> buscarPizza(String nome) throws SQLException {
		
		String sql = " SELECT * FROM pizza WHERE nome LIKE '%?%'; " ;
		con = ConnectionDB.getConnection();
		ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery(sql);
		List<Pizza>pizza = new ArrayList<Pizza>();
		while(rs.next()) {
			Pizza p = new Pizza();
			p.setPizzaID(rs.getInt("pizza_id"));
			p.setNome(rs.getString("nome"));
			p.setDescricao(rs.getString("descricao"));
			p.setValor(rs.getDouble("valor"));
			pizza.add(p);
		}
		return pizza;
	}
	
	public boolean excluirPizza(int pizzaID) throws SQLException{
		String sql = " DELETE FROM pizza WHERE pizza_id = ? ";

		con = ConnectionDB.getConnection();

		ps = con.prepareStatement(sql);
		ps.setInt(1, pizzaID);

		return ps.executeUpdate() > 0;
	}
}
