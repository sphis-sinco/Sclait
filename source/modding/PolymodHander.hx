package modding;

import polymod.Polymod;
import polymod.format.ParseRules;

class PolymodHander
{
	public static function addImports()
	{
		Polymod.addImportAlias('modules.Module', modules.Module);

		Polymod.addImportAlias('events.CreateEvent', events.CreateEvent);
		Polymod.addImportAlias('events.UpdateEvent', events.UpdateEvent);
	}

	public static function buildParseRules():polymod.format.ParseRules
	{
		var output:polymod.format.ParseRules = polymod.format.ParseRules.getDefault();
		// Ensure TXT files have merge support.
		output.addType('txt', TextFileFormat.LINES);
		// Ensure script files have merge support.
		output.addType('hscript', TextFileFormat.PLAINTEXT);
		output.addType('hxs', TextFileFormat.PLAINTEXT);
		output.addType('hxc', TextFileFormat.PLAINTEXT);
		output.addType('hx', TextFileFormat.PLAINTEXT);

		// You can specify the format of a specific file, with file extension.
		// output.addFile("data/introText.txt", TextFileFormat.LINES)
		return output;
	}

	public static function buildIgnoreList():Array<String>
	{
		var result = Polymod.getDefaultIgnoreList();

		result.push('.git');
		result.push('.gitignore');
		result.push('.gitattributes');
		result.push('README.md');

		result.push('.haxelib');

		return result;
	}

	public static function loadMods(dirs:Array<String>)
	{
		var results = Polymod.init({
			modRoot: 'mods/',
			dirs: dirs,
			errorCallback: onError,
			ignoredFiles: buildIgnoreList(),
			useScriptedClasses: true,
			loadScriptsAsync: #if html5 true #else false #end,
			framework: OPENFL,
			parseRules: buildParseRules()
		});
	}

	public static function onError(error:PolymodError)
	{
		trace('[${error.severity}] (${Std.string(error.code).toUpperCase()}): ${error.message}');
	}
}
