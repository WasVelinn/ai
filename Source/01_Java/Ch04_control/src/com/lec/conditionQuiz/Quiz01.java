package com.lec.conditionQuiz;

import java.util.Scanner;

public class Quiz01 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("숫자(정수)를 입력하십시오.");
		int num = sc.nextInt();		
		if (num>=0) {
			System.out.println("입력하신 수의 절댓값은 "+num+"입니다.");
		} else {
			System.out.println("입력하신 수의 절댓값은 "+-num+"입니다.");
		}
		sc.close();
	}

}
