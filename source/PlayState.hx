package;

import Object.ObjectCreateEvent;
import Object.ObjectUpdateEvent;
import flixel.FlxState;

class PlayState extends FlxState
{
	public var objects:Array<Object> = [];

	override public function create()
	{
		super.create();
		for (object in objects)
			object.onCreate(new ObjectCreateEvent(object));
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		for (object in objects)
			object.onUpdate(new ObjectUpdateEvent(object, elapsed));
	}
}
