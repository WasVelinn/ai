package com.lec.ex1_store;
// HeadQuarterStore를 상속받은 클래스가 반드시 override 하도록 
// 추상클래스 : 추상메소드가 1개 이상
public interface HeadQuarterStore {
	// 추상 메소드 : 메소드 선언만 있고, 구현은 없는 메소드(구현은 상속받은 클래스에서)
	public abstract void kimchi();
	public abstract void bude();
	public abstract void bibim(); 
	public abstract void sunde(); 
	public abstract void gongi(); 
}

