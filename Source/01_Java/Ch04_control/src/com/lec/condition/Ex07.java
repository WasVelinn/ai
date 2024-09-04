package com.lec.condition;

import java.util.Scanner;

// 입력받은 수가 홀수인지 짝수인지 출력(if, switch, 삼항연산자)
public class Ex07 {
	public static void main(String[] args) {
//		String name = new String("HONG");
//		System.out.println(name.toLowerCase());
		Scanner sc = new Scanner(System.in);
		System.out.println("숫자(정수)를 입력하십시오. > ");
		int num = sc.nextInt();
//		if (num%2==0) {
//			System.out.println("입력하신 숫자는 짝수 입니다.");
//		}else {
//			System.out.println("입력하신 숫자는 홀수 입니다.");
//		}
//		String result = (num%2==0)?"입력하신 숫자는 짝수 입니다.":"입력하신 숫자는 홀수 입니다.";
//		System.out.println(result);
		switch(num%2) {
		case 0 :
			System.out.println("입력하신 숫자는 짝수 입니다."); break;
		default :
			System.out.println("입력하신 숫자는 홀수 입니다.");
		}
		sc.close();
	}

}
