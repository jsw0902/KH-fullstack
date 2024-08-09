package kr.or.iei.exam;

import java.util.Scanner;

//배열 연습문제.
public class Exam {
	
	/*
	 * 길이가 5인 int 배열을 생성하고,
	 * 반복문을 이용해 1씩 감소하며 대입하라
	 */
	public void ex01(){
		int [] arr = new int[5];
		
		// 작성해주신 코드
		for(int i = 0; i<arr.length; i++) {
			arr[i] = 5-i;
		}
		
		for(int i = 0; i<arr.length; i++) {			
			System.out.print(arr[i] + " ");
		}
		
		/*//직접 작성한 코드
		for(int i = 4; i>=0; i--) {
			arr[i] = i+1;
			System.out.print(arr[i] + " ");
		}
		*/
	}
	
	/*
	 * 문자열 배열 "사과","복숭아","수박","귤","참외"
	 * 반복문을 이용해 배열의 각 인덱스를 순회한다.
	 * 순회 중, 문자열이 "수박"일 경우, 콘솔에 출력하고 반복문을 종료한다.
	 */
	public void ex02() {
		String [] strArr = {"사과", "복숭아", "수박", "귤", "참외"};
		
		//작성해주신 코드
		for(int i=0; i<strArr.length; i++) {
			if(strArr[i].equals("수박")) {
				System.out.println(strArr[i] + "입니다.");
				break; //현재 반복문을 종료시킨다. 불필요한 비교 연산을 수행하지 않기 위해
			}
		}
		
		/*//직접 작성한 코드
		for(int i = 0; i<strArr.length; i++) {
			if(strArr[i].equals("수박")) {
				System.out.println(strArr[i] + "입니다.");
				break;
			}
		}
		*/
	}
	/*
	 * 사용자에게 정수형 배열의 길이를 입력받고, 배열을 생성하라.
	 * 그리고, 배열의 각 인덱스를 순회하며 인덱스에 삽입할 정수를 사용자에게 입력받아 할당한다.
	 * 이후, 모든 인덱스의 삽입된 정수들의 합계를 출력하라.
	 * 
	 */
	public void ex03() {
		Scanner sc = new Scanner(System.in);
		System.out.print("배열의 길이 입력 : "); //배열의 길이를 입력 받음.
		int num = sc.nextInt();
		int [] arr = new int[num]; //사용자가 입력한 만큼의 길이를 가지는 배열 생성
		int sum = 0; //합계를 저장할 변수 sum(반복문안에서 선언하면, 반복문 외부에서 사용불가)
		
		//작성해주신 코드
		for (int i = 0; i < arr.length; i++) {
			System.out.print(i+1 + "번째 값 입력 : ");
			int n = sc.nextInt();
			arr[i] = n;
		}
		for(int i=0; i<arr.length; i++) {
			System.out.println(i+1 + "번째 값 : " + arr[i]);
			sum+=arr[i]; //sum = sum + arr[i]; 입력받는 반복문 안에서 누적을 시켜도 무방.
		}
		System.out.println("합계 : " + sum);
		/*
		//직접 작성한 코드
		for(int i = 0; i<arr.length; i++) {
			System.out.print(i+1 +"번째 값 입력 : ");
			arr[i] = sc.nextInt();
			sum+=arr[i]; 
		}
		System.out.println("합계 : " + sum);
		*/
	}
	
	/*
	 * 임의의 길이로 문자열 배열을 생성한 후, 치킨 종류를 각 인덱스에 할당한다.
	 * ex) "황금올리브","고추바사삭","허니콤보","뿌링클"
	 * 
	 * 이후, 사용자에게 먹고 싶은 치킨의 종류를 입력받고,
	 * 배열에 존재하면 "배달 가능", 존재하지 않으면 "배달 불가"를 출력하라
	 */
	public void ex04() { // 보류
		String [] strArr = {"황금올리브", "고추바사삭", "허니콤보", "뿌링클", "핫황금올리브"}; //길이 5인 배열 생성
		Scanner sc = new Scanner(System.in);
		System.out.print("먹고 싶은 치킨 입력 : ");
		String str = sc.next();
		
		//해주신 코드
		boolean bool = false; //입력한 값이 배열에 존재하는지 존재하지 않는지의 값을 저장할 변수 
		for(int i = 0; i<strArr.length; i++) {
			if(strArr[i].equals(str)) {
				//배달 가능
				System.out.println(str + "는 배달 가능");
				bool = true;
				break;
			}
		}
		// !bool -> 값이 false야?? -> false면 true, true면 false를 반환
		if(!bool) {
			System.out.println(str + "는 배달 가능");
		}
		
		/*//직접 작성한 코드
		int del = 0;
		for(int i = 0; i<strArr.length; i++) {
			if(strArr[i].equals(str)) {
				del++;
			}
			
		}
		if(del == 0) {
			System.out.println(str + "는 배달 불가");
		}
		else {
			System.out.println(str + "는 배달 가능");
		}
		*/
		
	}
	/*
	 * -메뉴 출력
	 * 		-1번
	 * 			- 입실 방번호 출력 및 입력
	 * 			if - 입실된 방번호 출력
	 * 			else - 손님이 있는 방을 입실하려고 하니, 현재 손님이 있습니다 출력 
	 * 				 - 잘못 선택 하셨습니다.
	 * 		-2번
	 *  		- 퇴실 방번호 출력 및 입력
	 * 			if - 비어있는 방을 퇴실라려고 하니, 현재 빈방입니다 출력
	 * 			else - 퇴실 방번호 출력
	 * 				 - 잘못 선택 하셨습니다.
	 * 		-3번
	 * 			- 방 리스트를 알려주며, 현재 손님이 있는지 빈 방인지 출력(총 10개의 방) => 배열 
	 * 		-4번
	 * 			- 프로그램 종료
	 * 		-그 외
	 * 			- 메뉴에 없는 
	 */
	
	public void ex05() { //보류
		Scanner sc = new Scanner(System.in);
        boolean power = true;
        
        //해주신 코드
        boolean [] roomList = new boolean [10]; //각 인덱스의 값은 false => 비어있는 방
        System.out.println("===================Motel.jar=====================");
        
        while(power) {
        	System.out.println("1.입실			2.퇴실		3.방보기			4.종료");
            System.out.print("선택 > ");
            int menu = sc.nextInt();
			switch (menu) {
			case 1: { //입실
				System.out.print("몇번방에 입실하겠습니까? : ");
				int in = sc.nextInt(); //사용자는 0부터 입력하지 않음. 1부터 입력함
				
				if(in < 1 || in > 10) {
					System.out.println("잘못 선택하셨습니다. 1 ~ 10 사이의 방 번호를 입력하세요.");
					continue; //반복문 최상단 이동. 이후 코드 실행하지 않음
				}
				if(roomList[in-1]) {//true -> 손님이 이미 존재.
					System.out.println("이미 손님이 있습니다. 다른 방을 선택하세요.");
				}else { //false -> 들어갈 수 있음.
					System.out.println(in +"번 방에 입실 하셨습니다.");
					roomList[in-1] = true; //true ->방에 입실이 됐다는것을 의미
				}
				break;
			}
			case 2: { //퇴실
				System.out.print("몇번방에서 퇴실하시겠습니까? : ");
				int out = sc.nextInt();
				
				if(out < 1 || out > 10) {
					//잘못 입력한 경우.
					System.out.println("잘못 입력하셨습니다. 1 ~ 10사이의 방 번호를 입력하세요");
					continue; //반복문 최상단 이동. 이후 코드 실행하지 않음
				}
				
				if(roomList[out-1]) {
					//true -> 손님이 있는 방 -> 퇴실이 가능
					System.out.println(out+"방에서 퇴실하셨습니다.");
					roomList[out-1] = false;
				}
				else {
					//false -> 비어있는 방 -> 퇴실 불가능
					System.out.println("현재 빈 방입니다. 퇴실 불가능");
				}
				break;
			}
			case 3: { //방보기
				for(int i = 0; i<roomList.length; i++) {
					if(roomList[i]) {
						//배열 인덱스는 0부터 시작하니, 사용자 화면에는 1번부터 출력하기 위해 i+1
						System.out.println(i+1 + "번째 방은 현재 손님이 있습니다.");
					}else {
						System.out.println(i+1 + "번째 방은 현재 빈 방입니다.");
					}
				}
				break;
			}
			case 4: { //종료
				System.out.println("프로그램을 종료합니다...");
				power = false;
				break;
			}
			default:
				System.out.println("1~4 사이의 메뉴를 입력하세요");
				break;
			}
        }
        //int[] rooms = new int[10]; //직접한 코드만 사용 각 방의 상태를 저장 (0: 비어있음, 1: 입실)

        
        //직접한 코드
        /*
        while (power) {
            System.out.println("1.입실	2.퇴실	3.방보기	 4.종료");
            System.out.print("선택 > ");
            int menu = sc.nextInt();

            switch (menu) {
                case 1:
                    System.out.print("1~10번 방 중 몇번방에 입실하시겠습니까? ");
                    int roomnum = sc.nextInt();

                    if (roomnum < 1 || roomnum > 10) {
                        System.out.println("잘못된 방 번호입니다.");
                    } else if (rooms[roomnum - 1] == 1) { 
                        System.out.println(roomnum + "번 방은 이미 사용 중입니다.");
                    } else {
                        rooms[roomnum - 1] = 1; //
                        System.out.println(roomnum + "번 방에 입실하셨습니다.");
                    }
                    break;
                case 2:
                    System.out.print("몇번방에서 퇴실하겠습니까? ");
                    roomnum = sc.nextInt();

                    if (roomnum < 1 || roomnum > 10) {
                        System.out.println("잘못된 방 번호입니다.");
                    } else if (rooms[roomnum - 1] == 0) { 
                        System.out.println(roomnum + "번 방은 비어 있습니다.");
                    } else {
                        rooms[roomnum - 1] = 0;
                        System.out.println(roomnum + "번 방에서 퇴실하셨습니다.");
                    }
                    break;
                case 3:
                    for (int i = 0; i < rooms.length; i++) {
                        System.out.print((i + 1) + "번 방: ");
                        if(rooms[i] == 1) {
                        	System.out.print("입실\n");
                        }
                        else {
                        	System.out.print("비어있음\n");
                        }
                    }
                    break;
                case 4:
                    System.out.println("프로그램을 종료합니다.");
                    power = false;
                    break;
                default:
                    System.out.println("메뉴에 없는 번호입니다. 다시 입력해주세요.");
            }
        }
        */
	}
	
	/*
	 * 사용자에게 3 이상의 홀수(배열 길이)를 입력받고,
	 * 배열 중간까지는 1씩 증가하며 대입, 이후부터는 1씩 감소하며 대입.
	 * 단, 3보다 작은 수를 입력하거나 짝수 입력 시, 적절한 문구를 출력하고
	 * 다시 정수를 입력 받는다.
	 */
	public void ex06() { //보류
		Scanner sc = new Scanner(System.in);
		
		//해주신 코드
		while(true) {
			System.out.print("정수 입력 : ");
			int n = sc.nextInt();
			
			if(n%2==0) {
				System.out.println("홀수만 입력하세요.");
				continue;
			}
			
			if(n<3) {
				System.out.println("3이상의 홀수를 입력하세요.");
				continue;
			}
			
			//실행흐름이 이 라인에 도달한다 == 3이상의 홀수를 입력했다.
			int [] arr = new int[n];
			
			int cnt = 0; //실제 배열에 들어갈 값
			
			for(int i = 0; i<arr.length; i++) {
				if(i <= arr.length/2){
					cnt++;
				}else {
					cnt--;
				}
				arr[i] = cnt;
			}
			for(int i = 0; i< arr.length; i++) {
				System.out.print(arr[i] + " ");
			}
			
			break;
		}
		
		//직접한 코드
		/*
		System.out.print("정수 입력 : ");
		int n = sc.nextInt();
		
		int count = 0;
		
		if((n>= 3 && n%2==1)) {
			int[] arr = new int[n];
			
			for(int i = 0; i<arr.length; i++) {
				if(i<=arr.length/2) {
					arr[i] = ++count;
				}
				else {
					arr[i]= --count;
				}
			}
			for(int i = 0; i< arr.length; i++) {
				System.out.print(arr[i] + " ");
			}
		}
		else {
			System.out.println("다시 입력하세요");
		}
		*/
	}
	
	/*
	 * 길이가 5인 정수형 배열을 선언하고, 각 인덱스에 1~9999 사이의 값을 입력받아 할당한다.
	 * 단, 입력범위 초과 또는 배열 내부에 중복값 존재 시, 다시 입력받는다.
	 * 모두 입력받은 이후, 배열 내부 값과 최대값, 최소값을 출력한다.
	 */
	public void ex07() { //못함
		Scanner sc = new Scanner(System.in);
		int[] arr = new int[5];// 길이가 5인 정수형 배열 생성

		int max = 0; // 임의의 최댓값
		int min = 10000; // 임의의 최소값

		for (int i = 0; i < arr.length; i++) {
			System.out.print(i + 1 + "번째 정수 입력 : ");
			int num = sc.nextInt();

			if (num < 1 || num > 9999) {
				// true -> 입력 범위 오류..
				System.out.println("1~9999 사이의 숫자를 입력하세요");
				i--;
				continue; // for문 ()의 증감식으로 이동합니다. -> i++
			}

			boolean duplChk = true; // 중복값이 존재하는지 체크할 변수 duplChk
			
			for (int k = 0; k < i; k++) { //k<i : 현재의 i 인덱스에는 방금 입력한 값이 들어가야 함. 즉, 비교 대상은 현재 인덱스 이전까지의 값들.
				System.out.println("비교 대상 : " + arr[k]); // 중복값을 체크할 비교 값

				if (arr[k] == num) {
					// 중복값이 존재한다.
					System.out.println("중복값 존재! 다시 입력하세요");
					i--;
					duplChk = false;
					break; // 중복값이 존재한다는건 이후의 인덱스의 값을 비교할 필요가 없다.
				}
			}

			// 할당 or 최대값 or 최소값
			if (duplChk) {
				// 중복값이 존재하지 않을 때.
				arr[i] = num;
				max = max < num ? num : max; // 입력값이 현재의 최대값보다 더 크면 max 값을 변경
				min = min > num ? num : min; // 입력값이 현재의 최소값보다 더 작으면 min 값을 변경
			} //if
		}
		
		for(int i = 0; i<arr.length; i++) {
			System.out.print(arr[i]+" ");
		}
		System.out.println("\nMAX : " + max); //최대값
		System.out.println("MIN : " + min); //최소값
	}
	
	public void ex08() {
		int [] arr1 = {9,20,28,18,11};
		int [] arr2 = {30,1,21,17,28};
		
		String [] res = new String[arr1.length];
		
		for(int i = 0; i<arr1.length; i++) {
			/*
			 arr1 i번째 인덱스의 값 -> 2진수
			 arr2 i번째 인덱스의 값 -> 2진수
			 */
			
			int num = arr1[i] | arr2[i]; //각 인덱스의 값을 OR 연산한 결과
			String resStr = "";//res 배열에 들어갈 # 또는 공백을 담을 변수 str
			
			//방법2
			//String ss = Integer.toBinaryString(num).replaceAll("0", " ").replaceAll("1", "#");
			
			
			//방법1
			while(true) {
				if(num%2 == 0) {//나머지가 0일 때
					resStr = " " + resStr;
				}else { //나머지 1일 때는 #으로 표기
					resStr = "#" + resStr;					
				}
				
				if(num/2<1) { //현재 몫이 0일때까지
					break;
				}
				num /= 2;
			}
			
			res[i] = resStr; //## ## 형식인 resStr을 각 인덱스에 할당.
	
		}
		
		for(int i = 0; i<res.length; i++) {
			String resStr = "|" + String.format("%"+ res.length + "s", res[i])+ "| ";
			System.out.println(resStr);
		}
	}
}
