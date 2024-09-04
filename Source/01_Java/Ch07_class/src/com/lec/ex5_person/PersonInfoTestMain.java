package com.lec.ex5_person;

public class PersonInfoTestMain {
	public static void main(String[] args) {
		int i = 10;
		int[] scores = {90,100,95};
		PersonInfo p1 = new PersonInfo("홍길동", 33, 'm');
		PersonInfo p2 = new PersonInfo("홍길순", 32, 'f', "2001-12-01");		
		PersonInfo[] person = {p1,p2};
		for(int idx=0 ; idx<person.length;idx++) {
			person[idx].print();
			}
		for(PersonInfo p : person) {
			System.out.println(p.infoString());
		}
		}
}
