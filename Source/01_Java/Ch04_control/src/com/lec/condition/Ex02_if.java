package com.lec.condition;

import java.util.Scanner;

// 사용자로부터 두 수를 입력받아, 몇번째 수가 얼마만큼 더 큰지 출력하시오.
public class Ex02_if {
	public static void main(String[] args) {
		// 사용자로부터 두 수를 입력 받기
		Scanner scanner = new Scanner(System.in);
		System.out.print("첫 번째 점수를 입력하시오. > ");
		int first = scanner.nextInt();
		System.out.print("두 번째 점수를 입력하시오. > ");
		int second = scanner.nextInt();
		if (first>second) {
			System.out.printf("첫번째 수 (%d)가 %d만큼 더 크다.", first, first-second);
		}else if(second>first) {
			System.out.printf("두번째 수 (%d)가 %d만큼 더 크다.", second, second-first);
		}else if(first==second) {
			System.out.println("같은 두 수를 입력하셨습니다.");
		} // if
		scanner.close();
	} // main
} // class
