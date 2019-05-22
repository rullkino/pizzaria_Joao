package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import sun.reflect.generics.tree.ReturnType;
import vo.ItemPedido;

public class ItemPedidoDAO {
	Connection con;
	PreparedStatement ps;

	public boolean inseriPedido(List<ItemPedido> pedidos) throws SQLException {

		String sql = " INSERT INTO item_pedido VALUES(?,?,?,?)";
		int index = 0;
		con = ConnectionDB.getConnection();
		ps = con.prepareStatement(sql);
		for (ItemPedido i : pedidos) {
			ps.setInt(1, i.getPedidoId());
			ps.setInt(2, i.getPizzaID());
			ps.setInt(3, i.getQuantidade());
			ps.setDouble(4, i.getValor());
			index += ps.executeUpdate();
		}
		return index == pedidos.size();
	}
	
	public List<ItemPedido> listarTodods(Integer idPedido) throws SQLException{
		String sql = " SELECT * FROM item_pedido WHERE pedido_id = ?";
		con = ConnectionDB.getConnection();
		ps = con.prepareStatement(sql);
		ps.setInt(1, idPedido);
		ResultSet rs = ps.executeQuery();
		List<ItemPedido> itens = new ArrayList<ItemPedido>();
		while(rs.next()) {
			ItemPedido i = new ItemPedido();
			i.setPedidoId(rs.getInt("pedido_id"));
			i.setPizzaID(rs.getInt("pizza_id"));
			i.setQuantidade(rs.getInt("quantidade"));
			i.setValor(rs.getDouble("valor"));
			itens.add(i);
		}
		return itens;
	}
}
