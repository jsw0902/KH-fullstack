package kr.or.iei.controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Scanner;

/*
CheckedException : 예외처리를 강제화 해야하는 예외.
	- 소스 코드 작성 시, 반드시 예외처리(try ~ catch)를 작성해야 함.
	- 예외처리 하지 않는 경우, 컴파일 오류 발생
 */
public class CheckedExceptionController {
	
	public void test1() {
		/*
		 강제로 예외처리를 진행해야 하는 코드이므로, 아래 코드만 작성 시 컴파일 오류 발생
		 FileInputStream fis = new FileInputStream("text.txt");
		 */
		try {
			FileInputStream fis = new FileInputStream("text.txt");
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace(); //발생한 예외에 대한 정보를 Console에 출력해주는 기능.
		}
	}
	
	//throws : 던지다 라는 의미를 가진다
	//예외처리를 예외가 발생할만한 코드가 작성된 곳에서 처리하지 않고, 해당 기능을 호출하는 부문에서 예외처리를 하도록 함
	public void test2() throws FileNotFoundException {
		FileInputStream fis = new FileInputStream("text.txt");
	}
	
	public void test3() throws FileNotFoundException {
		test2();
	}
	
	public void test4() {
		FileInputStream fis = null;
		Scanner sc = null;
		try {
			fis = new FileInputStream("test.txt");
			sc = new Scanner(System.in);
			
			int num = sc.nextInt(); //문자 입력 시 , 처리하는 catch가 없으므로 프로그램 비정상 종료
			
		} catch(FileNotFoundException e) {
			e.printStackTrace();
		} finally {
			try {
				//자원 반환 코드(프로그램이 비정상 종료되어도 자원은 반환됨)
				fis.close();
				sc.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	public void test5() {
		//아래와 같이 예외처리 진행 시, 자원 반환 코드를 작성하지 않아도 됨. 자동으로 자원을 반환함.
		try(FileInputStream fis = new FileInputStream("test.txt")){
			
		}catch (FileNotFoundException e) {
			
		}catch(IOException e1) {
			e1.printStackTrace();
		}
		
	}
	
	public void test6(){
		Scanner sc = new Scanner(System.in);
		
		System.out.print("관리할 학생 숫자 입력 : ");
		int peopleCount = sc.nextInt();
		
		if(peopleCount < 1) {
			try {
				/*
				UserCheckedException ex = new UserCheckedException("사용자 입력 오류");
				throw ex; 	
				*/
				throw new UserCheckedException("사용자 입력 오류");
				
			} catch(UserCheckedException e) {
				//강제로 발생시킨 CheckedException에 대한 예외 처리 코드.
			} catch(Exception e) {
				//개발자가 정의해놓은 예외 이외의 예외들이 발생했을 때 처리할 코드
			}
		}
	}
}
