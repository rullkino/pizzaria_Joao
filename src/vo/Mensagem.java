package vo;

public class Mensagem {
	

	private String msg;
	private String alerta;
	public Mensagem(MensagemVO m) {
		super();
		this.msg = m.getMsg();
		this.alerta = m.getAlerta();
	}

	

	public String getMsg() {
		return msg;
	}
	public String getAlerta() {
		return alerta;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}

	public void setAlerta(String alerta) {
		this.alerta = alerta;
	}
}
