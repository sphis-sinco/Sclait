package;

import events.CreateEvent;
import events.UpdateEvent;
import flixel.FlxState;
import modules.ModuleEvent;
import modules.ModuleHandler;

class PlayState extends FlxState
{
	override public function create()
	{
		super.create();
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
}
