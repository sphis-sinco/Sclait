package sphis.sclait.modding.events;

import sphis.sclait.modding.modules.Module;
import sphis.sclait.modding.modules.ModuleEvent;

class UpdateEvent extends ModuleEvent
{
	public var elapsed:Float;

	public function new(module:Module, state:String, elapsed:Float)
	{
		super(module, state);
		this.elapsed = elapsed;
	}

	override function toString():String
		return 'UpdateEvent(module: $module, state: $state, elapsed: $elapsed)';
}