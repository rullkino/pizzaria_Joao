package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import vo.Telefone;

public class TelefoneDAO {
	private Connection con;
	private PreparedStatement ps;
	
	public Telefone listarTodos(Telefone t) throws SQLException{
		
		String sql = " Select * from telefone where cliente_id = ?; ";
		
		con = ConnectionDB.getConnection();
		
		ps = con.prepareStatement(sql);
		ps.setInt(1, t.getClienteID());
		
		ResultSet rs = ps.executeQuery();
	
		while(rs.next()) {
			t.setTelefone(rs.getString("telefone"));
		}
		return t;
	}
}