package kr.or.iei.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;

public class SetController {

	/*
	 Set - HashSet
	 
	 - 순서를 유지하지 않고 저장
	 - 중복값을 저장하지 못함.(null값도 중복 저장이 불가능하다)
	  
	  
	 */
	
	public void setTest() {
		//선언 및 생성
		HashSet<Integer> set = new HashSet<Integer>();
		
		//추가
		set.add(10);
		set.add(20);
		set.add(30);
		
		//크기 확인
		System.out.println("set size : " + set.size());
		
		//set 데이터 확인(순서라는 개념이 존재하지 않아, add()메소드를 사용해 추가한 순서대로 출력되지 않음)
		System.out.println("set : " + set);
		set.add(40);
		System.out.println("set : " + set);
		
		//중복값 저장 불가(null 또한 중복 저장 불가)
		/*
		set.add(20);
		System.out.println("set : " + set);
		set.add(null); //Set 선언 시, Integer 타입으로 지정. 참조자료형이므로 빈 값을 의미하는 null이 추가 가능.
		System.out.println("set : " + set);
		set.add(null);
		System.out.println("set : " + set);
		*/
		
		//add()의 반환 : boolean
		System.out.println("set 50 add return : " + (set.add(50))); //true
		System.out.println("set : " + set);
		System.out.println("set 20 add return : " + set.add(20));//false(중복값)
		System.out.println("set : " + set);
		
		set.remove(10);
		System.out.println("set : " + set);
		
		System.out.println("set 20 remove return : " + set.remove(20)); //true
		System.out.println("set 60 remove return : " + set.remove(60)); //false(삭제할 데이터가 존재하지 않음)
		
		//값이 존재하는지? : contains()
		System.out.println("set : " + set);
		boolean bool1 = set.contains(30);
		System.out.println("set 30 contains : " + bool1); //현재 set안에 30이 존재하므로, true 반환
		boolean bool2 = set.contains(70);
		System.out.println("set 70 contains : " + bool2); //없는 값 70 확인 결과 == false
		
		//Set은 순서의 개념이 없기 때문에, 특징 데이터에 접근이 불가(list처럼 get(인덱스) 불가)
		
		//방법 1)
		//Set => Iterator화 해야 한다.(반복자)
		Iterator<Integer> iter = set.iterator();
		System.out.println("iter hasNext() : " + iter.hasNext());
		
		while(iter.hasNext()) {
			System.out.println("value : " + iter.next());
		}
		
		//StringTokenizer와 같이, next() 메소드를 사용하면 토큰의 갯수가 줄어듬. 모두 가져오고 next() 실행 시,
		//남아있는 토큰이 없기 때문에 NoSuchElementException 발생
		//iter.next();
		
		//방법2) forEach 사용
		for(int num : set) { //언박싱
			System.out.println("for value : " + num);
		}
		//토큰과 다른 개념이므로, set안의 데이터를 여러번 사용 가능
		for(int num : set) { //언박싱
			System.out.println("for value : " + num);
		}
		
		//방법 3) ArrayList 사용
		ArrayList<Integer> list = new ArrayList<Integer>(set);
		
		System.out.println("list.get(0) : " + list.get(0));
		System.out.println("list.get(1) : " + list.get(1));
		System.out.println("list.get(2) : " + list.get(2));
		
		for(int i = 0; i<list.size(); i++) {
			System.out.println(i + "번째 : " + list.get(i));
		}
		
		//전체 삭제
		System.out.println("set : " + set);
		set.clear();
		System.out.println("set : " + set);
		
		//비어있는지 검사 isEmpty()
		System.out.println("set is Empty ? : " + set.isEmpty());
		System.out.println("set is null ? : " + (set == null)); //내부 데이터가 없을 뿐, new를 통해 주소 할당받음 == false 출력
		
		
	}
}
