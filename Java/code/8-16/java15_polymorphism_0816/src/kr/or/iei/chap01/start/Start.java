package kr.or.iei.chap01.start;

import kr.or.iei.chap01.model.vo.*;
import kr.or.iei.chap01.controller.*;

/*
 * 다형성 : 객체지향 프로그래밍 3대 원칙 중, 1가지로 여러가지 형태를 갖는다는 의미.
 * 		- 하나의 타입에 여러 객체를 대입할 수 있는 성질.
 * 		- 자식 객체를 부모 클래스 타입 변수로 다룰 수 있는 기능. (상속 관계)
 * 		- 형제(동일 부모클래스를 상속받은 두 개 이상의 클래스) 관계에서는 다형성 적용이 되지 않는다.
 * 		- 부모 클래스에 정의된 메소드를, 자식 클래스에서 재정의한 상태 및 다형성 적용이 된 상태의 객체에서
 * 		  메소드 호출 시, 재정의된 메소드가 호출되는 것을 "동적 바인딩"이라고 한다.(실행 시점에서 호출 메소드가 결정되는 것)
 * 		- 다형성 적용 시, 매개변수 또는 반환형을 부모 클래스 타입ㅇ으로 작성하여 실행코드의 양이 줄어든다.
 * 		- 현재 객체가 참조하고 있는 형태가 어떤 타입인지 확인하기 위한 연산자는 instanceof
 * 
 * 
 * 
 * 		- [업 캐스팅]
 * 
 * 		  부모 클래스 약어 = new 자식 클래스();
 * 
 * 
 * 		- [다운 캐스팅]
 * 
 * 		  ((자식클래스)약어).메소드명();
 */
public class Start {

	public static void main(String[] args) {
		TV tv = new TV();
		SamsungTV samTv = new SamsungTV();
		LgTV lgTv = new LgTV();
		
		//다형성을 적용한 객체화.
		//부모클래스 약어 = new 자식클래스();
		TV tv1 = new SamsungTV(); //업 캐스팅
		TV tv2 = new LgTV();
		
		//자식클래스 약어 = new 부모클래스();
		//SamsungTV samTv1 = new TV();
		//LgTV lgTv1 = new TV();

		//TV 클래스에 작성된 메소드 : 접근 가능
		tv1.setChannerl(20);
		tv1.getInch();
		tv1.isPower();
		
		//SamsungTV 클래스에 작성된 메소드 : 접근 불가(주소는 자식 클래스 객체의 주소값을 가지고 있지만, 변수의 타입이 부모클래스 ) 
		//tv1.getSamsungFunc();
		//tv2.getLgTVFunc();
		
		//자식 클래스에 작성된 메소드에 접근하기 위해, 강제로 다운 캐스팅을 진행해야 한다.
		((SamsungTV)tv1).getSamsungFunc(); //다운 캐스팅 
		((LgTV)tv2).getLgTVFunc(); //다운 캐스팅
		
		//형제 관계끼리는 업 캐스팅, 다운 캐스팅. 즉, 다형성 적용이 되지 않는다
		//((SamsungTV)lgTv).getSamsungFunc();
		
		System.out.println("samTv.getSamsungFunc() : " + samTv.getSamsungFunc());
		//samTv.overrideMethod();
		samTv.overrideMethod();
		
		//tv1의 객체 타입은 TV지만, SamsungTV에서 재정의한 메소드가 호출됨.
		//동적 바인딩에 의해, 자식 클래스에서 재정의한 메소드가 호출됨
		tv1.overrideMethod(); //SamsungTV 클래스에 작성된 메소드가 호출
		tv2.overrideMethod(); //LgTV 클래스에 작성된 메소드가 호출
		
		//다향성의 적용 이유
		
		//다향성 적용 이전
		
		//Controller 클래스에 각 TV 정보를 데이터베이스에 저장하는 메소드를 작성.
		/*
		 tv    : TV tv1 = new TV();
		 samTv : SamsungTV samTV = new SamsungTV();
		 lgTV  : LgTV lgTv = new LgTV();
		 */
		
		SamsungTVModel1 samTvModel1 = new SamsungTVModel1();
		SamsungTVModel2 samTvModel2 = new SamsungTVModel2();
		LgTVModel1 lgTvModel1 = new LgTVModel1();
		LgTVModel2 lgTvModel2 = new LgTVModel2();
		
		TestController test = new TestController();
		
		test.insertTv(tv);
		test.insertSamTv(samTv);
		test.insertSamM1Tv(samTvModel1);
		test.insertSamM2Tv(samTvModel2);
		test.insertLgTv(lgTv);
		test.insertLgM1Tv(lgTvModel1);
		test.insertLgM2Tv(lgTvModel1);
		
		
		//다향성 적용 후 
		TV tv9 = new TV();
		TV samTv9 = new SamsungTV();
		TV lgTv9 = new LgTV();
		TV samTvModel19 = new SamsungTVModel1();
		TV samTvModel29 = new SamsungTVModel2();
		TV lgTvModel19 = new LgTVModel1();
		TV lgTvModel29 = new LgTVModel2();
		
		test.insertTvs(tv9);
		test.insertTvs(samTv9);
		test.insertTvs(lgTv9);
		test.insertTvs(samTvModel19);
		test.insertTvs(samTvModel29);
		test.insertTvs(lgTvModel19);
		test.insertTvs(lgTvModel29);
		
		TV reTv = test.returnTv();
		TV reSamTv = test.returnSamTv();
		TV reLgTv = test.returnLgTv();
		TV reSamM1Tv = test.returnSamM1Tv();
		TV reSamM2Tv = test.returnSamM2Tv();
		TV reLgTv1 = test.returnLgM2Tv();
		TV reLgTv2 = test.returnLgM2Tv();
		
		//TV reTvs = test.returnTvs();
		
		//객체 배열에서의 다형성 적용
		TV [] tvArr = new TV[10];
		//TV [] tvArr = new SamsungTV[10]; //이렇게 사용 금지
		tvArr[0] = new SamsungTV();
		tvArr[1] = new LgTV();
		tvArr[2] = new SamsungTVModel1();
		tvArr[3] = new SamsungTVModel2();
		tvArr[4] = new LgTVModel1();
		tvArr[5] = new LgTVModel2();
	}

}
