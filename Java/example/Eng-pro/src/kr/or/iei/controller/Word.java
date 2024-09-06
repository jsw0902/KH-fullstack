package kr.or.iei.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Random;
import java.util.Scanner;
import java.util.Set;
import java.util.StringTokenizer;

import kr.or.iei.model.vo.*;
import kr.or.iei.view.WordView;

public class Word {
	ArrayList<EngKor> words;
	HashMap<Test, Integer> map;
	Scanner sc;
    WordView view;
    Random rd;
    Set<Integer> usedIndexes;

    public Word() {
    	sc = new Scanner(System.in);
        words = new ArrayList<>();
        map = new HashMap<Test, Integer>();
        view = new WordView();
        rd = new Random();
        usedIndexes = new HashSet<>();
    }
    
    public void mainMtd() {
    	while(true) {
    		int menu = view.main();
    		
    		switch(menu) {
    		case 1 : 
    			break;
    		case 2 : 
    			break;
    		case 3 : 
    			wordTest();
    			break;
    		case 4 : 
    			break;
    		case 5 : 
    			break;
    		case 6 : 
    			break;
    		case 0 : 
    			break;
    		default :
    			System.out.println("메뉴에 없는 메뉴입니다. 다시 입력해주세요");
    			break;
    		}
    	}
    }
    
    public void ReadFileSave() {
    	try  { // 파일 읽기
    		BufferedReader br = new BufferedReader(new FileReader("allDB.txt"));
            String line; 
            while ((line = br.readLine()) != null) { // br(allDB) 파일 한줄씩 읽음
                StringTokenizer st = new StringTokenizer(line, "/"); // "/"에서 끊음
                if (st.countTokens() == 3) { //토큰 개수가 3개 (영어, 한국어1, 한국어2) 일 때만 처리
                    String engWord = st.nextToken();
                    String kor1 = st.nextToken();
                    String kor2 = st.nextToken();
                    

                    words.add(new EngKor(engWord, kor1, kor2));// 읽어온 데이터로 EngKor 객체 생성하여 words 리스트에 추가

                } else {
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
        
    public void wordTest() {
    	ReadFileSave();
    	Test test = view.wordTest(map);
        int numQuestions = test.getNums();
               
        if(numQuestions > 0) {
        	for (int i = 0; i < numQuestions; i++) {
    			int randomIndex;
                do {
                    randomIndex = rd.nextInt(words.size());
                } while (usedIndexes.contains(randomIndex)); // 중복된 인덱스면 다시 생성

                usedIndexes.add(randomIndex); // 사용된 인덱스를 HashSet에 추가
    			EngKor word = words.get(randomIndex);
    			
    			String correctAnswer;
    			String correctAnswer2 = "";
    			if (test.getTestType().equals("영한")) {
    				System.out.print("영어 단어: " + word.getEngWord() + " > ");
    				//view.testEng();
    				correctAnswer = word.getKor1();
    				correctAnswer2 = word.getKor2();
    			} else {
    				System.out.print("한국어 단어: " + word.getKor1() + " > ");
    				correctAnswer = word.getEngWord();
    			}
    			
    			String userAnswer = sc.next();
    			
    			
    			if (userAnswer.equals(correctAnswer) || userAnswer.equals(correctAnswer2) || userAnswer.toLowerCase().equals(correctAnswer)) {
    				System.out.println("정답입니다!");
    			} else {
    				if(test.getTestType().equals("영한")) {
    					System.out.println("오답입니다. 정답은 " + correctAnswer + ", " + correctAnswer2 + " 입니다.");            		
    				} else {
    					System.out.println("오답입니다. 정답은 " + correctAnswer + " 입니다.");
    				}
    			}
    		}
        } else {
        	System.out.println("입력하신 테스트 종류는 없는 종류입니다. 테스트 종류를 다시 선택해주세요");
        }
        usedIndexes.clear();
        
        //view.testMeun();
    }
    /*
    public void saveToFailDB(EngKor word) {
    	try {
			BufferedWriter bw = new BufferedWriter(new FileWriter("failDB.txt", true));
			 if (!WordFailDB(word)) {
	                bw.write(word.getEngWord() + "/" + word.getKor1() + "/" + word.getKor2());
	                bw.newLine();
	            }
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    */
    /*
    public boolean WordFailDB(EngKor word) {
    	
    }
    */
}
