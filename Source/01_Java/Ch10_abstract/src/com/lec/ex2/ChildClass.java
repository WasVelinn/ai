package com.lec.ex2;

public class ChildClass extends SuperClass {

	@Override
	public void method1() {
		System.out.println("ChildClass의 method1-추상메소드라서 반드시 오버라이드 함");
	}
	public void method2() {
		System.out.println("ChildClass의 method2-그냥 오버라이드 함");
	}
}
