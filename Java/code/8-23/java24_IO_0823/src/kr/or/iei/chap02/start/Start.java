package kr.or.iei.chap02.start;

import kr.or.iei.chap02.controller.CharStreamController;
import kr.or.iei.chap02.controller.SubStreamController;
import kr.or.iei.chap02.controller.SubStreamTestController;

public class Start {

	public static void main(String[] args) {
		/*
		CharStreamController csc = new CharStreamController();
		csc.test();
		*/
		/*
		SubStreamController ssc = new SubStreamController();
		//ssc.test();
		ssc.readTest();
		*/
		
		SubStreamTestController sst = new SubStreamTestController();
		
		//sst.test();
		sst.test2();
	}

}
