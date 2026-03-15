package states.gameplay;

import flixel.math.FlxPoint;
import flixel.util.FlxColorTransformUtil;
import flixel.tweens.FlxTween;
import flixel.FlxG;

class StateCave extends StateGameplay
{
	public var cave:SpriteCave;

	public var interactionsLayer:Int = 0;

	public static var PREVIOUS_PLAYER_POS:FlxPoint;

	override function switchState(state:State)
	{
		if (player != null)
			PREVIOUS_PLAYER_POS = player.getPosition();

		super.switchState(state);
	}

	override public function new()
	{
		super(2);

		interactionsLayer = worldLayer - 10;
	}

	override function applyConditionals()
	{
		super.applyConditionals();

		player.setColorTransform(1.0, 1.0, 1.0);
		cave.setColorTransform(1.0, 1.0, 1.0);

		if (player.overlaps(lastBlockInWorldBackdrop))
			player.setColorTransform(1.0, 1.0, 0.75);

		if (player.overlaps(cave))
			cave.setColorTransform(1.5, 1.5, 1.5);
	}

	override function applyInteractionCheck()
	{
		super.applyInteractionCheck();


		if (FlxColorTransformUtil.hasRGBAMultipliers(cave.colorTransform))
		{
			trace('Cave (Cave) transition');

			PREVIOUS_PLAYER_POS = player.getPosition();
			player.animation.play('interact-vertical');
			switchToLayer(player, interactionsLayer + layers[interactionsLayer - 1].members.length + 1);

			FlxTween.tween(player, {y: player.y + (player.height * 2)}, 2, {
				onComplete: function(t)
				{
					player = null;

					switchState(new GUIMining());
				}
			});
		}

		if (FlxColorTransformUtil.hasRGBAMultipliers(player.colorTransform))
		{
			PREVIOUS_PLAYER_POS = null;
			player.animation.play('interact-side');
			player.setColorTransform(1.0, 1.0, 1.0);

			FlxTween.tween(player, {x: FlxG.width}, 2, {
				onComplete: function(t)
				{
					player = null;

					switchState(new StateOverworld());
				}
			});
		}
	}

	var lastBlockInWorldBackdrop:SpriteBlock;

	override function create()
	{
		super.create();

		var cave_world_backdrop:GroupWorld = StateInit.caveWorldBG.copy();
		addToLayer(cave_world_backdrop, 1);

		world = new GroupWorld().generateFlatWorld('dirt_block', null, 4);
		addToLayer(world, worldLayer);

		lastBlockInWorldBackdrop = cast cave_world_backdrop.members[cave_world_backdrop.members.length - 1];

		if (PREVIOUS_PLAYER_POS != null)
			player.setPosition(PREVIOUS_PLAYER_POS.x, PREVIOUS_PLAYER_POS.y);
		else
		{
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
		}

		cave = new SpriteCave(true);
		addToLayer(cave, interactionsLayer);

		cave.y = world.members[Math.floor(GroupWorld.WORLD_WIDTH / 2) - 1].y - cave.height;
		cave.x = cave.width * 2;
	}
}
