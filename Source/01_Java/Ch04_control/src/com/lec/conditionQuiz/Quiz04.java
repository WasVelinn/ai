package com.lec.conditionQuiz;

import java.util.Scanner;

// 사용자에게 가위(0), 바위(1), 보(2)를 입력 받는다.
// 1. 사용자가 0~2 사이의 정수를 입력하지 않았을 경우 : 프로그램 강제종료
// 2. 사용자가 0~2 사이의 정수를 입력 하였을 경우 
//               (1) 컴퓨터가 0~2 사이의 난수를 발생
//               (2) 당신과 컴퓨터가 낸 가위바위보 출력 (ex.당신 가위, 컴퓨터는 바위 출력)
//               (3) 가위바위보 결과 출력 (ex.당신이 졌습니다.)
public class Quiz04 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("가위(0), 바위(1), 보(2) 입력: ");
		int you = sc.nextInt();
		if ( you<0 || you>2 ) {
			System.out.println("유효하지 않은 숫자입니다.");
			System.exit(0); // 프로그램 정상 강제 종료
		}
		String youStr = you==0 ? "가위" :you==1 ? "바위" : "보" ;
//		if (you==0) {
//			youStr = "가위";
//		}else if(you==1) {
//			youStr = "바위";
//		}else {
//			youStr = "보";
//		}
//		switch(you) {
//		case 0 : youStr="가위"; break;
//		case 1 : youStr="바위"; break;
//		default : youStr="보"; break;
//		}
		// 컴퓨터도 0~2 난수 <= 0 <= (int)(Math.random()*3) < 3
		int com =(int)(Math.random()*3); // 0~2 사이의 정수 난수;
		String comStr = com==0 ? "가위" : com==1 ? "바위" : "보";
		System.out.println("당신이 선택한 것은 "+youStr+" 컴퓨터가 선택한 것은 "+comStr);
		// if 문이나 switch 문으로 가위바위보 결과 출력
		if (com==you) {
			System.out.println("비겼습니다.");
		}else if (you==0&&com==1) {
			System.out.println("당신이 졌습니다.");
		}else if (you==0&&com==2) {
			System.out.println("당신이 이겼습니다.");
		}else if (you==1&&com==0) {
			System.out.println("당신이 이겼습니다.");
		}else if (you==1&&com==2) {
			System.out.println("당신이 졌습니다.");
		}else if (you==2&&com==0) {
			System.out.println("당신이 졌습니다.");
		}else {
			System.out.println("당신이 이겼습니다.");
		}
		sc.close();
		}
	}
	


