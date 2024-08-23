package kr.or.iei.chap01.controller;


import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Scanner;

/*
 
 바이트 스트림 : 1바이트 단위로 데이터를 입/출력하는 스트림
 	- 종류 : InputStream, OutputStream => 추상 클래스 
 	
 */
public class ByteStreamController {

	Scanner sc;
	
	public ByteStreamController() {
		sc = new Scanner(System.in);
	}
	
	public void test() {
		/*
		스트림을 이용하여 데이터를 입/출력하는 절차
		
		1) 스트림 생성
		2) 메소드를 통한 입력 또는 출력
		3) 자원 변환
		 */
		
		System.out.print("저장할 파일명 입력 : ");
		String fileName = "D:/" + sc.nextLine();
		
		FileOutputStream fos = null;
		
		try {
			//1. 스트림 생성
			//FileOutputStream 클래스의 매개변수 1개 생성자에서 FileNotFoundException 에 대한 예외처리를, throws 하고 있으므로
			//생성자 호출 코드에서, 예외처리를 진행해야 함.
			fos = new FileOutputStream(fileName);
			
			while(true) {
				System.out.print("파일에 저장할 내용 입력 (exit 입력 시, 종료): ");
				String content = sc.nextLine() + "\r\n"; //파일 내용 개행 처리
				
				if(content.equals("exit\r\n")) {
					break;
				}
				//사용한 스트림이 바이트 스트림. 즉, content를 내보내기 위해 바이트로 변환 필요
				byte [] contentByteArr = content.getBytes();
				
				//2. 메소드를 통한 입력 또는 출력
				fos.write(contentByteArr);
				
			}
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			//3. 자원 반환
			try {
				fos.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}			
		}
		
	}
}
