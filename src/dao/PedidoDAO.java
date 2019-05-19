package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.tomcat.jni.Time;

import vo.Pedido;

public class PedidoDAO {
	
	
	Connection con;
	PreparedStatement ps;
	public List<Pedido>listarPedidos(Integer id) throws SQLException{
		String sql = "SELECT  FROM pedido WHERE cliente_id = ? ORDER BY pedido_id";
		con = ConnectionDB.getConnection();
		ps = con.prepareStatement(sql);
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();
		List<Pedido> pedidos = new ArrayList<Pedido>();
		while(rs.next()) {
			Pedido p = new Pedido();
			p.setClienteID(rs.getInt("cliente_id"));
			p.setPedidoID(rs.getInt("pedido_id"));
			p.setHora(rs.getTime("hora"));
			p.setData(rs.getDate("data"));
			p.setTotal(rs.getDouble("valor"));
			pedidos.add(p);
		}
		return pedidos;
	}
	public boolean novoPedido(Pedido p) throws SQLException {
		String sql = " INSERT INTO pedido(cliente_id, data, hora, valor) VALUES(?,?,?,?); ";
		
		con = ConnectionDB.getConnection();
		ps = con.prepareStatement(sql);
		ps.setInt(1, p.getClienteID());
		ps.setDate(2, p.getData());
		ps.setTime(3, p.getHora());
		ps.setDouble(4, p.getTotal());
		
		return ps.executeUpdate() > 0;
	
	}
}
