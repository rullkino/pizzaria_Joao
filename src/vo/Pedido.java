package vo;

import java.sql.Time;
import java.util.Date;

public class Pedido {
	private Integer clienteID;//estrangeira
	private Integer pedidoID;//primaria
	private Date data;
	private Time hora;
	private Double total;
	
	public Integer getClienteID() {
		return clienteID;
	}
	public void setClienteID(Integer clienteID) {
		this.clienteID = clienteID;
	}
	public Integer getPedidoID() {
		return pedidoID;
	}
	public void setPedidoID(Integer pedidoID) {
		this.pedidoID = pedidoID;
	}
	public Time getHora() {
		return hora;
	}
	public void setHora(Time hora) {
		this.hora = hora;
	}
	public Date getData() {
		return data;
	}
	public void setData(Date data) {
		this.data = data;
	}
	public Double getTotal() {
		return total;
	}
	public void setTotal(Double total) {
		this.total = total;
	}
	
	
	
}
