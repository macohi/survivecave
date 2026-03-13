import flixel.math.FlxPoint;
import flixel.util.FlxColorTransformUtil;
import flixel.tweens.FlxTween;

class StateGame extends StateGameplay
{
	public var cave:SpriteCave;

	public static var PREVIOUS_PLAYER_POS:FlxPoint;

	public var layer_cave:Int = 0;

	override function switchState(state:State)
	{
		if (player != null)
			PREVIOUS_PLAYER_POS = player.getPosition();

		super.switchState(state);
	}

	override public function new()
	{
		super();

		layer_cave = layer_world - 10;
	}

	override public function create()
	{
		super.create();

		cave = new SpriteCave();
		addToLayer(cave, layer_cave);

		if (PREVIOUS_PLAYER_POS != null)
			player.setPosition(PREVIOUS_PLAYER_POS.x, PREVIOUS_PLAYER_POS.y);

		world = new World().generateFlatWorld('dirt_block', 'grass_block');
		addToLayer(world, layer_world);

		cave.screenCenter();
		cave.y = world.members[Math.floor(World.WORLD_WIDTH / 2) - 1].y - cave.height;
	}

	override function applyConditionals()
	{
		super.applyConditionals();

		cave.setColorTransform(1.0, 1.0, 1.0);

		if (player.overlaps(cave))
			if (player.x > cave.getGraphicMidpoint().x - player.width)
				if (player.x < cave.getGraphicMidpoint().x + player.width)
					cave.setColorTransform(1.5, 1.5, 1.5);
	}

	override function applyInteractionCheck()
	{
		super.applyInteractionCheck();

		if (FlxColorTransformUtil.hasRGBAMultipliers(cave.colorTransform))
		{
			trace('Cave transition (${player.x} : ${cave.getGraphicMidpoint().x})');

			PREVIOUS_PLAYER_POS = player.getPosition();

			player.animation.play('interact-vertical');
			switchToLayer(player, layer_cave + 1);

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
