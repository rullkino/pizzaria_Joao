package vo;

public class Pizza {
	private Integer pizzaID;//primaria
	private String nome;
	private String descricao;
	private Double valor;
	
	public Integer getPizzaID() {
		return pizzaID;
	}
	public void setPizzaID(Integer pizzaID) {
		this.pizzaID = pizzaID;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public Double getValor() {
		return valor;
	}
	public void setValor(Double valor) {
		this.valor = valor;
	}
	
	
}
