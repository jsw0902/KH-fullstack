package kr.or.iei.tcp.start;

import kr.or.iei.tcp.controller.TcpFileServerController;
import kr.or.iei.tcp.controller.TcpServerController;

public class Start {

	public static void main(String[] args) {

		TcpFileServerController tcpf = new TcpFileServerController();
		tcpf.tcpFileServer();
		
		/*
		TcpServerController tcps = new TcpServerController();
		tcps.tcpServer();
		*/
	}

}
