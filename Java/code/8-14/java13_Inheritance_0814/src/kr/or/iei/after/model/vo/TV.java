package kr.or.iei.after.model.vo;

public class TV {
	private boolean power;
	private int channerl;
	private int volume;
	private int inch;
	public TV() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TV(boolean power, int channerl, int volume, int inch) {
		super();
		this.power = power;
		this.channerl = channerl;
		this.volume = volume;
		this.inch = inch;
	}
	public boolean isPower() {
		return power;
	}
	public void setPower(boolean power) {
		this.power = power;
	}
	public int getChannerl() {
		return channerl;
	}
	public void setChannerl(int channerl) {
		this.channerl = channerl;
	}
	public int getVolume() {
		return volume;
	}
	public void setVolume(int volume) {
		this.volume = volume;
	}
	public int getInch() {
		return inch;
	}
	public void setInch(int inch) {
		this.inch = inch;
	}
	public void showMenu() {
		System.out.println("showMenu() method");
	}
	public void whoAmI() {
		System.out.println("I am TV Class");
	}
	@Override
	public String toString() {
		return "TV [power=" + power + ", channerl=" + channerl + ", volume=" + volume + ", inch=" + inch + "]";
	}
	
}
