package;

import flixel.FlxGame;
import modding.PolymodHandler;
import openfl.display.Sprite;
#if sys
import sys.FileSystem;
#end

class Main extends Sprite
{
	public function new()
	{
		super();

		PolymodHandler.forceReloadAssets();
		
		addChild(new FlxGame(0, 0, states.BlankState));
	}
}
