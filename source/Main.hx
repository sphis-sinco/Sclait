package;

import events.CreateEvent;
import events.UpdateEvent;
import flixel.FlxGame;
import modules.Module;
import openfl.display.Sprite;
import polymod.PolymodHander;
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

		PolymodHander.addImports();
		PolymodHander.loadMods(sysMods);
		addChild(new FlxGame(0, 0, PlayState));
	}
}
