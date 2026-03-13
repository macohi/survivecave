import flixel.math.FlxPoint;
import flixel.util.FlxColorTransformUtil;
import flixel.tweens.FlxTween;
import flixel.FlxG;

class StateGameplay extends State
{
	public var world:World;

	public var player:SpriteAnimatedPlayer;

	public var layer_world:Null<Int> = 20;
	public var layer_ui:Null<Int> = 1000;

	override public function create()
	{
		super.create();

		addToLayer(new TextVersion(), layer_ui);

		player = new SpriteAnimatedPlayer(0, 0);
		player.screenCenter();
		addToLayer(player);
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
			world.forEach(function(block)
			{
				if (player.overlaps(block))
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

		if (FlxG.keys.anyJustReleased([E, ENTER]))
		{
			applyInteractionCheck();
		}
	}

	public function applyHorizontalMovement(amount:Float)
	{
		if (player.animation.name != 'walk')
			player.animation.play('walk');
		player.x += amount;

		if (world != null)
			world.forEach(function(block)
			{
				if (player.overlaps(block))
					player.x -= -amount;
			});
	}

	public function applyInteractionCheck() {}
}
