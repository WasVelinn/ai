package com.lec.ex1_store;
// 김치찌개-8,000  부대찌개-8,000(V)  비빔밥-8,000(V) 순대국-8,000  공기밥-무료
public class Store2 extends HeadQuarterStore {

	public Store2(String storeName) {
		super(storeName);
	}
	public void bude() {System.out.println("부대찌개 8,000원");}
	@Override
	public void bibim() {System.out.println("비빔밥 8,000원");}
	@Override
	public void gongi() {System.out.println("공기밥 : 무료");}
	@Override
	public void kimchi() {System.out.println("김치찌개 8,000원");}
	@Override
	public void sunde() {System.out.println("순대국 8,000원");}
}

