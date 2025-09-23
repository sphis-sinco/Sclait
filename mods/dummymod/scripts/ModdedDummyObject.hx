import Object.ObjectCreateEvent;

class ModdedDummyObject extends Object
{
	override public function new()
	{
		super('modded-dummy-object');
	}

	override function onCreate(event:ObjectCreateEvent)
	{
		super.onCreate(event);

                trace(event.object.toString());
	}
}
