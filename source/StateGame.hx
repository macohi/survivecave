import flixel.FlxG;
import lime.app.Application;
import flixel.text.FlxText;

class StateGame extends State
{
	public var cave:SpriteCave;

	public var world:World;

	public var player:SpriteAnimatedPlayer;

	public var versionText:FlxText = new FlxText(0, 0, 0, 'Survivecave Indev ${Application.current.meta.get('version')}', 8);

	override public function create()
	{
		super.create();

		addToLayer(versionText, 1000);

		cave = new SpriteCave();
		addToLayer(cave);

		world = new World().generateFlatWorld();
		addToLayer(world);

		player = new SpriteAnimatedPlayer(0, 0);
		player.screenCenter();
		addToLayer(player);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		applyGravity();

		applyControls();
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
			{
				player.animation.play('idle');
			}
		}
	}

	public function applyHorizontalMovement(amount:Float)
	{
		if (player.animation.name != 'walk')
		{
			player.animation.play('walk');
		}

		player.x += amount;

		world.forEach(function(block)
		{
			if (player.overlaps(block))
				player.x -= -amount;
		});
	}
}
