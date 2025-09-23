package;

class Object
{
	public var id:String;

	public function new(id:String)
	{
                trace('Inited new object of id: $id');
		this.id = id;
	}

	public function onCreate(event:ObjectCreateEvent) {}

	public function onUpdate(event:ObjectUpdateEvent) {}
}

class ObjectCreateEvent
{
	public var object:Object;

	public function new(object:Object)
	{
		this.object = object;
	}
}

class ObjectUpdateEvent
{
	public var object:Object;
	public var elapsed:Float;

	public function new(object:Object, elapsed:Float)
	{
		this.object = object;
		this.elapsed = elapsed;
	}
}
