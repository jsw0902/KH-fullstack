package kr.or.iei.chap02.controller;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.nio.channels.WritableByteChannel;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Scanner;
import java.util.StringTokenizer;

public class SubStreamTestController {

	/*
	텍스트 파일(문자)을 읽어들여서,
	이미지(byte)로 출력.
	
	문자 스트림 : Reader, Writer
	바이트 스트림 : InputStream, OutputStream
	
	문자를 읽어들여서 => Reader
	이미지로 출력 => OutputStream
	
	 */
	Scanner sc;
	
	public SubStreamTestController() {
		sc =new Scanner(System.in);
	}
	
	//0.05초
	public void test() {
		
		BufferedReader br = null; //txt(문자)를 읽어올 보조스트림
		BufferedOutputStream bos = null; //img(바이트)를 내보낼 보조스트림
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss:SSS");
		
		try {
			String start = sdf.format(new Date(System.currentTimeMillis()));
			System.out.println("읽기 시작 : " + start);
			FileReader fr = new FileReader("img_oneline.txt");
			br = new BufferedReader(fr);
			
			String content = br.readLine();
			
			ArrayList<Byte> list = new ArrayList<Byte>();
			StringTokenizer st= new StringTokenizer(content, " ");
			
			while(st.hasMoreTokens()) {
				String numStr = st.nextToken();
				int iNum = Integer.parseInt(numStr);
				list.add((byte)iNum);
				
			}
			
			System.out.println("list로 변환 완료 !");
			
			
			FileOutputStream fos = new FileOutputStream("img.jpg");
			bos = new BufferedOutputStream(fos);
			
			for(byte b : list) {
				bos.write(b);
			}
			String end = sdf.format(new Date(System.currentTimeMillis()));
			System.out.println("읽기 종료 : " + end);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				bos.close();
				br.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
	public void test2() {
		FileReader fr = null;
		FileOutputStream fos = null;
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss:SSS");
		
		try {
			String start = sdf.format(new Date(System.currentTimeMillis()));
			System.out.println("읽기 시작 : " + start);
			
			StringBuilder sb = new StringBuilder();
			fr = new FileReader("img_oneline.txt");
			
			while(true) {
				int data = fr.read(); //읽어올 데이터 없을 시, -1로 반환
				
				if(data == -1) { //읽어올 데이터 없을 시, -1로 반환
					break;
				}
				
				char ch = (char)data;
				sb.append(ch);
			}
			//읽기 종료
			
			ArrayList<Byte> list = new ArrayList<Byte>();
			StringTokenizer st = new StringTokenizer(sb.toString(), " ");

			while(st.hasMoreElements()) {
				String num = st.nextToken();
				int iNum = Integer.parseInt(num);
				list.add((byte)iNum);
			}
			System.out.println("list로 변환 완료!");
			
			fos = new FileOutputStream("img.jpg");
			
			for(byte b : list) {
				fos.write(b);
			}
			
			String end = sdf.format(new Date(System.currentTimeMillis()));
			System.out.println("내보내기 종료 : " + end);
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				fos.close();
				fr.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
