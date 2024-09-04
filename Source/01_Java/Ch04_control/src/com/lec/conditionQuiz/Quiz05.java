package com.lec.conditionQuiz;

import java.util.Scanner;

public class Quiz05 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("원하시는 달의 숫자(정수)를 입력하십시오.");
		int you = sc.nextInt();
		if (you==12||you==1||you==2) {
			System.out.println("당신이 선택한 달의 계절은 겨울 입니다.");
		}else if (3<=you&&you<6) {
			System.out.println("당신이 선택한 달의 계절은 봄 입니다.");
		}else if (6<=you&&you<9) {
			System.out.println("당신이 선택한 달의 계절은 여름 입니다.");
		}else if (9<=you&&you<12) {
			System.out.println("당신이 선택한 달의 계절은 가을입니다.");
		}else {
			System.out.println("존재하지 않는 달입니다.");
		}
		sc.close();	
		
	}

}
