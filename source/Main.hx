package;

import flixel.FlxGame;
import modding.PolymodHandler;
import modules.ModuleHandler;
import openfl.display.Sprite;
#if sys
import sys.FileSystem;
#end

class Main extends Sprite
{
	public function new()
	{
		super();

		var sysMods = [];

		#if sys
		for (mod in FileSystem.readDirectory('mods/'))
		{
			if (FileSystem.isDirectory('mods/$mod'))
				sysMods.push(mod);
		}
		#end

		PolymodHandler.scriptShit();
		PolymodHandler.loadMods(sysMods);
		ModuleHandler.loadModules();
		
		addChild(new FlxGame(0, 0, states.BlankState));
	}
}
