package kr.or.iei.after.start;

import kr.or.iei.after.model.vo.*;

public class Start {

	public static void main(String[] args) {
		TV tv1 = new TV();
		tv1.setPower(false);
		tv1.getChannerl();
		
		//TV 클래스를 상속받은 LgTV
		LgTV lgTv1 = new LgTV();
		lgTv1.setPower(false);
		lgTv1.getChannerl();
		
		
		//TV 클래스를 상속받은 SamsungTV
		SamsungTV samTv1 = new SamsungTV();
		samTv1.setChannerl(0);
		samTv1.getInch();
		
		//LgTV 클래스를 상속 받은 Model1
		LgTVModel1 lgmodel1 = new LgTVModel1();
		lgmodel1.getChannerl();
		lgmodel1.setInch(0);
		
		//SamsungTV 클래스를 상속 받은 Model2
		SamsungTVModel2 samModel2 = new SamsungTVModel2();
		samModel2.getChannerl();
		samModel2.setChannerl(0);
		
		
		/*
		 * 
		 * tv1			->TV
		 * lgTV1		->LgTV
		 * samTV1		->SamsungTV
		 * lgmodel1		->LgTVModel1
		 * samModel2 	->SamsungTVModel2
		 * 
		 */
		/*
		//LgTV 클래스에 showYoutube() 기능 추가 후, 각 객체마다 접근 결과
		lgTv1.showYoutube();
		lgmodel1.showYoutube();
		//samModel2.showYoutube();
		//samTv1.showYoutube();
		//tv1.showYoutube();
		
		//SamsungTV 클래스에 showWeather()기능 추가 후, 각 객체마다 접근 결과		
		//lgTv1.showWeather();
		//lgmodel1.showWeather();
		//tv1.showWeather();
		
		samModel2.showWeather();
		samTv1.showWeather();
		
		//TV 클래스에 showMenu() 기능 추가 후, 각 객체마다 접근 결과 
		lgTv1.showMenu();
		lgmodel1.showMenu();
		samModel2.showMenu();
		samTv1.showMenu();
		tv1.showMenu();
		*/
		
		//TV 클래스에 whoAmI() 기능 추가 후, 각 객체마다 접근 결과
		//whoAmI() 멧드 TV 클래스에 작성되어, 모든 하위 클래스에서 접근은 가능하지만
		//오버라이딩 하기 이전의 결과와, 오버라이딩 한 이후의 결과가 다르다 -> 오버라이딩을 하면 오버라이딩한 메소드가 호출된다.
		lgTv1.whoAmI();
		lgmodel1.whoAmI();
		samModel2.whoAmI();
		samTv1.whoAmI();
		tv1.whoAmI();
		
	}

}
