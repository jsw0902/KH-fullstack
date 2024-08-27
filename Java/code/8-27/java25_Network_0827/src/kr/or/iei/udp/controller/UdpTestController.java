package kr.or.iei.udp.controller;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.SocketException;

public class UdpTestController {

	public void udpServer() {
		
		//1. 서버의 포트번호 지정
		int port = 9999;
		
		//2. 자원반환객체 선언
		DatagramSocket socket = null;
		
		//3. 소켓 객체 생성
		try {
			socket = new DatagramSocket(port);
			System.out.println("서버 소켓 생성 완료");
			
			//클라이언트에서 보낸 메시지를 받아줄 byte 배열 생성
			byte [] inMsg = new byte[1024];
			
			//클라이언트에서 보낸 메시지를 받아줄, Packet 객체 생성.
			DatagramPacket inPacket = new DatagramPacket(inMsg, inMsg.length);
			
			//클라이언트 메시지 수신.
			socket.receive(inPacket);
			
			//클라이언트 메시지 = > 패킷 -> 바이트배열 => 스트림(남은 공간 trim으로 제거)
			String clientMsg = new String(inMsg).trim();
			
			System.out.println("클라이언트가 보낸 메시지 : " + clientMsg);
			
		} catch (SocketException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			socket.close();
		}
	}
}
