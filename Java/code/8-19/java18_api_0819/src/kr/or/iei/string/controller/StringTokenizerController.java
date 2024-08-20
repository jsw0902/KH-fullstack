package kr.or.iei.string.controller;

import java.util.StringTokenizer;

public class StringTokenizerController {

	public void test() {
		String str = "java,Oracle,JDBC,HTML,CSS,Spring";
		//연속된 문자열을 특성 구분값 기준으로 관리하고 싶을 때
		
		//방법1) split
		String [] strArr = str.split(","); // ,를 기준으로 배열로 반환
		System.out.println("strArr.length : " + strArr.length);
		
		for(int i = 0; i<strArr.length; i++) {
			System.out.println(i + "번째 인덱스 값 : " + strArr[i]);
		}
		
		int count = 0;
		for(String s : strArr) {
			System.out.println(strArr[count]);
			count++;
		}
		
		//방법2) StringTokenizer 클래스를 이용하는 방법.
		//분리된 문자열들을 각각의 토큰으로 관리하고 싶을 때 사용.
		//StringTokenizer st = new StringTokenizer(대상 문자열, 구분자);
		
		StringTokenizer st = new StringTokenizer(str, ",");
		/*
		System.out.println("분리된 토큰 갯수 : " + st.countTokens());
		System.out.println("다음 토큰 : " + st.nextToken());
		System.out.println("다음 토큰 : " + st.nextToken());
		System.out.println("분리된 토큰 갯수 : " + st.countTokens());
		System.out.println("다음 토큰 : " + st.nextToken());
		System.out.println("다음 토큰 : " + st.nextToken());
		System.out.println("다음 토큰 : " + st.nextToken());
		System.out.println("다음 토큰 : " + st.nextToken());
		System.out.println("분리된 토큰 갯수 : " + st.countTokens());
		*/
		//System.out.println("다음 토큰 : " + st.nextToken()); //남아있는 토큰이 존재하지 않아 오류 발생
		
		/*
		// 매 반복문 실행시마다, 현재 남아있는 토큰의 갯수를 조회하니, 중간에 끊김 현상 발생
		for(int i = 0; i<st.countTokens(); i++) { // i<6 -> i<5 -> i<4 -> i<3 ...........
			System.out.println("현재 토큰 : " + st.nextToken());
		}
		*/
		
		/*
		//해결방법1) 변수를 활용
		int cnt = st.countTokens(); //총 토큰 수를 변수에 저장해, 조건식을 고정시킨다.
		for(int i = 0; i<cnt; i++) {
			System.out.println("현재 토큰 : " + st.nextToken());
		}
		*/
		
		//해결방법2) StringTokenizer 클래스가 제공하는 메소드를 활용
		while(st.hasMoreTokens()) { //남아있는 토큰이 있는지를 boolean형으로 리턴
			System.out.println("현재 토큰 : " + st.nextToken());
		}
		
	}
}
