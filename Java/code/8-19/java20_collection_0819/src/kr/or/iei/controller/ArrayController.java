package kr.or.iei.controller;

import java.util.ArrayList;
import java.util.Collections;

public class ArrayController {
	/*
	 Collection(컬렉션) : 자바의 자료구조를 담당하는 Framework
	 	- 자료구조 : 메모리상의 자료를 구조적으로 처리하는 방법
	 	- 프레임워크 : 이미 만들어져 있는 '틀'
	 	
	 List - ArrayList
	
		1) 순서를 유지하고 저장
		2) 중복 저장이 가능
		3) 길이를 저장할 필요가 없다.
	
	 */
	public void test() {
		//ArrayList 생성
		ArrayList<Integer> list = new ArrayList<Integer>(); //정수를 관리하는 리스트 객체 생성
		
		//추가
		list.add(10);
		list.add(2);
		list.add(30);
		list.add(15);
		
		System.out.println("list : " + list);
		
		list.add(2); //중복값 저장 가능
		System.out.println("list : " + list);
		
		list.add(1, 33); //1번째 인덱스에 정수 33 추가
		System.out.println("list : " + list);
		
		//리스트의 길이
		System.out.println("list 길이 : " + list.size());
		list.add(54);
		System.out.println("list 길이 : " + list.size());
		
		//조회
		System.out.println("list의 3번째 인덱스 값: " + list.get(3));
		System.out.println("list의 5번째 인덱스 값: " + list.get(5));
		
		//위치값 조회
		System.out.println("list에서 30 위치 조회: " + list.indexOf(30));
		System.out.println("list에서 2 위치 조회: " + list.indexOf(2)); //앞에서부터 순차적으로 탐색, 첫번째 발견한 값의 위치를 반화
		System.out.println("list에서 2 위치 조회(뒤에서부터): " + list.lastIndexOf(2)); //뒤에서부터 순차적으로 탐색 반환되는 위치는 앞에서부터 카운트 
		
		//특정 값이 존재하는지
		System.out.println("list에 정수 33이 존재하는가? : " + list.contains(33));
		System.out.println("list에 정수 4이 존재하는가? : " + list.contains(4));
		
		//삭제
		list.remove(4); // 4번 인덱스의 값 삭제(15)
		System.out.println("list : " + list);
		
		//정렬
		Collections.sort(list);
		System.out.println("list : " + list);
		
		//리스트간의 결합
		ArrayList<Integer> list2 = new ArrayList<Integer>();
		list2.add(65);
		list2.add(99);
		list.addAll(list2);
		System.out.println("list : " + list);
		
		//리스트가 비어있는지?
		System.out.println("list isEmpty : " + list.isEmpty()); //리스트 안에 값이 있어서 false
		ArrayList<Integer> list99 = new ArrayList<Integer>();
		System.out.println("list isEmpty : " + list99.isEmpty()); //리스트 안에 값이 비어있어서 true
		
		//전체 삭제
		list.clear(); //전체 삭제
		System.out.println("list : " + list);
		System.out.println("list isEmpty : " + list.isEmpty());
		
		//list가 내부 데이터가 없는 빈 리스트일뿐. Null이 아님.
		if(list == null) {
			System.out.println("list is null");
		}
		ArrayList<Integer> list3 = null;
		
		if(list3 == null) { //list3에 아무것도 생성해주지 않아서 null임
			System.out.println("list is null");
		}
	}
}
