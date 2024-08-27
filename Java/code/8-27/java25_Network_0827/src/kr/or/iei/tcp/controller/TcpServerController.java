package kr.or.iei.tcp.controller;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Scanner;

public class TcpServerController {

	public void tcpServer() {
		Scanner sc = new Scanner(System.in);
		
		/*
		 * 1. 포트번호 지정
		 * 
		 * 0 ~ 65535 까지 지정 가능(사용하지 못하는 (이미 사용중인) 포트가 존재)
		 * 0 ~ 1000번 포트번호는 제외하고 지정.
		 */
		
		int port = 9999; //서버 포트 지정
		
		//2. 서버 소켓 객체 생성
		ServerSocket server = null;
		//반환할 객체 생성
		/*
		 * InputStream, OutputStream
		 * 		FileInputStream, FileOutputStream
		 * 		ObjectInputStream, ObjectOutputStream
		 * Reader, Writer
		 */
		
		DataOutputStream dos = null; //기본자료형을 출력하기 위한 스트림
		DataInputStream dis = null;
		//3. 서버 소켓 객체 생성
		try {
			server = new ServerSocket(port);
			
			//서버 준비 완료
			System.out.println("서버 준비 완료.. 클라이언트 접속 요청 대기중...");
			
			/*
			 * 3. accept() : 클라이언트 접속 요청 대기
			 * 4. Socket socket = server.accept() : 클라이언트 접속 시, 클라이언트에 대한 소켓 객체 생성
			 * 
			 */
			
			
			Socket socket = server.accept();
			System.out.println("클라이언트 접속 완료.");
			
			//5. 클라이언트에게 데이터를 전송하기 윈한 스트림 추출.
			OutputStream out = socket.getOutputStream();
			InputStream in = socket.getInputStream();
			
			dos = new DataOutputStream(out);
			dis = new DataInputStream(in);
			
			
			while(true) {
				System.out.print("클라이언트에게 보낼 메시지(exit 입력시 종료) :");
				String str = sc.next();
				
				if(str.equals("exit")) {
					break;
				}
				//한글 깨지지 않도록 인코딩
				dos.writeUTF(str);
				

				String clientMsg = dis.readUTF();
				System.out.println("클라이언트가 보낸 메시지 : " + clientMsg);
			
				if(clientMsg.equals("exit")) {
					break;
				}
			}
			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				dos.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
