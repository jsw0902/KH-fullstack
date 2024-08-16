package kr.or.iei.before.model.vo;

public class LgTVModel1 {
	private boolean power;
	private int channel;
	private	int volume;
	private int inch;
	public LgTVModel1() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LgTVModel1(boolean power, int channel, int volume, int inch) {
		super();
		this.power = power;
		this.channel = channel;
		this.volume = volume;
		this.inch = inch;
	}
	public boolean isPower() {
		return power;
	}
	public void setPower(boolean power) {
		this.power = power;
	}
	public int getChannel() {
		return channel;
	}
	public void setChannel(int channel) {
		this.channel = channel;
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
	@Override
	public String toString() {
		return "LgTVModel1 [power=" + power + ", channel=" + channel + ", volume=" + volume + ", inch=" + inch + "]";
	}
	
	
}
