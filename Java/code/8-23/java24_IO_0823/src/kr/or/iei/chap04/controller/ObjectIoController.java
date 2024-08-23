package kr.or.iei.chap04.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.Scanner;

import kr.or.iei.chap04.model.vo.User;

public class ObjectIoController {

	Scanner sc;
	User user;
	
	public ObjectIoController() {
		sc = new Scanner(System.in);
		user = new User();
	}
	
	public void mainMtd() {
		while(true) {
			System.out.println("==================회원 관리 프로그램==================");
			System.out.println("1. 회원 정보 등록");
			System.out.println("2. 회원 정보 출력");
			System.out.println("3. 회원 내보내기");
			System.out.println("4. 회원 불러오기");
			System.out.println("5. 회원 내보내기(직렬화)");
			System.out.println("6. 회원 불러오기(역직렬화)");
			System.out.println("0. 종료");
			System.out.print("선택 > ");
			int menu = sc.nextInt();
			
			switch(menu){
				case 1 : 
					insertUser();
					break;
				case 2 : 
					printUser();
					break;
				case 3 : 
					exportUser();
					break;
				case 4 : 
					importUser();
					break;
				case 5 : 
					exportUserSerial();
					break;
				case 6 : 
					importUserSerial();
					break;
				case 0 : 
					return;
			}
			
		}
	}
	
	//사용자 입력을 받아, 전역 객체 User에 세팅
	public void insertUser() {
		System.out.println("==================회원 정보 등록==================");
		System.out.print("아이디 입력 : ");
		String id = sc.next();
		System.out.print("비밀번호 입력 : ");
		String pw = sc.next();
		System.out.print("이름 입력 : ");
		String name = sc.next();
		System.out.print("나이 입력 : ");
		int age = sc.nextInt();
		
		user = new User(id, pw, name, age);
		System.out.println("등록 완료!!");
	}
	
	//전역 객체 User에 저장된 정보 출력
	public void printUser() {
		if(user == null) {
			System.out.println("회원 정보가 존재하지 않습니다.");
		}else {
			System.out.println("아이디 : " + user.getId());
			System.out.println("비밀번호 : " + user.getPw());
			System.out.println("이름 : " + user.getName());
			System.out.println("나이 : " + user.getAge());
		}
			
	}
	
	//프로그램 외부에 User에 대한 정보 내보내기
	public void exportUser() {
		System.out.println("==================회원 정보 내보내기==================");
		
		if(user != null) {
			BufferedWriter bw = null;
			
			try {
				FileWriter fw = new FileWriter("userBackUp.txt");
				bw = new BufferedWriter(fw);
				
				String exportStr = user.toString();
				
				bw.write(exportStr);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				try {
					bw.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}
	
	//userBackUp.txt을 읽어들여 전역 객체 User에 등록
	public void importUser() {
		BufferedReader br = null;
		try {
			FileReader fr = new FileReader("userBackUp.txt");
			br = new BufferedReader(fr);
			
			String userStr = br.readLine();
			String [] userStrArr = userStr.split("/");
			
			user.setId(userStrArr[0]);
			user.setPw(userStrArr[1]);
			user.setName(userStrArr[2]);
			user.setAge(Integer.parseInt(userStrArr[3]));
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
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
	
	public void exportUserSerial() {
		System.out.println("==================직렬화를 이용해 객체 내보내기==================");
		
		if(user != null) {
			//객체도 직렬화할 때 바이트 단위로 잘라서 내보냄.
			ObjectOutputStream oos = null;
			
			FileOutputStream fos;
			try {
				fos = new FileOutputStream("userSerialBackUp.txt");
				oos = new ObjectOutputStream(fos);
				
				//다형성에 의해, 모든 객체를 매개변수로 전달받을 수 있도록 Object로 전달 받고 있음.
				oos.writeObject(user);
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				try {
					oos.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			
		}
	}
	
	public void importUserSerial() {
		System.out.println("==================객체 가져오기(역직렬화)==================");
		
		ObjectInputStream ois = null;
		
		FileInputStream fis;
		try {
			fis = new FileInputStream("userSerialBackUp.txt");
			ois = new ObjectInputStream(fis);
			
			user = (User) ois.readObject();
			System.out.println("객체 가져오기 성공!");
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				ois.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		
	}
}
