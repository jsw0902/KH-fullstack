package kr.or.iei.after.model.vo;

public class LgTVModel1 extends LgTV{

	public LgTVModel1() {
		
	}

	public LgTVModel1(boolean power, int channerl, int volume, int inch) {
		super(power, channerl, volume, inch);
	}
	@Override
	public void whoAmI() {
		System.out.println("I am LGTVmodel1");
	}
	
}