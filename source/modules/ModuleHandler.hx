package modules;

class ModuleHandler
{
	static var modules:Array<Module> = [];

	public static function destroyModules()
	{
		if (modules.length > 0)
			for (module in modules)
			{
				module.destroy();
				modules.remove(module);
			}
	}

	public static function loadModules()
	{
		destroyModules();

		var newModules = ScriptedModule.listScriptClasses();
		for (module in newModules)
		{
			var newmod = ScriptedModule.init(module, module);
			modules.push(newmod);
		}
	}

	public static function getModule(id:String):Module
	{
		for (module in modules)
			if (module.id == id)
				return module;

		return null;
	}
}
