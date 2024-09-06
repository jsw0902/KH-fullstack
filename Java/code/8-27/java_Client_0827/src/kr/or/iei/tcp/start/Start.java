package kr.or.iei.tcp.start;

import kr.or.iei.tcp.controller.TcpClientController;
import kr.or.iei.tcp.controller.TcpFileClientController;

public class Start {

	public static void main(String[] args) {
		/*
		TcpClientController tcpt = new TcpClientController();
		
		tcpt.tcpClient();

		 */
		
		TcpFileClientController tcpfc = new TcpFileClientController();
		tcpfc.tcpFileClient();
	}

}
