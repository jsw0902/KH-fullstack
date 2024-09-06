package kr.or.iei.tcp.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.Socket;
import java.net.UnknownHostException;

/*
파일을 읽어들이고, 서버로 전송

 */
public class TcpFileClientController {
	public void tcpFileClient() {
		String serverIp = "192.168.10.45";
		int serverPort = 9999;
		
		//자원 반환 객체
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		Socket socket = null;
		
		try {
			socket = new Socket(serverIp, serverPort);
			System.out.println("서버 접속 완료.");
			
			FileInputStream fis = new FileInputStream("clientFile.txt");
			bis = new BufferedInputStream(fis);
			byte [] readData = bis.readAllBytes();
			
			System.out.println("파일 Read 완료");
			
			//파일 전송
			OutputStream out = socket.getOutputStream();
			bos = new BufferedOutputStream(out);
			bos.write(readData);
			
			System.out.println("파일 Write 완료");
			
			//파일 전송
			
			
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				bis.close();
				bos.close();
				socket.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
