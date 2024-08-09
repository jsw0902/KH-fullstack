package kr.or.iei.random;

import java.util.Random;
import java.util.Scanner;

/*
 랜덤(난수) : 임의의 숫자
 	- 컴퓨터는 랜덤 숫자를 줄 수 없음. (내부 알고리즘을 통해, 임의의 숫자를 반환)
 	- 용도 : 인증 코드와 같이 사용..
 */
public class RandomClass {
	
	public void ranTest1() {	
		Random ran = new Random();
		
		//Random.nextInt(); ->임의의 숫자를 반환
		int num = ran.nextInt();//int형이 표현할 수 있는 범위내에서 임의의 숫자를 반환
		System.out.println("num1 : " + num);
		
		num = ran.nextInt(10); //0부터 9까지의 숫자 중, 임의의 숫자를 반환
		System.out.println("num2 : " + num);

		num = ran.nextInt(99); //0부터 98까지의 숫자 중, 임의의 숫자를 반환
		System.out.println("num3 : " + num);
		
		//만약 1부터 10까지의 숫자를 반환
		num = ran.nextInt(10); //0부터 9
		num = ran.nextInt(10)+1; //1부터 10
		
		System.out.println("num4 : " + num);
		
		
		//10~30 사이의 숫자 중, 임의의 수 반환
		num = ran.nextInt(21)+10;		
		/*
		 ran.nextInt(갯수)+시작숫자;
		 
		 */
		System.out.println("num5 : " + num);
	}
	public void ranTest2() {
		Random ran = new Random();
		Scanner sc = new Scanner(System.in);
		
		System.out.println("=============== 동전 앞/뒤 맞추기 게임 ==================");
		//난수를 발생 && 맞추기
		int coin = ran.nextInt(2)+1; //1 또는 2
		System.out.print("숫자를 입력해주세요 : ");
		int num = sc.nextInt();
		
		if(coin == num) {
			System.out.print("맞추셨습니다.");
		}
		else {
			System.out.print("땡입니다.");
		}
	}
	public void ranTest3() {
		Random ran = new Random();
		Scanner sc = new Scanner(System.in);
		
		boolean power = true;
		
		int win = 0;
		int lose = 0;
		
		
		while(power) {
			System.out.println("==================== 동전 앞/뒤 맞추기 게임 ====================");
			System.out.println("1. 게임 시작");
			System.out.println("2. 전적 확인");
			System.out.println("0. 게임 종료");
			
			System.out.print("선택 -> ");
			int menu = sc.nextInt();
			switch(menu) {
			case 1: //게임 시작
				int coin = ran.nextInt(2)+1; //1 또는 2
				System.out.print("동전 맞춰 (1. 앞면, 2 뒷면) : ");
				int num = sc.nextInt();
				if(coin == num) {
					System.out.print("맞추셨습니다.");
					win++;
				}
				else {
					System.out.print("땡입니다.");
					lose++;
				}
				System.out.println("컴퓨터(동전) : " + (coin==1?"앞면" : "뒷면"));
				
				break;
			case 2:
				System.out.println("이긴 횟수: " + win);
				System.out.println("패배 횟수: " + lose);
				break;
			case 0: //게임 종료
				System.out.println("프로그램이 종료되었습니다.");
				power = false;
				break;
			default : //그 외
				System.out.println("1 또는 0 숫자를 입력하세요.");
				break;
				
			}//switch
			
		} //while
	}
	
	//가위, 바위, 보
	public void rps() {
		Random ran = new Random();
		Scanner sc = new Scanner(System.in);
		
		boolean power = true;
		int win = 0;
		int lose = 0;
		int draw = 0;
		//메뉴는 게임 시작, 전적 확인, 게임 종료
		while(power) {
			
			System.out.println("========== 가위 바위 보 ==========");
			System.out.println("1. 게임 시작");
			System.out.println("2. 전적 확인");
			System.out.println("0. 게임 종료");
			System.out.print("선택 -> ");
			int menu = sc.nextInt();
			switch(menu) {
			case 1: //게임 시작
				while(true) {
					System.out.print("선택(1. 가위, 2. 바위, 3. 보) : ");
					int user = sc.nextInt();
					if(user == 1) {
						System.out.println("당신은 가위를 선택했습니다.");
					}
					else if(user == 2) {
						System.out.println("당신은 바위를 선택했습니다.");
					}
					else if(user == 3) {
						System.out.println("당신은 보를 선택했습니다.");
					}
					else {
						System.out.println("잘못 입력하셨습니다.");
					}
					int com = ran.nextInt(3)+1;
					
					if(com == 1) {
						System.out.println("컴퓨터는 가위를 선택했습니다.");
					}
					else if(com == 2) {
						System.out.println("컴퓨터는 바위를 선택했습니다.");
					}
					else if(com == 3) {
						System.out.println("컴퓨터는 보를 선택했습니다.");
					}
					
					System.out.println("=========== 결과 ==========");
					
					if((user == 1 && com == 3) || (user == 2 && com == 1) || (user == 3 && com == 2)) {
						System.out.println("당신이 이겼습니다.");
						win++;
						break;
					}
					else if(user == com) {
						System.out.println("비겼습니다.");
						draw++;
					}
					else {
						System.out.println("당신이 졌습니다.");
						lose++;
						break;
					}
				}
				break;
			case 2:
				System.out.println("이긴 횟수 : " + win);
				System.out.println("비긴 횟수 : " + draw);
				System.out.println("진 횟수 : " + lose);
				break;
			case 0:
				power = false;
				break;
			default:
				System.out.println("0 또는 1 또는 2번을 입력하세요.");
				break;
			} //switch
		}//while
		
	}

}
