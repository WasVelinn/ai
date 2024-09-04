package com.lec.method;

public class Arithmetic02 {
	public int abs(int value) {
		int result = value<0?-value:value;
		return result;
	}
	public int sum(int from, int to) {
		int sum = 0;
		for(int i=from;i<=to;i++) {
			sum += i;
		}
		return sum;
	}
	public int sum(int to) {
		int sum = 0;
		for (int i=1;i<=to;i++) {
			sum += i;
		}
		return sum;
	}
	public String evenOdd(int value) {
		String result = value%2==0?"짝수입니다.":"홀수입니다.";
		return result;
	}

}
