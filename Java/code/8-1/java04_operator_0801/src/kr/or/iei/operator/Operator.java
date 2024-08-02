package kr.or.iei.operator;

public class Operator {
	
	//이항 - 산술 연산자.
	public void test1() {
		int number1 = 20;
		int number2 = 4;
		
		System.out.println("number1 + number2 = " + (number1 + number2));
		System.out.println("number1 - number2 = " + (number1 - number2));
		System.out.println("number1 * number2 = " + (number1 * number2));
		System.out.println("number1 / number2 = " + (number1 / number2));
		System.out.println("number1 % number2 = " + (number1 % number2));
		System.out.println("a * c =  " + ('a' * 'c')); //97 * 99 =9603
		System.out.println("3.2 * E =  " + (3.2 * 'E')); // 3.2 * 69 = 220.8
	}
	
	//이항 - 쉬프트 연산: 비트를 왼쪽으로 이동시키커나, 오른쪽으로 이동 시키는 연산.
	public void test2() {
		int num = 16; // 2진수 -> 0001 0000
		
		System.out.println("num<<1 : " + (num<<1)); // 0001 0000 -> 0010 0000 = 32
		System.out.println("num>>1 : " + (num>>1)); // 0001 0000 -> 0000 1000 = 8 
		System.out.println("num<<2 : " + (num<<2)); // 0001 0000 -> 0100 0000 = 64
		
		num = 62;
		
		System.out.println("num>>1 : " + (num>>1)); // 1000 0000 -> 0100 0000 = 64
		
	}
	
	//이항 - 비교 연산 : 두 값을 비교하는 연산이며, 결과는 boolean(1Byte) -> 값은 : true / false
	public void test3() {
		int num1 = 10;
		int num2 = 4;
		
		System.out.println("num1 > num2 : " + (num1 > num2));
		System.out.println("num1 < num2 : " + (num1 < num2));
		
		boolean bool1 = num1 >= num2; //변수에 할당해서 출력하기 위함
		boolean bool2 = num1 <= num2;
		
		System.out.println("bool1 : " + bool1);
		System.out.println("bool2 : " + bool2);
		
		boolean bool3 = num1 == num2; // 같냐? -> 어,(true) or 아니(false)
		
		System.out.println("num1 == num2 : " + bool3);
		
		boolean bool4 = num1 != num2; //같지 않냐?
				
		System.out.println("num1 != num2 : " + bool4);
		
		double dNum = 10.0;
		System.out.println("dNum == num1 : " + (dNum == num1)); // 10.0 == 10.0 / true
		
		char ch = 'a';
		System.out.println("'a' == 97 : " + (ch == 97)); //97 == 97 / true
		
		
		String str = "Hi";
		System.out.println("str : " + str);
		
		String str1 = "Hi";
		System.out.println("str1 : " + str1);
		
		System.out.println("str == str1 : " + (str == str1)); //원래라면 == 이렇게 비교하면 안되는데 String은 내부적으로 지원해준다 true
		
		//참조자료형이라는건 주소값을 저장하는 자료형이기 때문에, ==으로 비교하면 안된다. (String은 내부적으로 지원해준다)
		//그렇기 때문에, String 변수와 String 변수를 바교하기위해서는 equals()라는 메소드를 사용하는게 맞다.
		
		//[표현법]
		//문자열1.equals(비교문자열) -> true / false가 변환된다.
		System.out.println("str.equals(str2) : " + str.equals(str1)); //내부 문자열의 값을 비교
	}
	
	//이항 - 논리 -비트논리연산
	/*
	 AND -> & 
	 OR -> |
	 XOR -> ^	 
	 */
	public void test4() {
		int num1 = 7; // 0000 0111
		int num2 = 5; // 0000 0101
		
		//AND 연산 : 둘 다  1이 아니면 0의 결과가 나옴.
		System.out.println("num1 & num2 : " + (num1 & num2)); //5
		/*
		 7 -> 0000 0111
		 5 -> 0000 0101
		 --------------
		   -> 0000 0101
		 */
		
		//num1 = 10; // 0000 1010
		//num2 = 11; // 0000 1011
		/*
		 10 -> 0000 1010
		 11 -> 0000 1011
		 ---------------
		 10	-> 0000 1010
		 	
		 */
		
		//OR 연산 : 하나라도 1이면 1로 반환
		System.out.println("num1 | num2 : " + (num1 | num2)); //11
		/*
		 10 -> 0000 1010
		 11 -> 0000 1011
		 ---------------
		 11	-> 0000 1011
		 	
		 */
		
		//XOR 연산 : 다르면 1, 같으면 0
		
		/*
		 10 -> 0000 1010
		 11 -> 0000 1011
		 ---------------
		 10	-> 0000 0001
		 	
		 */
		System.out.println("num1 | num2 : " + (num1 ^ num2)); //2 
		
	}
	
	//이항-논리-일반논리연산자
	/*
	 
	 && : 양쪽의 조건식이 모두 true일 결우 -> true를 반환(하나라도 false면 false)
	 || : 양쪽의 조건식 중, 하나라도 true면 -> true를 반환(한개가 false여도, 나머지 한개가 true면 true)
	 
	 true/false && true/false // 모두 만족을 하면 true 하나라도 false면 false
	 true/false || true/false // 하나라도 true가 있으면 true
	 
	 
	 위 둑의 연산자 양쪽에는 boolean형 데이터가 오면 되는 것임
	 */
	public void test5() {
		boolean bool1 = 5 > 10; //false
		boolean bool2 = 10 >= 3; //true
		
		boolean bool3 = bool1 && bool2; //false
		boolean bool4 = bool1 || bool2; //true
		
		System.out.println("bool3 : " + bool3);
		System.out.println("bool4 : " + bool4);
		
		int num1 = 30;
		int num2 = 15;
		int num3 = 20;
		int num4 = 53;
		
		System.out.println("num1 > num2 && num3 <= num4 : " + (num1 > num2 && num3 <= num4)); //true
		/*
		 num1 > num2 : true
		 num3 <= num4 : true
		 -------------------
		 true && true : true
		 */
		
		System.out.println(10 < 20 && 'a' <= 'z' && 'D' < 'F' && 'F' <= 'a' && 30*2 <= 80 && 1.5 == 2); //false
		/*
		 10 < 20 : true 
		 'a' <= 'z' : false
		 'D' < 'F' : true
		 'F' <= 'a' : true
		 30 * 2 <= 80 : true
		 1.5 == 2 : false
		 
		 하나라도 false 인 경우, 결과는 false
		 */
		
		System.out.println(10 > 20 || 30/2 < 10 || 3-2>3 || 'a' < 'A' || 5/2>1); //true
		/*
		 10 > 20 : false
		 30/2 < 10 : false
		 3-2 > 3 : false
		 'a' < 'A' : false
		 5/2 > 1 : true
		 
		 하나라도 true인 경우, 결과는 true
		 */
		
		System.out.println(5 > 3 || 3 == 2 && 3 < 2); //true
		
		/*
		 &&와 ||중, &&연산이 우선시 된다.
		 3 == 2 : false
		 3 < 2 : false
		 
		 false && false -> false
		 
		 5 > 3 || false -> true || false -> true
		 */
	}
	
	//대입 - 복합 - 산술대입연산자 : 산술과 대입을 동시에 작성
	public void test6() {
		int num1 = 10;
		
		//num1에 1을 더하는 연산을 아래에 작성.
		//num1 = num1 + 1;
		num1+=1; // num1 + 1이랑 같은 연산
		System.out.println("num1 : " + num1); //11
		
		num1-=1; //num1 - 1이랑 같은 연산
		System.out.println("num1 : " + num1); //10
		
		num1*=10; //num1 * 10이랑 같은 연산
		System.out.println("num1 : " + num1); //100
		
		num1/=5; //num1 / 5이랑 같은 연산
		System.out.println("num1 : " + num1); //20
		
		num1%=3; //num1 % 3이랑 같은 연산
		System.out.println("num1 : " + num1); //2
		
		String str = "My Name is ";
		//str = str + "JSW";
		str+="JSW";
		//str-="JSW"; //문자열은 결합 연산만 가능하다.
		
		System.out.println("str : " + str);
	}
	
	//단항연산자 : 항이 1개인 연산자
	public void test7() {
		int a = 10; 
		int b = a;
		int c = -a;
		
		System.out.println("a : " + a); //10
		System.out.println("b : " + b); //10
		System.out.println("c : " + c); //-10
		
		boolean bool = b == c; // bool -> false
		
		// ! 연산자(not 연산자) : boolean형 데이터의 결과값의 반대값
		// ! 연산자(not 연산자) 여러번 사용가능 
		System.out.println("10 == -10 : " + bool); //false
		System.out.println("!(10 == -10) : " + !bool); //not 연산자 사용해서 결과값이 True
		System.out.println("!!!!(10 == -10) : " + !!!!bool); //false
		//여러번 사용 가능
		
		// 전위, 후위 연산자 : 인접 연산을 먼저 수행하는지, 나중에 수행하는지
		// 특징1: 1만을 더하거나, 뺄 수 있다.(더하기 빼기만 가능)
		// 전위 : 인접 연산을 나중에
		// 후위 : 인접연산을 먼저 수행
		
		int num = 10;
		//num = num + 1;
		//num+=1;
		
		//전위
		++num;
		System.out.println("++num : " + num);
		num = 10; // 값 확인을 위해 10으로 다시 재할당함
		
		//전위
		--num; 
		System.out.println("++num : " + num);
		num = 10; // 값 확인을 위해 10으로 다시 재할당함
		
		//후위
		num++;
		System.out.println("num++ : " + num);
		num = 10; // 값 확인을 위해 10으로 다시 재할당함
		
		//후위
		num--;
		System.out.println("num++ : " + num);
		num = 10; // 값 확인을 위해 10으로 다시 재할당함
		
		System.out.println("num : " + ++num); //num에 1을 증가시키고, 결합연산을 진행.
		num = 10; // 값 확인을 위해 10으로 다시 재할당함
		
		System.out.println("num : " + num++); //num : 10 출력 -> 결합 연산을 진행하고 계산해서 계산전 값이 출력됨 
		System.out.println("num : " + num); // 위에 후위 연산으로 인해 값이 11로 나옴
		
		num = 10;
		int sum = num++ + 20; //num + 20 -> 10 + 20 = 30 -> sum에 30을 넣음 -> sum에 넣은 후에 num에 후위 연산을 더해서 num은 11 sum은 30이 나오는 것
		System.out.println("sum : " + sum); // 30
		System.out.println("num : " + num); // 11
		/*
		 num = 10;
		 sum = num++ + 20;
		 
		 계산 순서
		 1) num + 20;
		 2) sum = num;
		 3) num += 1;
		 */
		
		a = 10;
		b = 10;
		c = (a++) + (++b) + a;
		//(더하기 전) b = 11
		//(a++) + (++b) -> 10 + 11 ->이후, a 1증가
		//21 + a = 32
		//a = 11
		
		System.out.println("a : " + a); //11
		System.out.println("b : " + b); //11
		System.out.println("c : " + c); //32
	}
	
	//상향연산자 : 조건식의 결과에 따라서, 연산을 처리.
	/*
	 [표현식]
	 
	 조건식 ? true일 때 처리 : false일 때 처리
	 */
	
	public void test8() {
		int num1 = 10;
		int num2 = 5;
		
		//조건식의 결과에 따라서, 할당 받을 변수의 자료형이 결정된다.
		String str = num1 > num2 ? "num1이 num2보다 큽니다." : "num1은 num2보다 작습니다.";
		boolean bool = num1 > num2 ? true : false;
		int result = num1 > num2 ? num1 : num2; 
	
		//조건식의 결과에 따라서, 처리되는 값의 형태와 변수의 자료형이 같아야 한다.
		String str1 = num1 > num2 ? "num1이 num2보다 큽니다." : "num1은 num2보다 작습니다.";
		
		//중복 상향연산자
		//num1과 num2중에 큰 값이, 15보다 작은지를 비교하는 연산
		
		String str2 = num1 > num2 ? num1 < 15 ? "num1이 15보다 작습니다." : "num1이 15보다 같거나 큽니다." : num2 < 15 ? "num2가 15보다 작습니다." : "num2가 15보다 같거나 큽니다.";
		
		//이건 됨
		//double str2 = num1 > num2 ? 65.0 : 50;
		
		
	}
}
