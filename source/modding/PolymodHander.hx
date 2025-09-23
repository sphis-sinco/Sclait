package modding;

import polymod.Polymod;

class PolymodHander
{
	public static function addImports()
	{
		Polymod.addImportAlias('modules.Module', modules.Module);

		Polymod.addImportAlias('events.CreateEvent', events.CreateEvent);
		Polymod.addImportAlias('events.UpdateEvent', events.UpdateEvent);
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
