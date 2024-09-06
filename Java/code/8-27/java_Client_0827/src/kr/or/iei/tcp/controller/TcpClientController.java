package kr.or.iei.tcp.controller;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;
import java.net.UnknownHostException;
import java.util.Scanner;

public class TcpClientController {

	//데이터를 요청하는 Client
	public void tcpClient() {
		Scanner sc = new Scanner(System.in);
		
		/*
		 * 1. 서버의 IP 주소와 포트번호 지정
		 */
		
		String serverIp = "192.168.10.45";
		
		int serverPort = 9999;
		
		//자원 반환 객체 선언
		DataOutputStream dos = null;
		DataInputStream dis = null;
		Socket socket = null;
		
		try {
			//2. 지정한 IP 주소와 포트번호로 소켓 객체 생성
			socket = new Socket(serverIp, serverPort);
			System.out.println("서버 접속 완료");
			
			//3. 데이터를 주고 받기 위한, 주 스트림 추출
			InputStream in = socket.getInputStream();
			OutputStream out = socket.getOutputStream();
			
			//4. 보조스트림을 통한 성능 개선
			dis = new DataInputStream(in);
			dos = new DataOutputStream(out);
			
			while(true) {
				String serverMsg = dis.readUTF();
				System.out.println("서버 메시지 : " + serverMsg);
				
				if(serverMsg.equals("exit")) {
					break;
				}
				
				System.out.print("서버에 보낼 메시지 : ");
				String sendMsg = sc.next();
				dos.writeUTF(sendMsg);
				
				if(sendMsg.equals("exit")) {
					break;
				}
			}
			
			
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				//dis.close();
				socket.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
