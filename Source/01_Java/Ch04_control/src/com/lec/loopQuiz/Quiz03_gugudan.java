package com.lec.loopQuiz;

import java.util.Scanner;

// 사용자로부터 원하는 구구단 수를 입력받아 해당 구구단을 출력
public class Quiz03_gugudan {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("원하는 구구단의 단수를 입력하시오. >");
		int num = sc.nextInt();
		for (int i=1;i<=9;i++) {
			System.out.println(num+"x"+i+"="+num*i);
		}sc.close();
	}

}
