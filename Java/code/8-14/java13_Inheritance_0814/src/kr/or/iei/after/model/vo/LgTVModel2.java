package kr.or.iei.after.model.vo;

public class LgTVModel2 extends LgTV{

	public LgTVModel2() {
		
	}

	public LgTVModel2(boolean power, int channerl, int volume, int inch) {
		super(power, channerl, volume, inch);
	}
	@Override
	public void whoAmI() {
		System.out.println("I am LGTVModel2");
	}
}
