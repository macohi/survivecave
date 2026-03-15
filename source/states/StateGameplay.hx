package states;

import flixel.FlxG;

class StateGameplay extends StateGUI
{
	public var world:GroupWorld;

	public var player:SpritePlayer;

	public var worldLayer:Null<Int> = 20;


	override public function new(gsn:Int = -1)
	{
		super();

		Global.LAST_GAMEPLAY_STATE.value = gsn;
	}

	override public function create()
	{
		super.create();

		player = new SpritePlayer(0, 0);
		player.screenCenter();
		addToLayer(player);

		addToLayer(new TextScore(), uiLayer);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (player != null)
			if (!player.interacting)
			{
				applyConditionals();

				applyGravity();

				applyControls();
			}
	}

	public function applyConditionals() {}

	public function applyGravity()
	{
		player.y += player.height;

		if (world != null)
			world.forEach(function(spr)
			{
				final block:SpriteBlock = cast spr;
				if (player.overlaps(block) && block.hasCollision)
					player.y -= player.height;
			});
	}

	public function applyControls()
	{
		if (player.interacting || player == null)
			return;

		if (FlxG.keys.anyPressed([A, LEFT]))
		{
			player.flipX = false;
			applyHorizontalMovement(-player.width * (1 / 4));
		}
		else if (FlxG.keys.anyPressed([D, RIGHT]))
		{
			player.flipX = true;
			applyHorizontalMovement(player.width * (1 / 4));
		}
		else
		{
			if (player.animation.name != 'idle')
				player.animation.play('idle');
		}

		if (FlxG.keys.anyJustReleased([ENTER]))
		{
			applyInteractionCheck();
		}

		if (FlxG.keys.anyJustReleased([E]))
		{
			switchState(new GUIInventory());
		}

		if (FlxG.keys.anyJustReleased([ESCAPE]))
		{
			switchState(new GUIMainMenu());
		}
	}

	public function applyHorizontalMovement(amount:Float)
	{
		if (player.animation.name != 'walk')
			player.animation.play('walk');
		player.x += amount;

		if (player.x < 0)
			player.x = 0;
		if (player.x > FlxG.width - player.width)
			player.x = FlxG.width - player.width;

		if (world != null)
			world.forEach(function(spr)
			{
				final block:SpriteBlock = cast spr;
				if (player.overlaps(block) && block.hasCollision)
					player.x -= -amount;
			});
	}

	public function applyInteractionCheck() {}
}
