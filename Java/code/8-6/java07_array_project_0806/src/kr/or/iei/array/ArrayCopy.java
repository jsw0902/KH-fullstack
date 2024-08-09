package kr.or.iei.array;

/*
 
 배열의 복사
 	- 얕은 복사 : 두 배열이 1개의주소를 공유하는 형태. 즉, 객체의 주소를 복사하는 것
 	  배열1 = 배열2;
 	  
 	  
 	- 깊은 복사 : 동일한 주소를 공유하지 않고, 내부 값만을 복사하여 새로운 주소를 참조하게 하는 것.
 	  1) 반목문을 이용한 직접 복사
 	  2) arraycopy 기능 사용
 	  3) clone 기능 사용
 */
public class ArrayCopy {
	
	//얕은 복사
	public void copyTest1() {
		int [] arr1 = {1,2,3,4,5,6,7,8,9,10};
		
		for(int i = 0; i<arr1.length; i++) {
			System.out.print(arr1[i] + " ");
		}
		System.out.println("\n=====================================");
		
		int [] arr2 = arr1;
		
		for(int i=0; i<arr2.length; i++) {
			System.out.print(arr2[i] + " ");
		}
		
		System.out.println("\n=====================================");
		
		arr1[3] = 20; //3번째 인덱스의 값인 4 -> 20 변경
		
		for(int i=0; i<arr1.length; i++) {
			System.out.print(arr1[i] + " ");
		}
		
		System.out.println("\n=====================================");
		
		for(int i = 0; i<arr2.length; i++) {
			System.out.print(arr2[i] + " ");
			//위 코드에서 arr1[3] 인덱스 값을 변경했지만, 주소를 공유하고 있기 때문에 arr2[3] 인덱스도 동일하게 변경된다.
		}
		
		System.out.println("\n=====================================");
		
		System.out.println("arr1 주소값 : " + arr1.hashCode());
		System.out.println("arr1 주소값 : " + arr2.hashCode());
		
		System.out.println("\n=====================================");
		
		arr2[7] = 1;
		
		for(int i=0; i<arr1.length; i++) {
			System.out.print(arr1[i] + " ");
		}
	}
	
	
	//깊은 복사 - 반복문을 이용한 직접 복사
	public void copyTest2() {
		int [] arr1 = {1,2,3,4,5,6,7,8,9,10};
		int [] arr2 = new int [arr1.length]; //동일한 내부 데이터를 복사할것이므로, arr1의 길이로 지정
		
		for(int i = 0; i<arr1.length; i++) {
			arr2[i] = arr1[i];
		}
		
		for(int i = 0; i<arr1.length; i++) {
			System.out.print(arr1[i] + " ");
		}
		
		System.out.println("\n=====================================");
		
		for(int i = 0; i<arr1.length; i++) {
			System.out.print(arr2[i] + " ");
		}
		
		System.out.println("\n=====================================");
		
		System.out.println("arr1의 주소 : " + arr1.hashCode());
		System.out.println("arr2의 주소 : " + arr2.hashCode());
	
		System.out.println("\n=====================================");
		
		arr1[3] = 100;
		
		System.out.println("\n=====================================");
	
		for(int i = 0; i<arr2.length; i++) {
			System.out.print(arr2[i] + " ");
		}
	}
	
	//깊은 복사 - arraycopy
	public void copyTest3() {
		int [] arr1 = {1,2,3,4,5,6,7,8,9,10};
		int [] arr2 = new int [arr1.length];
		
		//원본 배열 : arr1
		//복사 대상 배열 : arr2
		
		//System.arraycopy(원본배열, 원본배열의 복사할 시작 인덱스, 복사 대상 배열, 복사 대상 배열의 복사할 시작 인덱스, 총 복사할 배열의 길이)
		
		System.arraycopy(arr1, 0, arr2, 0, arr1.length);
		
		for(int i = 0; i<arr2.length; i++) {
			System.out.print(arr2[i] + " ");
		}
		
		System.out.println("\n=====================================");
		System.out.println("arr1 주소 : " + arr1.hashCode() );
		System.out.println("arr2 주소 : " + arr2.hashCode() );
	}
	
	//깊은 복사 - clone
	public void copyTest4() {
		int [] arr1 = {1,2,3,4,5,6,7,8,9,10};
		int [] arr2 = arr1.clone();
		
		for(int i = 0; i<arr2.length; i++) {
			System.out.print(arr2[i] + " ");
		}
		
		System.out.println("\n=====================================");
		System.out.println("arr1 주소 : " + arr1);
		System.out.println("arr1 주소 : " + arr2);
	}
}
