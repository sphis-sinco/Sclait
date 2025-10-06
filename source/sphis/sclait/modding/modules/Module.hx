package sphis.sclait.modding.modules;

import flixel.util.FlxDestroyUtil.IFlxDestroyable;
import sphis.sclait.modding.events.CreateEvent;
import sphis.sclait.modding.events.FocusEvent;
import sphis.sclait.modding.events.StateSwitchEvent;
import sphis.sclait.modding.events.UpdateEvent;

class Module implements IFlxDestroyable
{
	public var id:String;

	public function new(id:String)
	{
		trace('Inited new module of id: $id');
		this.id = id;
	}

	public function toString():String
		return 'Module(id: $id)';

	// the events

	public function onCreate(event:CreateEvent) {}

	public function onUpdate(event:UpdateEvent) {}

	public function onStateSwitchPre(event:StateSwitchEvent) {}

	public function onStateSwitchPost(event:StateSwitchEvent) {}

	public function onFocusGained(event:FocusEvent) {}

	public function onFocusLost(event:FocusEvent) {}

	public function destroy() {}
}
