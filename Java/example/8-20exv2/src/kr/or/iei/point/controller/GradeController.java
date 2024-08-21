package kr.or.iei.point.controller;
import java.util.Scanner;

import kr.or.iei.point.model.vo.*;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;

public class GradeController {
	ArrayList <Grade> grades;
	private HashSet<String> names = new HashSet<>();
	HashSet<String> ifGrade = new HashSet<String>();
	Scanner sc;
	
	public GradeController(){
		grades = new ArrayList<Grade>();
		sc = new Scanner(System.in);

		ifGrade.add("silver");
		ifGrade.add("gold");
		ifGrade.add("vip");
	}
	
	public void mainMtd() {
		while(true) {
			System.out.println("========================포인트 관리 프로그램V3========================");
			System.out.println("1. 회원 정보 등록");
			System.out.println("2. 회원 정보 수정");
			System.out.println("3. 회원 정보 삭제");
			System.out.println("4. 전체 회원 조회");
			System.out.println("5. 회원 한명 조회");
			System.out.println("0. 프로그램 종료");
			System.out.print("선택 > ");
			int menu = sc.nextInt();
			sc.nextLine();
			
			switch(menu) {
			case 1:
				insertMember();
				break;
			case 2:
				updateMember();
				break;
			case 3:
				deletMember();
				break;
			case 4:
				selectAllMember();
				break;
			case 5:
				selectOneMember();
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
        System.out.println("========================회원 정보 등록========================");
        System.out.print("등록할 등급 입력(silver, gold, vip) : ");
        String grade = sc.next();
        System.out.print("등록할 이름 입력: ");
        String name = sc.next();
        if (names.contains(name)) {
        	System.out.println("이미 존재하는 회원입니다.");
        	return;
        }        
        System.out.print("등록할 포인트 입력 : ");
        int point = sc.nextInt();

        // 중복 확인

        switch (grade) {
            case "silver":
            	grades.add(new Silver(grade, name, point));
                break;
            case "gold":
            	grades.add(new Gold(grade, name, point));
                break;
            case "vip":
            	grades.add(new Vip(grade, name, point));
            	break;
            default:
                System.out.println("등급을 잘못 입력하셨습니다.");
                return;
        }
        names.add(name);
        System.out.println("회원 등록 완료되었습니다.");
    }
	
	public void updateMember() {
		System.out.println("========================회원 정보 수정========================");
		System.out.print("수정할 이름 입력: ");
	    String name = sc.next();
	    
	    if (names.contains(name)) { //이름이 중복되면 true
	    	for(Grade grade : grades) {
	    		if(grade.getName().equals(name)) {
	    			System.out.print("수정할 등급 입력(silver, gold, vip): ");
	    			String newGrade = sc.next();
	    			if(ifGrade.contains(newGrade)) {
	    				System.out.print("수정할 이름 입력: ");
		    			String newName = sc.next();
		    			if(names.contains(newName)) {
		    				System.out.println("등록된 이름입니다.");
		    			}else {
		    				System.out.print("수정할 포인트 입력:");
			    			int newPoint = sc.nextInt();
			    			grade.setGrade(newGrade);
			    			grade.setName(newName);
			    			grade.setPoint(newPoint);
			    			names.remove(name);
			    			names.add(newName);
			    			System.out.println("수정되었습니다.");
			    			return;
		    			}
	    			} else {		
	    				System.out.println("입력하신 등급은 없는 등급입니다.");
	    			}
	    		}
	    	}
        }else {
        	System.out.println("존재하지 않는 회원입니다.");
        }
	}
	
	public void deletMember() {
		 System.out.println("========================회원 정보 삭제========================");
		 System.out.print("삭제할 이름 입력: ");
	     String name = sc.next();
	 
	     if(names.contains(name)) {
	    	 Iterator<Grade> iter = grades.iterator();
	         while (iter.hasNext()) {
	             Grade grade = iter.next();
	             if (grade.getName().equals(name)) {
	                 iter.remove();
	                 break; 
	             }
	         }
	         names.remove(name);
	         System.out.println("회원 삭제 완료되었습니다.");
	     } else {
	    	 System.out.println("존재하지 않는 회원입니다.");
	     }
	}
	
	public void selectAllMember() {
		System.out.println("========================회원 정보 모두 출력========================");
		System.out.println("등급\t이름\t포인트\t보너스");
		Iterator<Grade> str = grades.iterator();
		while(str.hasNext()) {
			System.out.println(str.next().toString());
		}
	}
	
	public void selectOneMember() {
		System.out.println("========================회원 정보 한명 출력========================");
		System.out.print("출력할 회원 이름 입력 : ");
		String name = sc.next();
		for(Grade grade : grades) { //가져온 값을 저장할 변수를 Grade타입의 변수 grade로 선언. grades는 ArrayList
			if(grade.getName().equals(name)) {
				System.out.println("등급\t이름\t포인트\t보너스");
				System.out.println(grade.toString());
				return;
			}
		}
		System.out.println("존재하지 않는 회원입니다.");
	}

    // 중복 회원 확인 메소드
	/*
    private int srchIndex(String name) {
        for (int i = 0; i < grades.size(); i++) {
	        if (grades.get(i).getName().equals(name)) {
	            return i;
	        }
	    }
	    return -1;
    }
    */
	
}
