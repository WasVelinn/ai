package com.lec.loopQuiz;

public class Quiz01 {
	public static void main(String[] args) {
		int total = 1;
		for(int i=1;i<=10;i++) {
			total = total*i;
			if(i==10) {
				System.out.print(i+"=");
			}else {
				System.out.print(i+"x");
			}
		}
		System.out.println(total);
	}

}