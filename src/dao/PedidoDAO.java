package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import vo.Pedido;

public class PedidoDAO {
	
	
	Connection con;
	PreparedStatement ps;
	public List<Pedido>listarPedidos() throws SQLException{
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();
	
		String sql = "SELECT * FROM pedido ORDER BY pedido_id";
		con = ConnectionDB.getConnection();
		ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<Pedido> pedidos = new ArrayList<Pedido>();
		while(rs.next()) {
			Pedido p = new Pedido();
			p.setData(date);
			p.setHora();
			p.setClienteID();
		}
	}
	
	/* public List<Produto> listarTodos() throws SQLException{
	String sql = "SELECT * FROM produtos ORDER BY nome";
	con = ConnectionDB.getConnection();
	ps = con.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();
	List<Produto> produtos = new ArrayList<>();
	while(rs.next()){
		Produto p = new Produto();
		p.setCodProduto(rs.getInt("cod_produto"));
		p.setNome(rs.getString("nome"));
		p.setValorUnitario(rs.getDouble("valor_unitario"));
		produtos.add(p);
	}
	return produtos;
}
*/
}
