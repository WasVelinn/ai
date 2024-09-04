package com.lec.quiz;

import java.util.Scanner;

public class Quiz2 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("국어 점수를 입력하세요 > ");
		int su1 = sc.nextInt();
		System.out.print("영어 점수를 입력하세요 > ");
		int su2 = sc.nextInt();
		System.out.print("수학 점수를 입력하세요 > ");
		int su3 = sc.nextInt();
		int tot = su1 + su2 + su3;
		double ave = (double)tot/3;
		System.out.printf("당신의 국어 점수는 > %d 점, 영어 점수는 > %d 점, 수학 점수는 > %d 점, 총 점수는 %d 점, 평균 점수는 %.2f점 입니다.", su1, su2, su3, tot, ave);
		sc.close();
	
	}

}
