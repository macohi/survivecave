import flixel.util.FlxColorTransformUtil;
import flixel.tweens.FlxTween;
import flixel.FlxG;

class StateCave extends StateGameplay
{
	public var cave:SpriteCave;

	public var layer_cave:Int = 0;
	
	override public function new()
	{
		super();

		layer_cave = layer_world - 10;
	}

	override function applyConditionals()
	{
		super.applyConditionals();

		player.setColorTransform(1.0, 1.0, 1.0);
		cave.setColorTransform(1.0, 1.0, 1.0);

		if (player.overlaps(lastBlockInWorldBackdrop))
			player.setColorTransform(1.0, 1.0, 0.75);

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
			trace('Cave (Cave) transition (${player.x} : ${cave.getGraphicMidpoint().x})');

			player.animation.play('interact-vertical');
			switchToLayer(player, layer_cave + 1);

			FlxTween.tween(player, {y: player.y + (player.height * 2)}, 2, {
				onComplete: function(t)
				{
					switchState(new StateCave());
				}
			});
		}

		if (FlxColorTransformUtil.hasRGBAMultipliers(player.colorTransform))
		{
			player.animation.play('interact-side');
			player.setColorTransform(1.0, 1.0, 1.0);

			FlxTween.tween(player, {x: FlxG.width}, 2, {
				onComplete: function(t)
				{
					switchState(new StateGame());
				}
			});
		}
	}

	var lastBlockInWorldBackdrop:SpriteBlock;

	override function create()
	{
		super.create();

		var cave_world_backdrop:World = StateInit.cave_world_backdrop.copy();
		addToLayer(cave_world_backdrop, 1);

		world = new World().generateFlatWorld('dirt_block', null, 4);
		addToLayer(world, layer_world);

		lastBlockInWorldBackdrop = cast cave_world_backdrop.members[cave_world_backdrop.members.length - 1];

		player.setPosition(lastBlockInWorldBackdrop.x + lastBlockInWorldBackdrop.width, lastBlockInWorldBackdrop.y - (player.height * 1.5));

		player.animation.play('interact-side');

		FlxTween.tween(player, {x: player.x - lastBlockInWorldBackdrop.width * 2}, 2, {
			onComplete: function(t)
			{
				player.animation.play('idle');
			},
			onUpdate: function(t)
			{
				applyGravity();
			}
		});

		cave = new SpriteCave(true);
		addToLayer(cave, layer_cave);

		cave.y = world.members[Math.floor(World.WORLD_WIDTH / 2) - 1].y - cave.height;
		cave.x = cave.width * 2;

		#if LIGHT_GROUP
		light = new SpriteGroupLight(5, 0, 0);
		add(light);
		light.screenCenter();
		#end
	}

	public var light:SpriteGroupLight;
}
