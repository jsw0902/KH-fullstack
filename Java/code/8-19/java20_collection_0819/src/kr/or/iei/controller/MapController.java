package kr.or.iei.controller;

import java.util.HashMap;
import java.util.Set;

public class MapController {

	/*
	 Map -> HashMap
	 
	 - 키와 값 형태로 데이터 저장
	 - 키는 중복 저장 불가능
	 - 같은 중복 저장 가능
	 
	 */
	
	public void mapTest() {
		//키는 String으로 관리
		//같은 Integer로 관리
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		//추가
		map.put("one", 1); // "one"이라는 키로, 데이터 1을 관리
		map.put("two", 2);
		map.put("three", 3);
		map.put("four", 4);
		map.put("five", 5);
		
		System.out.println("map : " + map);
		
		//중복 값 할당 가능
		map.put("six", 2);
		System.out.println("map : " + map);
		
		//중복 키 할당 불가능
		map.put("six", 6);
		System.out.println("map : " + map); //원래 six라는 키의 값(2)가 6으로 덮어씌워짐.
		
		//조회(순서는 없지만, 키 값이 중복되지 않기에, 키로 값을 조회할 수 있다.)
		System.out.println("map get : " + map.get("two"));
		System.out.println("map get : " + map.get("five"));
		
		//값 변경
		map.replace("four", 40);
		System.out.println("map : " + map);
		map.replace("test", 10);
		System.out.println("map : " + map); //존재하지 않는 키 값을 대체하려고 하면, 아무런 변화 없음.
		
		//삭제
		map.remove("six"); //키만 삭제되는 것이 아닌, 값도 같이 삭제
		System.out.println("map : " + map); 
		
		//키 값이 존재하는지?
		System.out.println("three is contains : " + map.containsKey("theree"));
		System.out.println("ten is contains : " + map.containsKey("ten"));
		
		//값이 존재하는지? (value)
		System.out.println("3 is contains : " + map.containsValue(3));
		System.out.println("10 is contains : " + map.containsValue(10));
		
		//map에 있는 모든 데이터를 수차적으로 접근하는 방법.
		System.out.println("map : " + map); //map 값 확인용 굳이 안해줘도 됨
		Set<String> keys = map.keySet(); //Set<키의 자료형
		
		for(String key : keys) {
			System.out.println("key : " + key + ", value : " + map.get(key));
		}
		
		//내부 데이터가 비어있는지?
		System.out.println("map is empty? : " + map.isEmpty());
		
		//전체 삭제
		map.clear();
		System.out.println("map is empty? : " + map.isEmpty()); //true
		System.out.println("map is null? : " + (map == null)); //false
		
		/*
		HashMap<String, String> map2 = null;
		System.out.println("map is null? : " + (map2 == null)); // true
		System.out.println("map is empty? : " + map.isEmpty()); //오류 발생
		*/
	}
	
	
}
