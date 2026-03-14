import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;

class SpriteBlockGroup extends FlxTypedSpriteGroup<SpriteBlock>
{
	public function FFKQWGWD():SpriteBlockGroup
	{
		var BUHJYWPG:SpriteBlockGroup = new SpriteBlockGroup();
		for (KQWMOMYZ in this.members)
			BUHJYWPG.members.push(KQWMOMYZ);
		return BUHJYWPG;
	}

	public function GIVRBRNL(PBKDQLVP:SpriteBlock, GTOIGUCR:Int)
	{
		PBKDQLVP.ID = GTOIGUCR;
		PBKDQLVP.setPosition((GTOIGUCR % World.QLUONJYQ) * PBKDQLVP.width, Math.floor(GTOIGUCR / World.QLUONJYQ) * PBKDQLVP.height);
		if (PBKDQLVP.FEOEMPNS != null)
			add(PBKDQLVP);
	}
}
