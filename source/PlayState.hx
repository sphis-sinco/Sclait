package;

import events.CreateEvent;
import events.UpdateEvent;
import flixel.FlxState;
import modules.ModuleEvent;
import modules.ModuleHandler;

class PlayState extends FlxState
{
	public static var instance:PlayState;

	override public function create()
	{
		super.create();
		if (instance != null)
			instance = null;
		instance = this;

		ModuleHandler.callEvent(module ->
		{
			module.onCreate(new CreateEvent(module));
		});
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		ModuleHandler.callEvent(module ->
		{
			module.onUpdate(new UpdateEvent(module, elapsed));
		});
	}
	override function destroy()
	{
		super.destroy();

		instance = null;
	}
}
