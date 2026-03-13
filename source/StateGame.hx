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

		cave.screenCenter();
		cave.y = world.members[Math.floor(World.WORLD_WIDTH / 2) - 1].y - cave.height;

		player = new SpriteAnimatedPlayer(0, 0);
		player.screenCenter();
		addToLayer(player);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		cave.setColorTransform(1.0, 1.0, 1.0);

		if (player.overlaps(cave))
			if (player.x > cave.getGraphicMidpoint().x - player.width)
				if (player.x < cave.getGraphicMidpoint().x + player.width)
					cave.setColorTransform(1.5, 1.5, 1.5);

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
				player.animation.play('idle');
		}

		if (FlxG.keys.anyPressed([E, ENTER]))
		{
			if (cave.hasColorTransform())
			{
				trace('Cave transition (${player.x} : ${cave.getGraphicMidpoint().x})');
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
