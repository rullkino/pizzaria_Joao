package dao;

import java.util.ArrayList;
import java.util.List;

import vo.MensagemVO;

public class Mensagem {
	
	private static List<MensagemVO> mensagens = new ArrayList<>();
	
	
	public static void addMensagem(MensagemVO msg){
		mensagens.add(msg);
	}
	
	public static List<MensagemVO> getMensagens(){
		return mensagens;
	}
	
	public static MensagemVO getMensagem(){
		if(!mensagens.isEmpty()){
			return mensagens.remove(0);
		}
		return null;
	}

}
