package dao;


import java.sql.Connection;
import java.sql.PreparedStatement;


import vo.ItemPedido;

public class ItemPedidoDAO {
	Connection con;
	PreparedStatement ps;
	
	
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
 
 

