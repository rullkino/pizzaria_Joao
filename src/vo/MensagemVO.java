package vo;

public class MensagemVO {
	

	private String msg;
	private String alerta;
	
	public MensagemVO(String alerta, String msg) {
		super();
		this.msg = msg;
		this.alerta = alerta;
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
