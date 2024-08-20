package kr.or.iei.string.start;

import kr.or.iei.string.controller.StringBufferController;
import kr.or.iei.string.controller.StringMethodController;
import kr.or.iei.string.controller.StringPoolController;
import kr.or.iei.string.controller.StringTokenizerController;

public class Start {

	public static void main(String[] args) {
		
		/*
		StringPoolController polTest = new StringPoolController();
		
		//polTest.test1();
		polTest.test2();
		*/
		
		/*
		StringMethodController methodTest = new StringMethodController();
		methodTest.test();
		*/
		
		/*
		StringTokenizerController tokenTest = new StringTokenizerController();
		tokenTest.test();
		*/
		
		StringBufferController sbc = new StringBufferController();
		sbc.test();
	}

}
