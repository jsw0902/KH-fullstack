package kr.or.iei.udp.controller;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.Socket;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.util.Scanner;

public class UdpTestController {

	public void udpClient() {
		
		Scanner sc = new Scanner(System.in);
		//서버의 포트 지정
		int serverPort = 8888;
		
		
		//자원 반환 객체 선언
		DatagramSocket socket = null;
		
		//자원 반환
		
		try {
			//TCP와 다르게, 소켓 생성 시 서버의 IP주소와 포트번호를 할당하지 않음
			socket = new DatagramSocket();
			InetAddress.getLocalHost();
			
			//현재 PC의 이름 값 조회
			String name = InetAddress.getLocalHost().getHostName();
			System.out.println("name : " + name);
			
			//현재 PC의 IP주소 값 조회
			String address = InetAddress.getLocalHost().getHostAddress();
			System.out.println("Client address : " + address);
			
			System.out.print("서버에 보낼 메시지 입력 : ");
			String sendMsg = sc.next();
			
			/*
			 서버 : 메시지를 패킷으로 수신 => 바이트 배열로 변환 => 문자열 반환
			 클라이언트 : 문자열 입력 => 바이트 배열로 변환 => 메시지를 패킷으로 송신
			 */

			
			byte [] outMsg = sendMsg.getBytes();
			
			//InetAddress : 자바에서 IP 주소를 다루기 위해 제공되는 클래스
			InetAddress serverIp = InetAddress.getByName("192.168.10.45"); //서버의 IP 주소
			DatagramPacket packet = new DatagramPacket(outMsg, outMsg.length, serverIp, serverPort);
			
			socket.send(packet);
			
		} catch (SocketException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnknownHostException e) {
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
