package vo;

import java.util.List;

public class Telefone {
	private Integer clienteID;//estrangeira
	private List<String> telefone;
	
	public Integer getClienteID() {
		return clienteID;
	}
	public void setClienteID(Integer clienteID) {
		this.clienteID = clienteID;
	}
	public List<String> getTelefone() {
		return telefone;
	}
	public void setTelefone(String telefone) {
		this.telefone.add(telefone);
	}
}