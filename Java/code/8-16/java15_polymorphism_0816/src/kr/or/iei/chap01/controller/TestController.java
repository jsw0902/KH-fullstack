package kr.or.iei.chap01.controller;

import kr.or.iei.chap01.model.vo.*;

public class TestController {

	/*
	 * test.insertTv(tv); 
	 * test.insertSamTv(samTv); 
	 * test.insertSamM1Tv(samTvModel1);
	 * test.insertSamM2Tv(samTvModel2); 
	 * test.insertLgTv(lgTv);
	 * test.insertLgM1Tv(lgTvModel1); 
	 * test.insertLgM2Tv(lgTvModel1);
	 */
	
	public void insertTv(TV tv) {
		/*
		 30,000줄 짜리의 insert 코드
		 */
	}
	public void insertSamTv(SamsungTV samTv) {
		/*
		 30,000줄 짜리의 insert 코드
		 */
	}
	public void insertSamM1Tv(SamsungTVModel1 amTvModel1) {
		/*
		 30,000줄 짜리의 insert 코드
		 */
	}
	public void insertSamM2Tv(SamsungTVModel2 amTvModel2) {
		/*
		 30,000줄 짜리의 insert 코드
		 */
	}
	public void insertLgTv(LgTV lgTv) {
		/*
		 30,000줄 짜리의 insert 코드
		 */
	}
	public void insertLgM1Tv(LgTVModel1 lgTvModel1) {
		/*
		 30,000줄 짜리의 insert 코드
		 */
	}
	public void insertLgM2Tv(LgTVModel1 lgTvModel1) {
		/*
		 30,000줄 짜리의 insert 코드
		 */
	}
	
	public void insertTvs(TV tv) {
		/*
		 30,000줄 짜리의 insert 코드
		 */
		
		//((SamsungTV)tv).getSamsungFunc(); //현재 tv가 어느 객체 주소를 참조하고 있는지 알 수 없으므로, LgTV 객체가 전달되었을 때, CaseException 발생
		
		//instanceof : 현재 tv 변수가 어떤 객체의 주소를 참조하고 있는지를 비교하는 연산자 
		if(tv instanceof SamsungTV) {
			((SamsungTV)tv).getSamsungFunc();
		} else if(tv instanceof LgTV) {
			((LgTV)tv).getLgTVFunc();
		} else if(tv instanceof LgTVModel1) {
			
		}
		
		//각 자식 클래스에서 재정의한(오버라이딩) 메소드가 호출됨. => 동적 바인딩
		tv.overrideMethod();
	}
	
	public TV returnTv() {
		return new TV();
	}
	public TV returnSamTv() {
		return new SamsungTV();
	}
	public TV returnLgTv() {
		return new LgTV();
	}
	public TV returnSamM1Tv() {
		return new SamsungTVModel1();
	}
	public TV returnSamM2Tv() {
		return new SamsungTVModel2();
	}
	public TV returnLgM1Tv() {
		return new LgTVModel1();
	}
	public TV returnLgM2Tv() {
		return new LgTVModel2();
	}
	/*
	public TV returnTvs() {
		if(true) {
			return new LgTV();
		}else if(true) {
			return new SamsungTVModel1();
		}else if(true) {
			return new LgTVModel2();
		}else if(true) {
			return new TV();
		}else if(true) {
			return new LgTVModel1();
		}else 
	}
	*/
}
