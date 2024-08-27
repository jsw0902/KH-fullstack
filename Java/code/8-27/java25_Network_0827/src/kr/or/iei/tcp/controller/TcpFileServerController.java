package kr.or.iei.tcp.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;

/*

클라이언트가 보낸 메시지를 파일 형식으로 저장.

클라이언트 => 서버 
 */
public class TcpFileServerController {

	public void tcpFileServer(){
		
		//서버의 포트 지정
		int port = 9999;
		
		//자원 반환 객체 선언
		BufferedInputStream bis = null; //클라이언트 메시지
		BufferedOutputStream bos = null; //파일로 출력하기 위한 스트림
		ServerSocket server = null;
		
		try {
			server = new ServerSocket(port);
			System.out.println("[서버 준비 완료]");
			System.out.println("클라이언트 접속 대기중....");
			
			
			Socket socket = server.accept();
			System.out.println("클라이언트 접속 완료!!");
			
			InputStream in = socket.getInputStream();
			bis = new BufferedInputStream(in);
			
			byte [] clientMsg = bis.readAllBytes();
			
			//System.out.println("길이 : " + clientMsg.length);
			
			FileOutputStream out = new FileOutputStream("serverFile.txt");
			bos = new BufferedOutputStream(out);
			
			bos.write(clientMsg);
			
			
			/*
			OutputStream out = socket.getOutputStream();
			bos = new BufferedOutputStream(out);
			*/
			
			
			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				bis.close();
				bos.close();
				server.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
	}
}
