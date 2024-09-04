package com.lec.Quiz;

import java.util.Scanner;

// 사용자로부터 구구단 수를 입력받아 guguOut(입력받은 수) 호출 -> 호출한 메소드에서 해당 구구단 출력
public class Quiz_gugudan {
	private static void gu(int h) {
		for(int i=1;i<10;i++) {
			System.out.println(h+"x"+i+"="+h*i);
		}
	}
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("원하는 구구단 단수를 입력하십시오. >");
		int dansu = sc.nextInt();
		System.out.println("입력하신 구구단 수는 " + dansu);
		gu(dansu);
		sc.close();
	}

}
