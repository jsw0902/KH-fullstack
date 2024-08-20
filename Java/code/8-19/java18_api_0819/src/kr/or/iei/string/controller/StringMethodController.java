package kr.or.iei.string.controller;

public class StringMethodController {
	
	
	public void test() {
		String str = "Hello World";
		
		//charAt() : 문자열에서 특정 위치의 문자를 가져오고 싶을 때
		char ch = str.charAt(0);
		System.out.println("str.charAt(0) : " + ch);
		
		
		//concat() : 문자열과 전달된 또 다른 문자열을 하나로 합쳐 새로운 문자열로 반환해주는 메소드
		String str2 = "!!!";
		String str3 = str.concat(str2);//Hello World + !!!
				
		System.out.println("str.concat(str2) : " + str3);
		
		String str4 = str + "!!!";
		System.out.println("str3 : " + str3);
		System.out.println("str4 : " + str4);
		System.out.println("str3 == str4 : " + (str3 == str4)); //false concat 사용 시, new 연산자를 통해 문자열을 리턴해줌.
		System.out.println("str3 address : " + System.identityHashCode(str3));
		System.out.println("str4 address : " + System.identityHashCode(str4));
		
		
		//equals() : 문자열과 또 다른 문자열을 비교하여 boolean형으로 리턴
		//Object 클래스와 메소드를 오버라이딩.
		System.out.println("str3.equals(str4) : " + str3.equals(str4));
		
		//contains() : 문자열 내부에 특징 문자열이 존재하는지 boolean형으로 리턴
		//매개변수 자료형 : CharSequence : String 클래스가 implements 하고 있는 상위 인터페이스.
		//다형성에 의해, 매개변수로 String 전달 가능.
		System.out.println("str3에 hello가 존재하는가? : " + str3.contains("Hello"));
		System.out.println("str3에 Bye가 존재하는가? : " + str3.contains("Bye"));
	
		//length() : 문자열의 길이를 정수형으로 리턴
		System.out.println("str.length() : " + str.length());
		System.out.println("str3.length() : " + str3.length()); //공백도 문자열 길이에 포함된다.
		
		//substring() : 문자열의 특정 위치값을 추출하여 리턴
		//substring(int beginIndex) : 문자열의 beginIndex 위치에서부터 끝까지의 문자열을 추출해서 리턴
		//substring(int beginIndex, int endIndex) : 문자열의 beginIndex 위치에서부터 endIndex-1까지의 문자열을 추출해서 리턴
		//beginIndex <=		 <endIndex
		System.out.println("str3 : " + str3);
		System.out.println("str3.substring(3) : " + str3.substring(3)); // lo World !!!
		System.out.println("str3.substring(3,7) : " + str3.substring(3,7)); //lo w
		
		
		//replace() : 문자를 대체해주는 메소드 
		System.out.println("str3.replace() : " + str3.replace('l', 'c')); // L 문자 전부를 c로 변경
	
		//trim() : 공백을 제거해주는 메소드
		String str5 = "            자바가 세상에서 제일 어려움                ";
		System.out.println("str5.trim() : " + str5.trim()); // 앞, 뒤의 공백만 제거. 중간의 공백은 제거하지 않는다.
		
		//toCharArray() : 문자열을 문자 배열로 반환.
		char [] charArr = str3.toCharArray();
		for(int i = 0; i<charArr.length; i++) {
			System.out.println(i + "번째 문자 : " + charArr[i]);
		}
		
		//toUpperCase() : 모든 문자를 대문자로 변환하여 반환
		String str6 = str3.toUpperCase();
		System.out.println(str3 + ".toUpperCase() : " + str6); // HELLO WORLD!!!
		
		//toLowerCase() : 모든 문자를 소문자로 변환하여 반환.
		String str7 = str6.toLowerCase();
		System.out.println(str6 + ".toLowerCase() : " + str7); //hello world!!!
		
		//valueOf() : 매개변수로 전달된 값을 String으로 반환
		String str8 = String.valueOf(charArr);
		System.out.println("charArr String valueOf : " + str8);
		
		String str9 = new String(charArr);
		System.out.println("charArr new String : " +str9);
		
		double dNum = 10.424;
		String str10 = dNum + "";
		System.out.println("str10 : " + str10);
		
		
	}
}
