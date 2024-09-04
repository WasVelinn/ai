package com.lec.quiz;
//국어, 영어, 수학 점 수를 할당하고, 각 점수와 총점을 출력
public class Example {
	public static void main(String[] args) {
		int math, english, korean, tot;
		math = 100; english = 85; korean = 70;
		tot = math + english + korean;
		System.out.println("당신의 수학점수는 "+math+"점 입니다.");
		System.out.println("당신의 영어점수는 "+english+"점 입니다.");
		System.out.println("당신의 국어점수는 "+korean+"점 입니다.");
		System.out.println("당신의 총점수는 "+tot+"점 입니다.");
		
	}

}
