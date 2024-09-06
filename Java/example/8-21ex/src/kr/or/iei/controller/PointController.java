package kr.or.iei.controller;

import java.util.ArrayList;

import kr.or.iei.model.vo.Grade;

import kr.or.iei.view.PointView;


public class PointController {

	ArrayList<Grade> grades;
	PointView view;
	
	public PointController() {
		grades = new ArrayList<Grade>();
		view = new PointView();
	}
	
	public void mainMtd() {
		while(true) {
			int menu = view.main();			
			switch(menu) {
			case 1:
				insertMember();
				break;
			case 2:
				//updateMember();
				break;
			case 3:
				//deletMember();
				break;
			case 4:
				//selectAllMember();
				break;
			case 5:
				//selectOneMember();
				break;
			case 0:
				System.out.println("프로그램을 종료합니다.");
				return;
			default:
				break;
			}
		}
	}
	
	public void insertMember() {
		//Grade gradem = view.insertMember();
		
		//int index = searchIndex(gradem.getName());

        //if (index != -1) {
            System.out.println("이미 등록된 회원입니다.");
            return;
        //}
        /*
        switch(gradem.getGrade()) {
        case "silver" :
        	
        	break;
        case "gold" :
        	break;
        case "vip" :
        	break;
        	
        }
        */
		//grades.add(gradem);
		//view.CompleteMsg("등록");
	}
	
	public int searchIndex(String name) {
		for(int i = 0; i<grades.size(); i++) {
			if(grades.get(i).getName().equals(name)) {
				return i;
			}
		}
		return -1;
	}
}
