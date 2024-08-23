package kr.or.iei.chap02.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;

/*
보조 스트림 : 주 스트림의 기능을 향상시키거나, 새로운 기능을 추가하기 위해 사용하는 스트림
	- 보조 스트림만을 가지고, 데이터 입력 또는 출력은 불가! 주 스트림과 같이 사용
 */
public class SubStreamController {

	Scanner sc;
	
	public SubStreamController() {
		sc = new Scanner(System.in);
	}
	
	public void test() {
		
		System.out.print("저장할 파일명 입력 : ");
		String fileName = sc.nextLine();
		
		//보조 스트림 객체 미리 선언
		BufferedWriter bw = null;
		
		try {
			//보조스트림 사용 시, 보조스트림만 자원 반환하면 됨.
			//생성자의 두번째 매개변수로 true 전달 시, 기존 파일에 이어서 작성
			FileWriter fw = new FileWriter(fileName, true); //생성자의 두번째 매개변수로 true 전달 시, 기존 파일에 이어서 작성
			
			//보조스트림을 이용해, 데이터 입출력 (생성자 매개변수로 주 스트림 전달)
			bw = new BufferedWriter(fw);
			
			while(true) {
				System.out.print("파일 내용 입력 : ");
				String content = sc.nextLine();
				
				if(content.equals("exit")) {
					break;
				}
				
				bw.write(content);
				bw.newLine(); //개행 처리(보조 스트림이 제공)
			}
			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			//3. 자원 반환(보조스트림 반환 시, 주 스트림 자동 반환)
			try {
				bw.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
		
	}
	
	public void readTest() {
		System.out.print("읽어올 파일 입력 : ");
		String fileName = sc.nextLine();
		/*
		1) 스트림 생성
		2) 메소드를 이용한 입력 또는 출력
		3) 자동 반환
		*/
		
		BufferedReader br = null;
		
		try {
			//Read는 파일을 읽어오는 것. 읽어올 파일이 없을 때의 예외 처리(FileNotFoundException)
			FileReader fr = new FileReader(fileName);
			
			//보조스트림 생성 시, 생성자로 주 스트림 전달.
			br = new BufferedReader(new FileReader(fileName));
			
			while(true) {
				//한줄씩 파일의 내용을 읽어들임.
				String content = br.readLine();
				
				if(content == null) {
					break;
				}
				
				System.out.println(content);
			}
		
		} catch(FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				br.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
}
