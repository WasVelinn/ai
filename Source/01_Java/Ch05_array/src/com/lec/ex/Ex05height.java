package com.lec.ex;

import java.util.Scanner;

// 길동, 현식, 땅땅, 슘당, 대갈 친구의 키를 입력받고, 평균, 최장신 친구의 이름과 키, 최단신 친구의 이름과 키
public class Ex05height {
	public static void main(String[] args) {
		String[] names = {"길동", "현식", "땅땅", "슘당", "대갈"};
		int[] heights = new int[names.length];
		Scanner sc = new Scanner(System.in);
		int totHeight = 0; // 키 누적변수
		// 친구들 키 입력받아 heights배열에 할당, 키 누적
		for(int idx=0;idx<names.length;idx++) {
			System.out.print(names[idx] + "의 키는? :");
			heights[idx] = sc.nextInt();
			totHeight += heights[idx];
		}//for
		// 친구들 키 출력
		for(int idx=0;idx<names.length;idx++) {
			System.out.printf("%d번째 %s의 키는 %d\n", idx, names[idx], heights[idx]);
		}
		System.out.println("평균키 : "+(double)+totHeight/names.length);
		// 최장신 키, 최장신 키 이름, 최단신 키, 최단신 키 이름
		int maxH=heights[0], maxIdx = 0; // max값 초기화는 작은값이나 0방
		int minH=heights[0], minIdx = 0; // min값 초기화는 아주 큰 값이나 0방
		for(int idx=0;idx<names.length;idx++) {
			if(heights[idx]>maxH) {
				maxH=heights[idx];
				maxIdx = idx;
			} // if 최대값
			if(heights[idx]<minH) {
				minH = heights[idx];
				minIdx = idx;
			}// if 최소값
		}// for
		System.out.printf("최장신 %s의 키는 %d\n", names[maxIdx], maxH);
		System.out.printf("최단신 %s의 키는 %d\n", names[minIdx], minH);
		sc.close();
	}

}
