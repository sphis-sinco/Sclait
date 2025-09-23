package modding;

import events.CreateEvent;
import events.UpdateEvent;
import modules.Module;
import polymod.Polymod;

class PolymodHander
{
	public static function addImports()
	{
		Polymod.addDefaultImport(Module);
                
		Polymod.addDefaultImport(CreateEvent);
		Polymod.addDefaultImport(UpdateEvent);
	}

	public static function loadMods(dirs:Array<String>)
	{
		var results = Polymod.init({
			modRoot: 'mods/',
			dirs: dirs,
			errorCallback: onError,
			ignoredFiles: Polymod.getDefaultIgnoreList(),
			useScriptedClasses: true,
		});
	}

	public static function onError(error:PolymodError)
	{
		trace('[${error.severity}] (${Std.string(error.code).toUpperCase()}): ${error.message}');
	}
}
