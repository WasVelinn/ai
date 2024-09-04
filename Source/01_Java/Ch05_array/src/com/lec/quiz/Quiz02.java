package com.lec.quiz;

import java.util.Arrays;

// 배열 안의 값의 합계, 평균, 최대값, 최소값 출력
public class Quiz02 {
	public static void main(String[] args) {
		int[] arr = {10, 20, 30, 40, 50, 12, 13};
		int tot = 0;
		for(int a:arr) {
			tot += a;
		}
		double avg = (double)tot/7;
		int maxh = 0;
		int minh = 999;
		for(int i = 0;i<arr.length;i++) {
			if(maxh<arr[i]) {
				maxh=arr[i];
			}
			if(minh>arr[i]) {
				minh=arr[i];
			}
		}
		System.out.println("합계 : "+tot);
		System.out.println("평균 : "+avg);
		System.out.println("최대 : "+maxh);
		System.out.println("최소 : "+minh);
		for(int i=0;i<arr.length-1;i++) {
			for(int j=i+1;j<arr.length;j++) {
				if(arr[i]>arr[j]) {
					int temp = arr[i];
					arr[i] = arr[j];
					arr[j] = temp;
				}
			}
		}
		System.out.println("정렬 후:"+Arrays.toString(arr));
	}

}
