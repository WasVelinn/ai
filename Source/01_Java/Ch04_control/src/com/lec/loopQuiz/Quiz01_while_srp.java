package com.lec.loopQuiz;

import java.util.Scanner;

// 사용자에게 가위(0),바위(1),보(2) 입력받는다 
//    1. 0~2사이의 수를 입력 안 한 경우 : 프로그램 강제 종료
//    2. 0~2사이의 수를 입력 한 경우 (if, switch, 삼항연산자)
//          (1)컴퓨터가 0~2사의 난수를 발생
//          (2)당신과 컴퓨터가 낸 가위바위보 출력 (ex. 당신 가위, 컴퓨터는 바위)
//          (3)가위바위보 결과 출력(ex 당신이 졌습니다 ㅠ.ㅠ)
public class Quiz01_while_srp {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		while(true) {
			System.out.print("가위(0),바위(1),보(2) 입력(종료는 -1) : ");
			int you = sc.nextInt();
			if (you==-1) break;
			if (you < -1 || you > 2) {
				System.out.println("가위 바위 보 중 하나를 다음엔 잘 내요");
				continue;
			}
			String youStr = (you == 0) ? "가위" : (you == 1) ? "바위" : "보";
	
			int com = (int) (Math.random() * 3);
			String comStr = (com == 0) ? "가위" : (com == 1) ? "바위" : "보";
			System.out.println("당신은 " + youStr + ", 컴퓨터는 " + comStr);
	
			if (you == com) {
				System.out.println("비겼습니다 -.-");
			} else if ((you+2)%3 == com) {
				System.out.println("★ 당신이 이겼습니다 ★");
			} else if ((you+1)%3 == com) {
				System.out.println("컴퓨터가 이겼습니다 ㅠㅠ");
			} // 결과
		}//while
		sc.close();
	}
}
