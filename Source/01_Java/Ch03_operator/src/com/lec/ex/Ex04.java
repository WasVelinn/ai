package com.lec.ex;
// 논리 연산자 : &&(and), ||(or), ! (not) 

public class Ex04 {
	public static void main(String[] args) {
		int i=1, j=10, h=10;
		System.out.println("((i<j) && (++j>h)) =>" +((i<j) && (++j>h)));
		System.out.println("j="+j);
		// &&(and)연산의 좌항이 false인 경우, 우항을 보지도않고 결과를 false로
		System.out.println("((i>j) && (++j>h)) =>" +((i>j) && (++j>h)));
		System.out.println("j="+j);
		
		System.out.println("((i<j) || (++j>h)) =>" +((i<j) || (++j>h)));
		System.out.println("j="+j);
		// ||(or)연산의 좌항이 true인 경우, 우항을 보지도않고 결과를 true로
		System.out.println("((i>j) || (++j>h)) =>" +((i>j) || (++j>h)));
		System.out.println("j="+j);
	}

}
