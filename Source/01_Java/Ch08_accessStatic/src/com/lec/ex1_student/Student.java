package com.lec.ex1_student;
// 데이터 : name(String), kor(int), eng(int), math(int), tot(int), avg(double)
// 생성자 : new Student("정우성", 90, 90, 90 )
// 메소드 : infoPrint(), infoString()
public class Student {
	private String name;
	private int kor;
	private int eng;
	private int math;
	private int tot;
	private double avg;
	public Student() {} // 디폴트 생성자
	public Student(String name, int kor, int eng, int math) {
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.math = math;
		tot = kor + eng + math;
		avg = tot/3.;
	}
	public void infoPrint() {
		// \t정우성\t100\t100\t100\t300\t100.0
		// \t정우성\t 90\t 90\t 90\t270\t90.0
		System.out.printf("\t%s\t%3d\t%3d\t%3d\t%3d\t%5.1f", name, kor, eng, math, tot, avg);
	}
	public String infoString() {
		return String.format("\t%s\t%3d\t%3d\t%3d\t%3d\t%5.1f", name, kor, eng, math, tot, avg);
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getKor() {
		return kor;
	}
	public void setKor(int kor) {
		this.kor = kor;
	}
	public int getEng() {
		return eng;
	}
	public void setEng(int eng) {
		this.eng = eng;
	}
	public int getMath() {
		return math;
	}
	public void setMath(int math) {
		this.math = math;
	}
	public int getTot() {
		return tot;
	}
	public void setTot(int tot) {
		this.tot = tot;
	}
	public double getAvg() {
		return avg;
	}
	public void setAvg(double avg) {
		this.avg = avg;
	}
}
