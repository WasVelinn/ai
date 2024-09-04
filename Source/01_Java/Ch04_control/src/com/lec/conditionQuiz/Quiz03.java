package com.lec.conditionQuiz;

import java.util.Scanner;

public class Quiz03 {
	public static void main(String[] args) {
		Scanner sc = new Scanner (System.in);
		System.out.println("가위(0), 바위(1), 보(2) 입력: ");
		int you = sc.nextInt();
		switch(you) {
		case 0:
			System.out.println("당신이 선택한 것은 가위"); break;
		case 1:
			System.out.println("당신이 선택한 것은 바위"); break;
		case 2:
			System.out.println("당신이 선택한 것은 보"); break;
		default:
			System.out.println("유효하지 않은 숫자입니다."); break;
		}
		sc.close();
	}

}
