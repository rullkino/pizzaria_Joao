package dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;

import vo.ItemPedido;

public class ItemPedidoDAO {
	Connection con;
	PreparedStatement ps;
	
 public	 java.util.List<ItemPedido> listar(){
 	String sql = "SELECT * FROM pedido ORDER BY pedido_id";
 	con = ConnectionDB.getConnection();
 	try {
		ps = con.prepareStatement(sql);
	} catch (SQLException e) {
		e.printStackTrace();
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
