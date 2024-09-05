package com.lec.quiz;
// name, hoursWorked, moneyPerHour, computePay(abstract),computeIncentive()
public class HourlyEmployee extends Employee{
	private int hoursWorked;
	private int moneyPerHour;
	public HourlyEmployee(String name, int hourWorked, int moneyPerHour) {
		super(name);
		this.hoursWorked = hourWorked;
		this.moneyPerHour = moneyPerHour;
	}
	@Override
	public int computePay() {
		return hoursWorked*moneyPerHour;
	}
}
