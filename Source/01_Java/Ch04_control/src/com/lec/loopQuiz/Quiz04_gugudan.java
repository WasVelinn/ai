package com.lec.loopQuiz;
// 2*1= 2 3*1= 3 .... 9*1= 9
// 2*2= 4 3*2= 6 .... 9*2=18
// ...
// 2*9=18 3*9=27 .... 9*9=91
public class Quiz04_gugudan {
	public static void main(String[] args) {
		for(int j=1;j<=9;j++) {
		for(int i=2;i<=9;i++) {
			System.out.printf("%d*%d=%2d\t",i,j,i*j);
			 }System.out.println();
		}
	}
}
