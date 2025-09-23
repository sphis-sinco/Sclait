import events.CreateEvent;
import events.FocusEvent;
import events.UpdateEvent;
import modules.Module;
import modules.ModuleHandler;

class LinkingModule extends Module
{
	override public function new()
	{
		super('linking-module');
	}

	override function onFocusGained(event:FocusEvent)
	{
		super.onFocusGained(event);

		var mtl = ModuleHandler.getModule('module-to-link');
		mtl.scriptSet('linked', !mtl.scriptGet('linked'));

	}
}
