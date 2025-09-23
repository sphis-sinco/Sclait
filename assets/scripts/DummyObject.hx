import events.CreateEvent;
import events.UpdateEvent;
import modules.Module;

class DummyModule extends Module
{
	override public function new()
	{
		super('dummy-object');
	}

	override function onCreate(event:CreateEvent)
	{
		super.onCreate(event);

		trace(event.module);
	}

	override function onUpdate(event:UpdateEvent)
	{
		super.onUpdate(event);
	}
}
