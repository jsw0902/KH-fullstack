package kr.or.iei.random;

import java.util.Random;
import java.util.Scanner;

public class RandomEx {
	public void ex01() {
		Random ran = new Random();
		Scanner sc = new Scanner(System.in);
		boolean power = true;
		int records = -1; // 최고기록을 저장할 변수

		while (power) {
			System.out.println("== Up & Down Game ==");
			System.out.println("1. Game Start");
			System.out.println("2. Game Score");
			System.out.println("3. End Game");
			System.out.print("선택 > ");
			int n = sc.nextInt();

			switch (n) {
			case 1:
				boolean bool = true;
				int coin = ran.nextInt(99) + 1;
				int count = 1;
				System.out.println("<< Game Start >>");
				while (bool) {
					System.out.print("Input Number: ");
					int num = sc.nextInt();

					if (num < 1 || num > 99) {
						System.out.println("입력 범위 오류입니다. 1~99사이의 숫자를 입력하세요");
					} else if (num > coin) {
						System.out.println("<< donw >>");

					} else if (num < coin) {
						System.out.println("<< up >>");

					} else {
						System.out.println("<< 정답 >>");
						if (records > count || records == 0) {
							// 최고 횟수 > 현재 횟수
							records = count;
						}
						bool = false;
					}
					count++; // 결과에 상관없이, 시도 횟수는 증가해야됨
				}
				break;
			case 2:
				// 최고 기록
				if (records == 0) {
					System.out.println("아직 게임 진행 기록이 없습니다. ");
				} else {
					System.out.println("현재 최고 기록은 " + records + "회 입니다.");
				}
				break;
			case 3:
				power = false;
				break;
			default:
				System.out.println("메뉴를 잘못 입력하셨습니다.");
				break;
			}
		}

	}

	public void ex02() {
		Random ran = new Random();
		Scanner sc = new Scanner(System.in);
		boolean power = true;
		int win = 0;
		int lose = 0;
		while (power) {
			System.out.println("== Up & Down Game ==");
			System.out.println("1. Game Start");
			System.out.println("2. Game Score");
			System.out.println("3. End Game");
			System.out.print("선택 > ");
			int n = sc.nextInt();
			switch (n) {
			case 1:
				int print = 0;
				System.out.println("<< Game Start >>");
				while (true) {
					System.out.print("Input Number(1~3) : ");
					int num = sc.nextInt();

					if (num < 1 || num > 3) {
						continue; // 범위를 넘어선 경우, 다시 재입력을 받을 수 있도록 처리
					}
					for (int i = 0; i < num; i++) {
						print++; // 이전의 컴퓨터가 입력한 숫자가 4,5이고, 사용자 입력 숫자가 2면 6, 7을 출력해야함
						System.out.println(print + "!");
						if (print == 31) {
							System.out.println("당신이 졌습니다..");
							lose++;
							break;
						}
					}
					if (print == 31) {
						break;
					}

					System.out.println("<<<<< Computer Turn >>>>>");
					int comNum = ran.nextInt(3) + 1;// 1~3사이의 난수를 발생시킴
					for (int i = 0; i < comNum; i++) {
						print++;
						System.out.println(print + "!");
						if (print == 31) {
							System.out.println("당신이 이겼습니다..");
							win++;
							break;
						}
					}
					//내부 for문의 break문은 단순히, for문을 종료시키기 때문에 한 번 더 체크하여, while문 탈출 
					if (print == 31) {
						break;
					}
				}

				break;
			case 2:
				System.out.println("WIN :" + win);
				System.out.println("LOSE : " + lose);
				break;
			case 3:
				System.out.println("프로그램을 종료합니다.");
				power = false;
				break;
			default:
				System.out.println("입력하신 것이 메뉴에 없습니다.");
				break;

			}
		}
	}
}
