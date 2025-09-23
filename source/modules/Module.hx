package modules;

import events.CreateEvent;
import events.UpdateEvent;
import flixel.util.FlxDestroyUtil.IFlxDestroyable;

class Module implements IFlxDestroyable
{
	public var id:String;

	public function new(id:String)
	{
		trace('Inited new module of id: $id');
		this.id = id;
	}

	public function toString():String
		return 'Module($id)';

	// the events

	public function onCreate(event:CreateEvent) {}

	public function onUpdate(event:UpdateEvent) {}

	public function destroy() {}
}
