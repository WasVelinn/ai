package com.lec.loopQuiz;

public class Quiz02 {
	public static void main(String[] args) {
		int total=0;
		for(int i=1;i<=10;i=i+2) {
			total=total+i;
			if(i==9) {
				System.out.print(i+"=");
			}else {
				System.out.print(i+"+");
			}
		}System.out.print(total);
	}

}
