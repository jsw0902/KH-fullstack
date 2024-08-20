package kr.or.iei.string.controller;

public class StringBufferController {

	public void test() {
		StringBuffer buf = new StringBuffer();
		
		
		//append() : 문자열 추가. 단, 기존 문자열 뒤에만 추가.
		buf.append("Hello"); //문자열 추가.
		System.out.println("buf : " + buf);
		
		buf.append(" Java");
		System.out.println("buf : " + buf); //기존 문자열 뒤에, 추가됨.
		
		//insert() : 문자열 추가. 특정 위치에 문자열 추가
		buf.insert(3, "test");
		System.out.println("buf : " + buf);
		
		/*
		//특정 위치에 추가해주는 기능이므로, 현재 문자열의 범위를 벗어난곳을 지정할 경우 오류 발생
		buf.insert(20, "test");
		System.out.println("buf : " + buf);
		*/
		
		//delete() : 특정 위치 문자열 삭제
		buf.delete(3, 7);
		System.out.println("buf : " + buf);
		
		//replace() : 특정 위치 문자열을 대체 
		buf.replace(6, 10, "C++"); //시작 인덱스, 마지막 인덱스, 변경할 문자열
		System.out.println("buf : " + buf); //6번째 인덱스부터 10번째 - 1번째 인덱스 문자열을 C++ 문자열로 변경
		
		//reverse() : 문자열의 순서를 반전
		buf.reverse();
		System.out.println("buf : " + buf); //++C olloH
		
		//String과 StringBuffer 차이점.
		String str1 = "Hello";
		String str2 = "Hello";
		
		System.out.println("str1 hashCode : " + str1.hashCode());
		System.out.println("str2 hashCode : " + str2.hashCode());
		System.out.println("str1 address : " + System.identityHashCode(str1));
		System.out.println("str2 address : " + System.identityHashCode(str2));
		str1 += "Java";
		
		//String은 문자열 변경 시, 변경된 문자열이 위치하는 주소값을 가짐
		System.out.println("str1 address : " + System.identityHashCode(str1));
		
		StringBuffer buf2 = new StringBuffer();
		buf2.append("Hello");
		System.out.println("buf2 address : " + System.identityHashCode(buf2));
		buf2.append(" Java");
		//StringBuffer는 문자열 변경 시, 주소값은 유지되고 내부 문자열이 변경됨
		System.out.println("buf2 address : " + System.identityHashCode(buf2));
		
		
	}
}
