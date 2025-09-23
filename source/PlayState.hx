package;

import Object.ObjectCreateEvent;
import Object.ObjectUpdateEvent;
import flixel.FlxG;
import flixel.FlxState;
import flixel.math.FlxMath;

class PlayState extends FlxState
{
	public var objects:Array<Object> = [];

	override public function create()
	{
		super.create();
		var objectId:String = 'OBJECT_${Math.random() * 256}';
		var obj:ScriptedObject = ScriptedObject.init('BasicObject', objectId);

		objects.push(obj);

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
