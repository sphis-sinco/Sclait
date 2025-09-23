package;

import Object.ObjectCreateEvent;
import Object.ObjectUpdateEvent;
import flixel.FlxGame;
import openfl.display.Sprite;
import polymod.Polymod.PolymodError;
import polymod.Polymod;
import sys.FileSystem;

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

		Polymod.addDefaultImport(Object);
		Polymod.addDefaultImport(ObjectCreateEvent);
		Polymod.addDefaultImport(ObjectUpdateEvent);

		loadMods(sysMods);
		addChild(new FlxGame(0, 0, PlayState));
	}

	private function loadMods(dirs:Array<String>)
	{
		var results = Polymod.init({
			modRoot: 'mods/',
			dirs: dirs,
			errorCallback: onError,
			ignoredFiles: Polymod.getDefaultIgnoreList(),
			useScriptedClasses: true,
		});
	}

	private function onError(error:PolymodError)
	{
		trace('[${error.severity}] (${Std.string(error.code).toUpperCase()}): ${error.message}');
	}
}
