package kr.or.iei.view;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

import kr.or.iei.controller.Word;
import kr.or.iei.model.vo.EngKor;
import kr.or.iei.model.vo.Test;

public class WordView {
	
	ArrayList<Test> tests;
	Scanner sc;
	HashMap<Test, Integer> map;
	public WordView() {
		map = new HashMap<Test, Integer>();
		sc = new Scanner(System.in);
	}
	
	public int main() {
		System.out.println("====================영단어 관리 프로그램====================");
		System.out.println("1. 영단어 검색");
		System.out.println("2. 영단어 등록");
		System.out.println("3. 테스트");
		System.out.println("4. 오답노트");
		System.out.println("5. 영단어 삭제");
		System.out.println("6. 영단어 수정");
		System.out.println("0. 프로그램 종료");
		System.out.print("선택 > ");
		int menu = sc.nextInt();
		
		return menu;
	}
	
	public Test wordTest(HashMap<Test, Integer> map) {
		System.out.println("====================영단어 테스트====================");
		System.out.print("테스트 종류를 선택해주세요(영한, 한영) : ");
		String testType = sc.next();
		if(testType.equals("영한")) {
			map.remove("한영");
			System.out.println("문제 갯수를 입력해주세요 : ");
			int newNums = sc.nextInt();
			
			return new Test(testType, newNums);
		} else if(testType.equals("한영")) {
			map.remove("영한");
			System.out.print("문제 갯수를 입력해주세요 : ");
			int newNums = sc.nextInt();
			
			return new Test(testType, newNums);
		} else {
			return new Test(testType, 0);
		}	
		
	}
	public void testEng(EngKor word) {
		
	}
	
	public void testMeun() {
		
	}
	
}
