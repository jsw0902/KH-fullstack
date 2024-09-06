package kr.or.iei.baseball.controller;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.Socket;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Scanner;

public class ClientController {

	public void baseball() {
		Scanner sc = new Scanner(System.in); 
		int serverPort = 9999;
		int count = 0;
		int [] num = new int[3]; 
		
		
		DataOutputStream dos = null;
		DataInputStream dis = null;
		
		
		try {
			InetAddress serverIp = InetAddress.getByName("192.168.10.45");
			Socket socket = new Socket("192.168.10.45", serverPort);
			System.out.println("서버 접속 완료.");
			
			InputStream in = socket.getInputStream();
			OutputStream out = socket.getOutputStream();
			
			dis = new DataInputStream(in);
			dos = new DataOutputStream(out);
			
			while(true) {
				System.out.print("0~9 사이의 숫자를 입력해주세요(입력 예시: 1 2 3) : ");
				String sendMsg = sc.nextLine();
				sc.nextLine();
				
				
				dos.writeUTF(sendMsg);
				
				
				String result = dis.readLine();
				System.out.println(result);
				
				if (result.contains("정답")) {
					System.out.println(count + "회만에 맞췄습니다!");
					break;
				}
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		
		
	}
}
