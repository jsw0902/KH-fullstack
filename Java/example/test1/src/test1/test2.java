package test1;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;

public class test2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner scanner = new Scanner(System.in);
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm"); // 시간 형식 수정

        // 출근 시간 입력 및 저장
        System.out.print("출근 시간을 입력하세요 (HH:mm): ");
        String workStartTimeStr = scanner.nextLine();
        Date workStartTime = null;
        try {
            workStartTime = sdf.parse(workStartTimeStr);
        } catch (ParseException e) {
            System.out.println("잘못된 시간 형식입니다.");
            return;
        }

        // 퇴근 시간 입력
        System.out.print("퇴근 시간을 입력하세요 (HH:mm): ");
        String workEndTimeStr = scanner.nextLine();
        Date workEndTime = null;
        try {
            workEndTime = sdf.parse(workEndTimeStr);
        } catch (ParseException e) {
            System.out.println("잘못된 시간 형식입니다.");
            return;
        }

        // 남은 시간 계산 (밀리초 단위)
        long diffInMillies = workEndTime.getTime() - workStartTime.getTime();
        // 음수 값 처리 및 절대값 계산
        diffInMillies = Math.abs(diffInMillies);

        // 밀리초를 시간과 분으로 변환
        long diffInHours = diffInMillies / (60 * 60 * 1000);
        long diffInMinutes = (diffInMillies % (60 * 60 * 1000)) / (60 * 1000);

        System.out.println("오늘 근무 시간은 " + diffInHours + "시간 " + diffInMinutes + "분 입니다.");

	}

}
