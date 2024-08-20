package kr.or.iei.date;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Scanner;

public class Start {

	public static void main(String[] args) {
		Date date1 = new Date();
		System.out.println("date1 : " + date1);
		//요일 월 일자 시간:분:초 KST(Korea Standard Time)연도
		
		Date date2 = new Date(2022-1900, 10-1, 18);
		System.out.println("date2 : " + date2);

		//1970년 1월 1일 9시 00분 00초 기준으로 전달해준 매개변수만큼(ms) 흐른 시점의 날짜 정보 세팅
		Date date3 = new Date(1735568898795L);
		System.out.println("date3 : " + date3);
		
		//기본 생성자를 이용해 생성된 객체 정보에 setter 메소드를 사용해 날짜 정보 세팅
		date1.setMonth(10-1);
		date1.setDate(18);
		System.out.println("date1 : " + date1);
		
		
		//--------------------------------------------------------------------------------------------
		
		Calendar cal1 = Calendar.getInstance();
		cal1.set(2024, 7, 19); //월 정보는 0부터 시작하기 때문에, 7 -> 8월
		System.out.println("year : " + cal1.get(Calendar.YEAR));
		System.out.println("month : " + (cal1.get(Calendar.MONTH)+1));
		System.out.println("day : " + cal1.get(Calendar.DATE));
		
		cal1.set(Calendar.MONTH, Calendar.MARCH); //MONTH 정보에 Calendar.MARCH 세팅
		System.out.println("month : " + (cal1.get(Calendar.MONTH)+1));
		
		//현재 요일이 일주일중에 몇번째에 해당하는지
		//일 : 1, 월 : 2, 화요일 : 3, 수요일 : 4, 목요일 : 5, 금요일 : 6, 토요일 : 7
		//2024 / 03 / 19 == 화요일 == 3
		System.out.println("day of week : " + cal1.get(Calendar.DAY_OF_WEEK));
		
		//--------------------------------------------------------------------------------------------
		
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy년 MM월 dd일 hh시 mm분 ss초");
		String formatDate1 = sdf1.format(date1); //지정한 형식에 맞게끔 Date(날짜 정보)를 포맷팅
		System.out.println("formarDate1 : " + formatDate1);
		
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy년 MM월 dd일"); //대문자 주의!
		String formatDate2 = sdf2.format(date3);
		System.out.println("formatDate2 : " + formatDate2);
		
		SimpleDateFormat sdf3 = new SimpleDateFormat("HH:mm:ss.SSS");
		String nowTime = sdf3.format(new Date(System.currentTimeMillis()));
		System.out.println("formatDate3 nowTime : " + nowTime);
		
		//--------------------------------------------------------------------------------------------
		
		Scanner sc = new Scanner(System.in);
		
		System.out.println("==========================d-day 계산기==========================");
		System.out.print("d-day[년도] 입력 : ");
		int dYear = sc.nextInt();
		System.out.print("d-day[월] 입력 : ");
		int dMonth = sc.nextInt();
		System.out.print("d-day[일] 입력 : ");
		int dDay = sc.nextInt();
		
		Calendar cal2 = Calendar.getInstance();
		System.out.println("현재 날짜 : " + cal2.get(Calendar.YEAR) + "년 " +
										  (cal2.get(Calendar.MONTH)+1) + "월 " +
										  cal2.get(Calendar.DATE) + "일");
		
		long now = cal2.getTimeInMillis(); //현재 날짜 정보를 ms(밀리세컨드) 단위로 조회
		
		System.out.println("d-day 날짜 : " + dYear + "년 " + dMonth + "월 " + dDay + "일");
		
		//d-day 날짜 정보 세팅
		cal2.set(Calendar.YEAR, dYear); //연도 세팅
		cal2.set(Calendar.MONTH, dMonth-1); //월 정보 세팅(입력받은 월이 4월이면, 3으로 세팅해야함)
		cal2.set(Calendar.DATE, dDay); // 일 정보 세팅
		
		long dDays = cal2.getTimeInMillis(); // dDay 날짜 정보를 ms(밀리세컨드) 단위로 조회
		
		if(now == dDays) {
			System.out.println("D-Day 입니다! 1주년 축하드려요");
		} else if(dDays > now){
			System.out.println(((dDays-now) / (1000*60*60*24)) + "일 남았습니다.. 열심히 돈 모으세요");
		} else {
			System.out.println(((now-dDays) / (1000*60*60*24)) + "일 지났습니다.. 다음 기념일을 위해 돈을 모아주세요");
		}
		
		
	}
}
