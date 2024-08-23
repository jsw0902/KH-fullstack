package kr.or.iei.chap03.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;

public class FileTestController {

	/*
	File : 파일에 대한 정보를 가지고 있는 클래스.
	 	- 파일 생성, 폴더 생성, 파일 크기, 파일 존재 유무 등 파일에 대한 정보를 가지고 있는 클래스
	 	- 파일 생성은 가능하지만, 파일의 내용을 읽거나 쓰지 못함.
	 	
	 */
	public void fileTest() {
		Scanner sc = new Scanner(System.in); 
		System.out.print("조회할 파일명 입력 : ");
		String fileName = sc.nextLine();
		
		//파일 객체 생성
		File file = new File(fileName);
		
		//파일의 존재 유무 확인. 존재 시, true 반환
		if(file.exists()) {
			System.out.println("파일의 절대 경로 : " + file.getAbsolutePath());
			System.out.println("파일의 상대 경로 : " + file.getPath());
			System.out.println("파일 이름 : " + file.getName());
			System.out.println("파일 크기 : " + file.length() + "byte");
			System.out.println("디렉토리 유무 : " + file.isDirectory());
			System.out.println("파일의 유무 : " + file.isFile());
			//file.delete(); //파일 삭제
			
			//마지막 수정시간
			long lastmdf = file.lastModified();
			Date date = new Date(lastmdf);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 hh시 mm분 ss초");
			String dateStr = sdf.format(date);
			System.out.println("마지막 수정 시간 : " + dateStr);
			
		}else {
			System.out.println("파일이 존재하지 않습니다!!!!");
			
			try {
				//파일 생성 메소드
				file.createNewFile();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
