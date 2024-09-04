package com.lec.ex1_car;

public class CarMain {
	public static void main(String[] args) {
		Car myCar = new Car();
		myCar.setColor("빨강");
		myCar.setCc(2400);
		System.out.println(myCar.getColor()+"색차량 배기량은 "+myCar.getCc()+", 속도는"+myCar.getSpeed());
		myCar.drive();
		myCar.park();
		myCar.race();
		System.out.println(myCar.getColor()+"색차량 배기량은 "+myCar.getCc()+", 속도는"+myCar.getSpeed());
		
		Car yourCar = new Car();
		yourCar.setColor("보라");
		yourCar.drive();
		System.out.println(yourCar.getColor()+"색차량 배기량은 "+yourCar.getCc()+", 속도는"+yourCar.getSpeed());
	}

}
