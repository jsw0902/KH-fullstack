package kr.or.iei.chap02.controller;

import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;

/*
 * 
 * 문자 스트림 : 문자를 내보내기 적합한 스트림. 2byte 단위로 입력 또는 출력
 * 		-Reader, Writer 클래스 => 추상 클래스
 * 
 */
public class CharStreamController {

	Scanner sc;
	
	public CharStreamController() {
		sc = new Scanner(System.in);
	}
	
	public void test() {
		/*
		스트림을 통한 데이터 입/출력 절차
		
		1) 스트림 생성
		2) 메소드를 이용한 입력 또는 출력
		3) 자동 반환
		 */
		
		System.out.print("저장할 파일명 입력 : ");
		String fileName = sc.nextLine();
		
		//자원을 반환할 객체를 미리 선언
		FileWriter fw = null;
		
		try {
			fw = new FileWriter(fileName);
			
			while(true) {
				System.out.print("저장할 파일 내용 입력 : ");
				String content = sc.nextLine() + "\r\n";
				
				if(content.equals("exit\r\n")) {
					break;
				}
				
				//2. 메소드를 이용한 입력 또는 출력
				//문자 스트림이니까, byte 배열로 변환 불필요
				//String 자료형을 매개변수로 전달하면, 내부적으로 char 배열로 변환하여, 출력
				fw.write(content);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  finally {
			try {
				//3. 자원 반환
				fw.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		
	}
}
