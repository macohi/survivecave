import flixel.util.FlxColorTransformUtil;
import flixel.tweens.FlxTween;
import flixel.FlxG;

class StateCave extends StateGameplay
{
	override function applyConditionals()
	{
		super.applyConditionals();

		player.setColorTransform(1.0, 1.0, 1.0);

		if (player.overlaps(lastBlockInWorldBackdrop))
			player.setColorTransform(1.0, 1.0, 0.75);
	}

	override function applyInteractionCheck()
	{
		super.applyInteractionCheck();

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

		player.setPosition(lastBlockInWorldBackdrop.x, lastBlockInWorldBackdrop.y - (player.height * 1.5));

		player.animation.play('interact-side');

		FlxTween.tween(player, {x: player.x - lastBlockInWorldBackdrop.width}, 2, {
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
}
