package kr.or.iei.method;

public class MethodTest2 {
	
	public void test() {
		
		MethodTest1 methodTest1 = new MethodTest1();
		
		methodTest1.publicMethod();
		methodTest1.protectedMethod();
		methodTest1.DefaltMethod();
		//methodTest1.privateMethod(); //private는 동일 클래스 내부에서만 호출 가능
		}

}
