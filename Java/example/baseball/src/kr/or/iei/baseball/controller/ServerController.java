package kr.or.iei.baseball.controller;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;
import java.util.Random;

public class ServerController {
	
	public void baseball() {
		Random rd = new Random();
		int[] answer = new int[3];
		boolean power = true;
		int port = 9999; //1. 포트번호 지정
		
		ServerSocket server = null; //2. 서버 소켓 객체 생성
		DataOutputStream dos = null; //기본자료형을 출력하기 위한 스트림
		DataInputStream dis = null;
		try {
			server = new ServerSocket(port);
			System.out.println("서버 준비 완료.. 클라이언트 접속 요청 대기중...");
			Socket socket = server.accept();
			System.out.println("클라이언트 접속 완료.");
			
			OutputStream out = socket.getOutputStream();
			InputStream in = socket.getInputStream();
			
			dos = new DataOutputStream(out);
			dis = new DataInputStream(in);
			
			for(int i = 0; i<3; i++) {
				answer[i] = rd.nextInt(10);
				for (int j = 0; j < i; j++) {
					if (answer[i] == answer[j]) {
						i--;
						break;
					}
				}
			}
			
			int st = 0;
			int b = 0;
			int o = 0;
			while(power) {
				
				String input = dis.readLine();
				String[] numbers = input.split(" ");
				
				for (int i = 0; i < 3; i++) {
	                int num = Integer.parseInt(numbers[i]);
	                for (int j = 0; j < 3; j++) {
	                    if (num == answer[j]) {
	                        if (i == j) {
	                            st++;
	                        } else {
	                            b++;
	                        }
	                    }
	                }
	            }
				
				if(st == 3) {
					power = false;
					String winprint = "승리";
					dos.writeUTF(winprint);
				}
				
			}
			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
