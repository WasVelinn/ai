package com.lec.conditionQuiz;

public class Quiz02 {
	public static void main(String[] args) {
		int num1 = 27;
		int num2 = 32;
//		int max;
		// 방법 1 : if 블럭 안의 max 변수를 if 블럭 전에 선언
		// 방법 2 : if 블럭 안에 선언한 max 변수를 if 안에서 출력
		if (num1 > num2) {
			int max = num1;
			System.out.println(max); // alt + 화살표 ↑, ↓ : 소스 이동
		} else {
			int max = num2;
			System.out.println(max); // ctrl + alt + 화살표 ↑, ↓ : 소스 한 줄 복사
		}
			}
}
