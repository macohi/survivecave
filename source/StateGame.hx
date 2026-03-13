import flixel.math.FlxPoint;
import flixel.util.FlxColorTransformUtil;
import flixel.tweens.FlxTween;
import flixel.FlxG;

class StateGame extends State
{
	public var cave:SpriteCave;

	public var world:World;

	public var player:SpriteAnimatedPlayer;

	public static var LAYER_CAVE:Null<Int> = 10;
	public static var LAYER_UI:Null<Int> = 1000;

	public static var PREVIOUS_PLAYER_POS:FlxPoint;

	override function switchState(state:State)
	{
		if (player != null)
			PREVIOUS_PLAYER_POS = player.getPosition();

		super.switchState(state);
	}

	override public function create()
	{
		super.create();

		addToLayer(new TextVersion(), LAYER_UI);

		cave = new SpriteCave();
		addToLayer(cave, LAYER_CAVE);

		world = new World().generateFlatWorld();
		addToLayer(world, LAYER_CAVE + 10);

		cave.screenCenter();
		cave.y = world.members[Math.floor(World.WORLD_WIDTH / 2) - 1].y - cave.height;

		player = new SpriteAnimatedPlayer(0, 0);
		player.screenCenter();
		addToLayer(player);

		if (PREVIOUS_PLAYER_POS != null)
			player.setPosition(PREVIOUS_PLAYER_POS.x, PREVIOUS_PLAYER_POS.y);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		cave.setColorTransform(1.0, 1.0, 1.0);

		if (player != null)
			if (!player.interacting)
			{
				if (player.overlaps(cave))
					if (player.x > cave.getGraphicMidpoint().x - player.width)
						if (player.x < cave.getGraphicMidpoint().x + player.width)
							cave.setColorTransform(1.5, 1.5, 1.5);

				applyGravity();

				applyControls();
			}
	}

	public function applyGravity()
	{
		player.y += player.height;

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
			if (FlxColorTransformUtil.hasRGBAMultipliers(cave.colorTransform))
			{
				trace('Cave transition (${player.x} : ${cave.getGraphicMidpoint().x})');

				PREVIOUS_PLAYER_POS = player.getPosition();

				player.animation.play('interact');
				switchToLayer(player, LAYER_CAVE + 1);

				FlxTween.tween(player, {y: player.y + (player.height * 2)}, 2, {
					onComplete: function(t)
					{
						player.destroy();
						player = null;

						switchState(new StateCave());
					}
				});
			}
		}
	}

	public function applyHorizontalMovement(amount:Float)
	{
		if (player.animation.name != 'walk')
			player.animation.play('walk');
		player.x += amount;

		world.forEach(function(block)
		{
			if (player.overlaps(block))
				player.x -= -amount;
		});
	}
}
